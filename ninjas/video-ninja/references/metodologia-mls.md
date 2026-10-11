# Metodologia My-Little-Studio

Quatro técnicas que o mercado de skills de vídeo **não tem**, mais os quadros visuais.
Extraídas do pipeline privado do My-Little-Studio (Iago Russi Ferla, set/2026), verificado por
pesquisa em set/2026 contra os repos de skills de vídeo existentes.

> **Quando isto se aplica:** só quando o ninja está dentro de um **projeto de pipeline** (produção
> recorrente de vários vídeos), não na produção de um vídeo único. Para vídeo único, o
> HyperFrames já resolve.

---

## A arquitetura de referência: Pipes and Filters

O My-Little-Studio é Pipes and Filters (análogo aos pipes do Unix).

- **Filtros** = *runners*, scripts que fazem **uma coisa só**. Rodáveis e testáveis isoladamente.
- **Pipes** = o acervo (uma pasta por vídeo) + o rastro (trilha de execução).
- Regra central: metade **determinística** (scripts) + metade **não determinística** (a conversa
  com o agente).

No artigo: 29 runners, 10 skills. Skills são **manuais de procedimento** — não explicam cada
script, explicam *quando usar, qual script rodar, com quais parâmetros e onde olhar se der
problema*. Só quando algo quebra o agente abre o código.

### O mapeamento para cá

| MLS | Equivalente no pack HyperFrames |
|---|---|
| Runner (script determinístico) | Composição HTML + `npx hyperframes` CLI |
| Acervo (pasta por vídeo) | Projeto HyperFrames (`.claude/` scaffold) |
| Rastro (trilha) | `npx hyperframes timeline`, `history`, `BRIEF.md` |
| Recibo de execução | `BRIEF.md` + storyboard + histórico do projeto |
| **Refusa se o dado mudou** | ❌ **não existe** — ver §1 |
| Skills de procedimento | Os 10 workflows + domínios |

---

## §1 — Rastreabilidade com sha256 (a maior lacuna)

### O problema

Num pipeline longo, o agente revisa o corte. Depois alguém roda o script de corte de novo. O
arquivo muda. A revisão já está obsoleta — mas nada impede que ela seja aplicada. O vídeo final
está errado e **ninguém sabe por quê**.

### A solução

Cada etapa grava a impressão digital (hash sha256) de **cada arquivo que leu**, junto com o que
decidiu. Antes de trabalhar, a etapa confere as impressões digitais:

- Se batem → roda
- Se não batem → **recusa**, e diz exatamente qual comando falta

Além disso, cada execução deixa um **recibo**: o que entrou, o que saiu, os parâmetros, o tempo
e o custo. Três desfechos possíveis:

| Desfecho | O que acontece |
|---|---|
| Deu certo | Segue |
| Falhou | **Nada parcial fica no acervo** |
| Já estava feito | Nada é refeito nem pago |

No artigo isso aconteceu de verdade: a revisão foi recusada **duas vezes** porque uma etapa
anterior tinha rodado de novo.

### Por que implementar

Não existe em nenhum repo de skills de vídeo. Custo: uma função de hash e um arquivo de estado
por vídeo. Benefício: elimina uma classe inteira de bug silencioso em produção recorrente.

### Como implementar aqui

```bash
# a cada etapa, registre o que leu
sha256sum "$arquivo_de_entrada" >> .rastro/"$etapa".hash

# antes de aplicar uma decisão
npx hyperframes timeline --json > .estado_atual.json
diff <(cat .rastro/revisao.hash) <(sha256sum .estado_atual.json | cut -d' ' -f1) \
  || { echo "REVIEW STALE — rode a revisão de novo"; exit 1; }
```

---

## §2 — A "fita" (ASR letra a 20 ms)

### O problema

Para cortar vídeo falado, você precisa saber **onde cada sílaba começa**. Uma transcrição comum
não serve por dois motivos:

1. **Esconde as retomadas.** Se você gravou "vamos ver isso / vamos ver isso", a transcrição
   comercial junta as duas tentativas numa só — e você perde a informação de que a **segunda** foi
   a boa.
2. **Erra o tempo.** A AssemblyAI erra o fim da palavra em até 150 ms.

### A solução

Um modelo ASR rodando **local** que decodifica **a cada 20 ms**, letra por letra:

```
jonatasgrosman/wav2vec2-large-xlsr-53-portuguese
```

Com a fita: os trechos de voz são achados, a última tentativa de cada frase repetida é mantida, e
cada borda do corte é colocada **no início da sílaba**.

### Por que implementar

Busca por "ASR com nível de letra" / "transcrição que preserva repetição" em repos de skills de
vídeo retorna **zero**. Todo mundo usa Whisper/ElevenLabs/ASR cloud, que têm exatamente o
comportamento oposto. E é o único jeito de cortar no início da sílaba sem erro audível.

No artigo a fita foi comparada com 8 bibliotecas em teste de estresse: foi a única que rodou local
e markou repetições.

### Aplicação no HyperFrames

`/media-use` faz transcrição e legendas por um motor de áudio compartilhado. Para corte de
talking-head fino, a fita é o upgrade: substitua a fonte de tempo por decodificação em nível de
letra e derive os pontos de corte dela.

---

## §3 — Setup de cor reutilizável

### O problema

`/media-use` resolve LUT, grade e setup de cor — mas resolve **por clipe**. Cada vídeo recomeça
a calibração.

### A solução

Um **Setup** = LUT + ganho + nitidez, calibrado **uma vez** para uma combinação de câmera, luz e
cenário, e **guardado para os próximos vídeos**.

O `color-grade` do MLS aplica o Setup inteiro como uma operação. Guardado em disco, reutilizável.

### Por que implementar

Nenhuma skill de color grading oferece isso — todas tratam LUT como propriedade do clipe. Em
produção recorrente com a mesma câmera e a mesma luz, essa é a diferença entre "consistente" e
"parece que foi feito em 12 sessões diferentes".

### Aplicação

Guardar setups como assets versionados no projeto HyperFrames e reaplicar via `/media-use`.

---

## §4 — Mapa de corpo para framing

### O problema

"Coloca o card aqui embaixo, à direita do rosto." É a instrução mais natural do mundo e a que
gera mais resultado errado. Qualquer LLM que você chame para escolher coordenadas está adivinhando.

### A solução

Três ferramentas de rastreamento, todas locais e rodando sem GPU:

| Ferramenta | Papel |
|---|---|
| **YuNet** (OpenCV) | Acha o rosto |
| **MediaPipe** (Google) | Recorta a silhueta do fundo |
| **RTMPose** | Segue duas mãos, rosto e ombros, quadro a quadro |

Com isso, um **mapa do corpo** nomeia as partes do quadro (cabeça, tronco, braços, mãos) e diz
onde um elemento cabe **sem encostar em você**.

### A regra C1

Margem por parte do corpo, em px:

| Parte | Margem |
|---|---|
| Cabeça | 80 |
| Tronco | 40 |
| Braço | 15 |
| Mão | 0 |

O `framing-query` também diz **o que fez o elemento encolher** e **por que**.

### O número que importa

> **Posição nunca vem de um modelo de linguagem.**
> O Gemini errou **12% da largura da tela**.

Medido, não estimado. É o argumento definitivo para separar o que é decisão de LLM do que é
medição.

### Por que implementar

Zero resultados em qualquer repo. É a técnica mais desperatemente necessária por todo editor de
vídeo com AI e a menos disponível.

---

## §5 — Quadros visuais (prompts visuais)

### O problema

A geração com IA "vai bem" mas não vem o que você tinha na cabeça. Difícil fazer a ferramenta
entender uma coisa visual **em texto**.

### A solução

Um quadro que funciona quase como um Premiere: mostra o vídeo **quadro a quadro**, você **desenha
por cima** e escreve instruções. Como é HTML, exporta exatamente:

- em qual quadro você estava
- qual era a instrução
- o desenho

**E a IA lê o desenho melhor do que o texto.** Vendo o rascunho, ela entendeu o que o autor
queria melhor do que ele tinha conseguido explicar só com palavras.

No primeiro rascunho do vídeo do artigo: **123 traços e 15 notas**.

### Bônus que ninguém espera

Depois de ver o desenho, a IA **explica em texto o que entendeu** — e melhor do que o autor. Essas
explicações viram prompts melhores para os scripts automatizados futuros.

### Os 3 quadros

| Quadro | Para que serve | O que exporta |
|---|---|---|
| **Rascunho** | Animações | Desenhos sobre o vídeo, quadro a quadro |
| **Animação** | Timing | Vídeo inteiro + cada animação separada, frame a frame; advance/volta quadro a quadro; apontar onde travou |
| **Corte** | Corte | Marcar o que está errado na agulha; o agente muda e **explica o que mudou** |

### O conceito mais valioso do artigo

> *"Cada correção vira aprendizado para os próprios scripts: o projeto se melhora a cada rodada."*

O quadro de corte não é só uma ferramenta — é o **loop de melhoria** do pipeline. O mesmo padrão
existe no `/business-motion-film` como loop de crítico independente. Os dois convergem para a
mesma ideia: **um separador que julga o resultado, separado de quem constrói**.

---

## Resumo de custo/benefício

| Técnica | Custo de implementar | Benefício | Lacuna no mercado |
|---|---|---|---|
| §1 Rastreabilidade sha256 | Baixo (hash + state file) | Elimina bug silencioso | ❌ Nenhum |
| §2 A fita | Médio (modelo + decoder) | Corte no início da sílaba | ❌ Nenhum |
| §3 Setup de cor | Baixo (versionar assets) | Consistência entre vídeos | ❌ Nenhum |
| §4 Mapa de corpo | Médio (3 libs) | Posicionar sem errar | ❌ Nenhum |
| §5 Quadros visuais | Alto (HTML + export) | Pedir algo específico | Parcial — `/hyperframes-studio` tem storyboard, mas não desenho sobre o vídeo |

**Recomendação de ordem**: §1 primeiro (barato, elimina uma classe de bug), depois §3 (barato,
ganho imediato), depois §4 (o maior ganho de qualidade), depois §5, e §2 só se cortar talking-head
fino for caso comum.

---

## §6 — Remake mode (recriação frame-locked de vídeo de lançamento)

### O problema

Cliente pede: *"recria o vídeo de lançamento do [Produto X] para a minha marca"*. O resultado
esperado é um vídeo lado-a-lado "original | opus 5.5 copy" que demonstra a capacidade de replicar
um estilo profissional. Mas nenhuma skill tem o workflow estruturado para isso.

### A solução

Workflow em 4 fases, do repo [`howseen-ai/claude-motion-design`](https://github.com/howseen-ai/claude-motion-design):

| Fase | O que faz |
|---|---|
| **0 — Análise** | Download do vídeo de referência (REF), extração de todos os frames, detecção de hard cuts por diff de média absoluta, contact sheets 6 frames, escrita de `SPEC.md` (tabela de shots id/f0–f1/conteúdo/swap rules) |
| **1 — Engine** | Motor `seek(F)` puro (index.html + core.js), registro de SHOT, câmera, cursor, words, pixelDissolve, **palette filter** que re-hue qualquer cor residual da marca original |
| **2 — Build paralelo** | 4 contiguous groups de shots → 4 agents paralelos (cada um escreve só `shots/Gx.js` e verifica com compare sheets lado-a-lado). 5º agent = áudio: analisa REF (BPM, drop, hits, VO slots via STT), encontra track royalty-free em Mixkit, stretcha ≤8%, corta em barras para drops baterem, synthesiza SFX nos mesmos tempos |
| **3 — Integração** | Render em 3 chunks paralelos, mux, encode split-screen (2 painéis + gap + labels "original" / "opus 5.5 copy", `setsar=1`), QA de cor/frame |

### Regras de honestidade

- Nunca reusar música/voz/fotos de pessoas do REF
- Não falar "feito em 15 minutos" se não foi
- Tag/creditar a marca original no post
- Nenhum co-mark falso (tipo "OpenAI × SuaMarca")

### Por que implementar

Nenhum dos 7 repos do video-ninja tem este workflow. O HyperFrames renderiza, o motion-video-kit
julga, mas nenhum estrutura a **análise de referência** + **paralelização por grupos de shots** +
**palette filter** + **QA lado-a-lado**.

### Aplicação

1. Use a análise de shots (Fase 0) para qualquer vídeo de referência — não só remake
2. O palette filter é reutilizável para garantir que nenhuma cor da marca original vaze
3. O split-screen encode é o formato de entrega para demonstrar skill em LinkedIn/X

### Bônus: tabela de SFX Mixkit mapeados

O repo traz IDs prontos para download:

| Som | ID Mixkit |
|---|---|
| click | 1125 |
| key | 2568 |
| soft tick | 1117 |
| check | 1113 |
| toggle | 1120 |
| toast | 2573 |
| pop | 2364 |
| bubble | 2357 |
| soap | 2925 |
| whoosh | w1490 |
| rise | w1489 |
| flip | w1485 |
| impact | 1143 |
| shutter | 1430 |
| lens | 1433 |
| sparkle | 3083 |
| success | 2865 |

URL: `https://assets.mixkit.co/active_storage/sfx/<id>/<id>-preview.mp3`

### Spring presets validados

| Uso | Stiffness (k) | Damping (d) |
|---|---|---|
| UI snappy | 320 | 30 |
| Containers/câmera | 170 | 26 |
| Type/logos pesados | 120 | 24 |
| Mascots playful | 180 | 12 |

Regra: damping ratio ≥ 0.72 (sem bounce cartoon).

---

## Resumo de custo/benefício

| Técnica | Custo de implementar | Benefício | Lacuna no mercado |
|---|---|---|---|
| §1 Rastreabilidade sha256 | Baixo (hash + state file) | Elimina bug silencioso | ❌ Nenhum |
| §2 A fita | Médio (modelo + decoder) | Corte no início da sílaba | ❌ Nenhum |
| §3 Setup de cor | Baixo (versionar assets) | Consistência entre vídeos | ❌ Nenhum |
| §4 Mapa de corpo | Médio (3 libs) | Posicionar sem errar | ❌ Nenhum |
| §5 Quadros visuais | Alto (HTML + export) | Pedir algo específico | Parcial — `/hyperframes-studio` tem storyboard, mas não desenho sobre o vídeo |
| §6 Remake mode | Médio (workflow + scripts) | Recriar vídeo de lançamento | ❌ Nenhum |

**Recomendação de ordem**: §1 primeiro (barato, elimina uma classe de bug), depois §3 (barato,
ganho imediato), depois §4 (o maior ganho de qualidade), depois §6 (quando cliente pedir remake),
depois §5, e §2 só se cortar talking-head fino for caso comum.

---

## §7 — Prompting Motion Design (Anthropic Blueprint)

Baseado no paper "Prompting Opus 5.5 - Motion Design" (Raphaël Aubry / Howseen AI, out/2026),
que aplica a estrutura oficial de prompting da Anthropic ao domínio de motion design.

### O conceito central

> **O modelo não faz vídeo. Ele escreve um programa que faz.**

Pipeline real: `prompt → index.html com seek(t) → Playwright screenshots → ffmpeg → MP4`

A regra de determinismo é o que torna tudo possível: o frame é função pura do tempo, então
"corrige o wobble em 4.2s" é uma instrução tratável. Sem isso, cada fix é um re-roll do vídeo
inteiro.

### O contrato de render (4 linhas, sempre no prompt)

```
Every film is a pure function of time:
window.seek(t) paints frame t, nothing else.
No CSS transitions, no setTimeout, no requestAnimationFrame in render mode,
and no state carried between frames. Seeded noise only (mulberry32), never Math.random.
```

### Estrutura de 10 partes (Anthropic canonical)

| # | Parte | O que vai nela para motion |
|---|---|---|
| 1 | Task context | Quem o modelo é: director, animator, sound designer, render engineer |
| 2 | Tone context | House look em 2 linhas + o que é banido |
| 3 | Background data | Arquivos de referência, pasta de assets, beat grid medido |
| 4 | Rules | **O contrato de render** — o bloco mais importante |
| 5 | Examples | 1-2 beats escritos como você quer, com timings |
| 6 | Conversation history | O que o projeto já sabe (CLAUDE.md) |
| 7 | Immediate request | Uma frase: o que fazer e em qual tamanho |
| 8 | Gates | Artefatos nomeados em ordem, cada um mostrado antes do próximo |
| 9 | Output format | Entregas por filename + instrução de tamanho para texto |
| 10 | Prefill | Tag de abertura que força o plano antes do código |

**Partes 1 e 7 são as únicas obrigatórias.** A ordem importa: contexto antes de regras, regras
antes de exemplos, exemplos antes do request.

### Os 4 tiers de prompt

| Tier | Tamanho | O que descreve | Resultado |
|---|---|---|---|
| **1 - One-liner** | ~90 chars | Gênero, deixa modelo escolher tudo | Um clip (testa o engine) |
| **2 - Brand brief** | ~1.200 chars | URL + assets reais + 5 beats | Um ad |
| **3 - XML spec** | ~2.500 chars | **State list** no beat grid | Product film |
| **4 - Director's brief** | 9.500-19.000 chars | Character bible, beat sheet, critique loop | Um filme |

**O salto que importa é do tier 2 para o 3.** One-liner e brand brief descrevem um *feeling*;
XML spec descreve uma *lista de estados* — e uma lista de estados pode estar errada de forma
visível e corrigível.

### Os 6 blocos do XML spec (tier 3)

```xml
<inputs>      <!-- o que perguntar antes de codar -->
<direction>   <!-- o look em 5 linhas + banned list -->
<structure>   <!-- state list no beat grid, um estado por beat -->
<build>       <!-- contrato de render: seek(t), springs, subframes -->
<gotchas>     <!-- os 3 erros que você já sabe que o modelo faz -->
<start>       <!-- pede os inputs, mostra state list, espera OK -->
```

**Ordem importa:** `<start>` vai por último. Se for pro topo, o modelo começa a codar sem
coletar inputs.

### 5 linhas para deletar de prompts antigos

| Linha | Por que deletar |
|---|---|
| "double-check your answer" | Modelo já se auto-corrige. Custa extra sem ganho. |
| "think carefully first" | Thinking sempre ligado. Effort é o controle, não a frase. |
| "use a subagent to verify" | Causa over-verification, multiplica custo. |
| "show your reasoning" | Pode ser recusado. Peça "short explanation" em vez. |
| "avoid the generic AI look" | Vago demais. Nomeie os padrões banidos. |

### Banned list que funciona

```
Banned defaults: centered title on a gradient, everything fading in,
corner labels and frame borders, glow on UI chrome, generic particle bursts,
cream or off-white backgrounds, italic accent words, numbered "01/02/03"
section labels, pill-shaped buttons.
```

### Effort levels por tarefa

| Effort | Quando usar |
|---|---|
| `low` | Re-renders, fixes de uma linha, export de formato |
| `medium` | **Default documentado.** Comece todo filme novo aqui. |
| `xhigh` | Filme novo onde o look ainda não foi estabelecido |
| `max` | Os primeiros 3 segundos de algo que precisa funcionar |

**Regra:** defina `max_tokens` alto o suficiente (128.000 para runs longos), e mude effort
por mensagem, não por sessão (mudar invalida cache).

### Critique loop (os 7 eixos)

| Eixo | Score baixo significa |
|---|---|
| Hook nos primeiros 2s | Abertura é title card. Troque pela imagem mais forte. |
| Readability a 360px | Type muito leve, pequeno ou próximo do background |
| Motion quality | Algo desliza em curva fixa em vez de assentar em spring |
| Variety | 2+ segundos passam sem nada novo na tela |
| Composition | Tudo centrado. Frame tem uma ideia só, sem estrutura. |
| Brand accuracy | UI redesenhada de imaginação em vez de cropada de screenshot |
| Sound sync | Cortes caem perto do beat em vez de em cima. Grid ignorado. |

**Comandos ffmpeg para critique:**

```bash
# Contact sheet: 2 fps, 6 colunas
ffmpeg -i out/final.mp4 -vf "fps=2,scale=270:-1,tile=6x5" -frames:v 1 out/contact.png

# Strip: 12 frames consecutivos em torno de 4.2s
ffmpeg -ss 4.1 -i out/final.mp4 -vf "scale=320:-1,tile=12x1" -frames:v 1 out/strip.png

# Phone test: como fica a 360px de largura
ffmpeg -i out/final.mp4 -vf "fps=1,scale=360:-1,tile=5x3" -frames:v 1 out/phone.png

# Loop check: toca 2x seguidas para ver a costura
ffmpeg -stream_loop 1 -i out/final.mp4 -c copy out/loop_check.mp4
```

**A frase que faz funcionar:**

> *"Be a harsh motion director, not a proud author."*

Sem ela, o modelo dá notas generosas pro próprio trabalho e reporta 8 num 6.

### Manter run longo vivo

O modelo para quando emite mensagem sem tool call. Mensagem só-texto = progress report, não
tarefa completa. Pattern de continuação:

```
Your task list still has open items: the animatic and the sound pass.
Continue with them. If one is blocked, say what is blocking it.
```

**Pare após 2-3 continuações automáticas** para evitar runaway loop.

### Subagents: quando delegar

```
Delegate to a subagent only for large, genuinely independent tracks:
one chapter per agent, no more. Do not delegate work you can finish
in a handful of tool calls, and do not use subagents to check your own work.
Write docs/ANIMATION_GUIDE.md before spawning any, so every agent codes
in the same style.
```

### Anti-patterns comuns

| Anti-pattern | Por que quebra |
|---|---|
| Sem referência | Modelo cai em título centrado em gradiente |
| Descrever vibe | "Make it feel premium" não é state list, não pode estar errado |
| Sem contrato de render | Timers e CSS transitions entram, render vira non-deterministic |
| Nomear biblioteca primeiro | Especifique look e constraints; deixe modelo escolher técnica |
| Carregar instruções antigas | "Double-check", "think carefully" custam sem entregar |
| Pular critique loop | A diferença entre clip compartilhado e "ficou mid" |

### O skill que substitui o prompt longo

Uma vez que house rules, banned list e critique loop vivem num arquivo de skill, o próximo
filme é uma frase:

```
/motion-reel for [URL], 20s, vertical, reference ./refs/frame.png
```

---

## Resumo de custo/benefício

| Técnica | Custo de implementar | Benefício | Lacuna no mercado |
|---|---|---|---|
| §1 Rastreabilidade sha256 | Baixo (hash + state file) | Elimina bug silencioso | ❌ Nenhum |
| §2 A fita | Médio (modelo + decoder) | Corte no início da sílaba | ❌ Nenhum |
| §3 Setup de cor | Baixo (versionar assets) | Consistência entre vídeos | ❌ Nenhum |
| §4 Mapa de corpo | Médio (3 libs) | Posicionar sem errar | ❌ Nenhum |
| §5 Quadros visuais | Alto (HTML + export) | Pedir algo específico | Parcial |
| §6 Remake mode | Médio (workflow + scripts) | Recriar vídeo de lançamento | ❌ Nenhum |
| §7 Prompting blueprint | Baixo (templates) | Prompts estruturados para motion | Parcial — guidance existe, aplicação a motion não |

**Recomendação de ordem**: §1 primeiro (barato, elimina bug), depois §3 (barato, ganho imediato),
depois §7 (melhora todo prompt de motion), depois §4 (maior ganho de qualidade), depois §6
(quando cliente pedir remake), depois §5, e §2 só se cortar talking-head fino for caso comum.

---

## Fontes

- Artigo MLS: `https://iago-russi.vercel.app/artigos/pipeline/` — "My-Little-Studio", set/2026
- Modelo da fita: `huggingface.co/jonatasgrosman/wav2vec2-large-xlsr-53-portuguese`
- Rastreamento: `github.com/Tau-J/rtmlib` (RTMPose)
- Remake mode, SFX table, spring presets: `github.com/howseen-ai/claude-motion-design` (Raphaël Aubry / Howseen AI), MIT, out/2026
- Prompting blueprint: "Prompting Opus 5.5 - Motion Design" PDF (Raphaël Aubry / Howseen AI), out/2026
- Verificação de lacunas: busca em repos de skills de vídeo, set-out/2026
