---
name: video-ninja
description: >-
  Master orchestrator for video production with agents. Routes to 44 installed video skills
  across 6 upstream repositories and adds a proven video-pipeline methodology layer.
  Use for ANY video task: making, editing, cutting, captioning, animating, rendering, reviewing
  or publishing a video, motion graphic, promo, launch film, product demo, talking-head package,
  changelog reel, explainer, lyric video, slideshow deck, or Remotion project.
  Covers transcript-driven cutting, caption doctrine, motion craft and quality doctrine,
  body/framing awareness, color setups, media and sound design, and deterministic render pipelines.
  Triggers: video, vídeo, make a video, editar vídeo, corte, cortar, edit, trim, legendar,
  caption, legenda, subtitulo, animate, animação, motion graphic, motion design, promo, launch
  video, teaser, trailer, ad, comercial, product film, product demo, demo reel, showreel,
  sizzle, explainer, faceless, faceless-explainer, talking head, podcast, interview, overlay,
  kinetic typography, lower third, kinetic title, storyboard, slideshow, deck, pitch deck,
  changelog video, release video, lyric video, beat sync, render, mp4, composition, HyperFrames,
  Remotion, GSAP, LUT, grade, color grade, BGM, SFX, sound design, voiceover, TTS, thumbnail,
  screen recording, tutorial video, SaaS video, founder video.
---

# Video Ninja

**Jump Skill** — Master orchestrator that routes video tasks to 46 installed skills from 7 upstream
repositories and 1 fonte externa well-known, plus a methodology layer distilled from the
My-Little-Studio pipeline.

> **PT-BR**: este ninja roteia qualquer tarefa de vídeo para as skills instaladas. Ele é o ponto de
> entrada obrigatório — leia-o antes de escolher uma skill de vídeo.

---

## Por que este ninja existe

Os 7 repositórios abaixo cobrem **motor de render**, **motor de processamento**, **craft**, **framework** e **estilos artísticos** — mas cada um deles é um
 silo. O HyperFrames sabe renderizar mas não tem opinião sobre qualidade. O motion-video-kit tem
opinião mas não tem motor. O Remotion é uma framework alternativa, não um complemento. O opus-video-skills
traz estilos visuais únicos (aquarela, kinetic typography) mas não tem a doutrina dos outros.
O ffmpeg-skill processa material existente mas não cria composições do zero.

Este ninja é a camada que **escolhe** e **encadeia**, e que sabe o que **não** existe no mercado.

---

## Regra de ouro

> **`/hyperframes` é o ponto de entrada obrigatório para trabalho de vídeo.**
> Ele decide entre os 10 workflows e carrega os domínios sob demanda. Este ninja **não substitui**
> esse roteamento — ele diz *qual camada* usar e *quando o HyperFrames sozinho não basta*.

Se a tarefa é criar/editar/animar/renderizar vídeo, comece em `/hyperframes`. Volte aqui para as
exceções (Remotion, captura de tela, doutrina de craft, método de pipeline).

---

## As 7 fontes

| Repositório | Skills | Camada | Status |
|---|---|---|---|
| [`heygen-com/hyperframes`](https://github.com/heygen-com/hyperframes) | 27 | Motor de render + domínios | Instalado, Apache-2.0 |
| [`kajisho5/ffmpeg-skill`](https://github.com/kajisho5/ffmpeg-skill) | 1 (42 tools) | Motor de processamento | Instalado, MIT |
| [`echris6/motion-video-kit`](https://github.com/echris6/motion-video-kit) | 1 | Doutrina de qualidade | Instalado, MIT |
| [`remotion-dev/skills`](https://github.com/remotion-dev/skills) | 12 | Framework 2ª opção | Instalado |
| [`Rieranthony/product-film-skill`](https://github.com/Rieranthony/product-film-skill) | 1 | Captura de tela | Instalado, MIT |
| [`tugrawork-creator/saas-motion-kit`](https://github.com/tugrawork-creator/saas-motion-kit) | 1 | Variety/anti-repetição | Instalado |
| [`tuzhechen2005/opus-video-skills`](https://github.com/tuzhechen2005/opus-video-skills) | 2 | Estilos artísticos procedurais | Instalado, MIT |

Provenance completa em `~/.agents/.skill-lock.json`. Detalhes em
[references/repos.md](references/repos.md).

### Skill externa instalada

| Fonte | Skill | Papel | Instalação |
|---|---|---|---|
| [`fframes.studio`](https://fframes.studio) | `fframes-video` | Motor alternativo Rust/SVG com Skia GPU, FFmpeg e QA legível por agentes | Well-known, instalado globalmente |

## Mapa de motores

A tabela da imagem mistura motores de composição, frameworks de projeto e um editor de arquivos.
Use esta distinção antes de escolher o workflow:

| Motor | Modelo de trabalho | Quando escolher | Estado no ninja |
|---|---|---|---|
| **HyperFrames** | HTML/CSS/JS em Chrome headless + FFmpeg | Composição nova, motion design e vídeo dirigido por agente | Padrão, instalado |
| **ffmpeg-skill** | Probe → edição → validação de arquivos existentes | Cortar, juntar, normalizar áudio, multicam e entrega | Processamento, instalado |
| **fframes-video** | Rust/SVG por frame, Skia GPU, FFmpeg e CLI de inspeção | Render vetorial de alta vazão, batch e revisão automatizada | Motor alternativo, instalado |
| **Remotion** | React/TypeScript, render local ou Lambda | Projeto React existente, port de composição ou render distribuído | Framework alternativa, instalada |
| **Motion Canvas / Revideo** | TypeScript com generators; Revideo acrescenta player React, render headless e entradas dinâmicas | Motion Canvas para animação vetorial com editor; Revideo para templates parametrizados e render em Node/serverless | Alternativa avaliada; sem skill instalada |
| **MoviePy** | Python com clips, composição e efeitos sobre frames | Pipeline Python orientado a dados ou protótipo de composição | Alternativa avaliada; sem skill instalada |

Motion Canvas, Revideo e MoviePy não devem aparecer como capacidades instaladas até existir uma skill com
roteamento, contrato de render e verificação. Se um projeto já usa uma dessas tecnologias, o ninja
pode preservá-la e aplicar a mesma doutrina de movimento, áudio e validação.

O Remotion exige uma checagem de licença antes de produção: o código é source-available e a licença
gratuita cobre indivíduos e organizações de até três pessoas; equipes maiores ou automações podem
exigir Company License. Não o classifique como MIT ou como open source OSI.

---

## Roteamento

### Passo 1 — É vídeo de verdade?

Se **não** for vídeo, este ninja não se aplica:

| Pedido | Vai para |
|---|---|
| Website/app | `impeccable`, `apple-design` |
| Só animação de UI (não vídeo) | `animate`, `improve-animations` (pack Emil Kowalski) |
| Só copy/roteiro de marketing | `copywriting`, `social` |

### Passo 2 — Roteie pelo entregável

**Deixe `/hyperframes` decidir entre os 10 workflows.** Ele tem a tabela de prioridade autoritativa.
Este ninja só precisa saber a **camada**:

| Pedido | Workflow | Camada extra do ninja |
|---|---|---|
| Legenda em talking-head | `/embedded-captions` | + `/captions-overlay` |
| Cards de overlay em podcast | `/talking-head-recut` | + `/cut-the-curve` |
| Promo de produto/URL | `/product-launch-video` | + `/motion-doctrine`, `/seam-craft` |
| Changelog semanal em vídeo | `/changelog-video` | — |
| Gravação de tela → demo | **`/product-film`** (skill dedicada) | ver §Remotion |
| Filmografia de negócio (real, IA, premium) | **`/business-motion-film`** | ver §Doutrina |
| Promo SaaS anti-repetição | **`/saas-motion-video`** | ver §Doutrina |
| Cartoon aquarela / lyric video karaoke | **`/painted-animation`** | ver §Estilos Artísticos |
| Showreel tipográfico / portfolio cinético | **`/kinetic-reel`** | ver §Estilos Artísticos |
| Motion gerado como código, loop ou animação por frames | **`/hyperframes`** | + `/motion-doctrine`, ver §Motion Lab |
| **Cortar/juntar/processar material existente** | **`ffmpeg-skill`** | ver §FFmpeg |
| **Ajustar loudness para plataforma** | **`ffmpeg-skill`** | ver §FFmpeg |
| **Remover silêncios de gravação** | **`ffmpeg-skill`** | ver §FFmpeg |
| **Sincronizar múltiplas câmeras** | **`ffmpeg-skill`** | ver §FFmpeg |
| Vídeo vetorial com render GPU e QA por CLI | **`fframes-video`** | ver §fframes |
| Projeto existente em Motion Canvas/Revideo | **Motion Canvas/Revideo** | usar somente se a dependência já existir; aplicar §Doutrina |
| Pipeline Python de composição ou dados | **MoviePy** | usar somente se Python for requisito; finalizar com §FFmpeg |
| Explainers, PR, música, deck, motion, livre | os 10 workflows | — |

### Passo 3 — Carregue os domínios

Faixa Transversal: sempre que houver fotografia/mídia, **considere `/media-use`**.
Motion é obrigatório: **sempre carregue `/motion-doctrine` antes de compor** qualquer animação
(ver §Doutrina — ele se declara GATEWAY e supersede orientação genérica).

---

## As 8 camadas

| # | Camada | Skills | Responsabilidade |
|---|---|---|---|
| 1 | **Motor de render** | `hyperframes`, `hyperframes-cli`, `hyperframes-core` | HTML→vídeo determinístico. `core` é o contrato de composição — leia antes de escrever HTML |
| 2 | **Motor de processamento** | `ffmpeg-skill` (42 tools) | probe→edit→verify. Corte, join, loudness, legendas, HDR→SDR, multicam, batch |
| 3 | **Motor alternativo** | `fframes-video` | Rust/SVG, Skia GPU, render por faixa, inspeção de frames, snapshots e análise de áudio |
| 4 | **Workflows** | `general-video`, `product-launch-video`, `talking-head-recut`, `embedded-captions`, `faceless-explainer`, `pr-to-video`, `music-to-video`, `motion-graphics`, `slideshow`, `figma`, `changelog-video` | O entregável final |
| 5 | **Doutrina de craft** | `motion-doctrine`, `cut-the-curve`, `seam-craft`, `oversized-cursor`, `captions-overlay`, `business-motion-film`, `saas-motion-video` | **Opinião sobre qualidade.** É o que separa "renderizou" de "parece bom" |
| 6 | **Domínios** | `hyperframes-animation`, `hyperframes-keyframes`, `hyperframes-creative`, `hyperframes-audio`, `media-use`, `hyperframes-registry`, `hyperframes-studio` | Movimento, câmera, design, som, mídia, blocos prontos |
| 7 | **Framework 2ª** | `remotion-*` (12), `product-film` | Quando Remotion é a escolha certa |
| 8 | **Estilos artísticos** | `painted-animation`, `kinetic-reel` | Estilos visuais procedurais únicos (aquarela, kinetic typography) |

---

## §Doutrina — a camada que o motor não tem

Esta é a parte que **não** é óbvia e que separa este ninja de um índice de skills.

### `/motion-doctrine` — GATEWAY, carregue primeiro

> *"These rules SUPERSEDE generic / upstream motion guidance."*

Sem ele, um vídeo multi-cena vira uma pilha de slides animados independentemente. Com ele, vira
**um movimento de câmera contínuo**. Cobre: a lei do vetor (como você sai determina como entra),
o Z scale-sign, elementos carriers, movimento causal, o Seam Gate, e a **proibição de idle wobble**
(movimento precisa **performar**, não respirar).

Roteia para as técnicas de baixo nível: `/cut-the-curve`, `/oversized-cursor`, `/seam-craft`.

### `/cut-the-curve` — o catálogo de técnicas

Cinco costuras com velocidade casada (zoom-through, zoom-through inverso, cut-the-curve, waterfall
cut, rack-focus blur-cut) + duas técnicas in-scene (waterfall ENTRY em cascata, nudge curve
slow-fast-slow). Inclui a razão 10/65/25 de slides.

**Leia antes de:** authoring qualquer transição, handoff texto→batida, entrada cinética, ou
reposição de grupo.

### `/seam-craft` — corretude de render

Prerequisitos para transições compvarem certo na timeline mestra. Carregue ao montar `index.html`
e **sempre** quando aparecer **flash branco** num corte ou crossfade — especialmente em filmes
escuros. Cobre o guard de stage-ground opaco (`#root background`).

### `/business-motion-film` — o crítico independente

O único dos 5 que traz um **loop de crítica**: um construtor e um crítico severo separado, com
quality bar explícita. Princípios de movimento destilados de **28 filmes de launch profissionais**.
Cobre sound design e um playbook de oferta de negócio. Usa Three.js seletivamente.

**Use quando** a qualidade importa mais que a velocidade, e o resultado vai para um cliente.

### `/saas-motion-video` — anti-repetição

Tone matrix, variety audit, atlas de 24 transições, **100 temas de storyboard**. O problema que
ele resolve: dois vídeos de produto não podem parecer o mesmo. 7-stage process.

### `/captions-overlay` — legenda é overlay

Modelo `drop` / `rail` / `embed` (35 estilos no catálogo). A regra: legenda é **overlay composto
sobre o filme**, nunca uma faixa reservada no rodapé para a qual você empurra o conteúdo.
Aplica-se **por cima** de `/embedded-captions`.

### `/oversized-cursor` — casa

Cursor macOS gigante. Use quando a cena tiver cursor, quando uma ação é lede por ponteiro, ou
quando a cena está estática/morta e precisa de movimento de alto rendimento e baixo custo.

### Camada de som

`/hyperframes-audio` = mixagem de áudio já posicionado na composição (fade, crossfade, gain,
automação, ducking/carve de VO, cadeias de efeitos, submix bus). `/media-use` = **fonte** de
mídia. Nunca troque: `/media-use` busca e gera, `/hyperframes-audio` mistura o que já está na trilha.

---

## §FFmpeg — motor de processamento

Fonte: [`kajisho5/ffmpeg-skill`](https://github.com/kajisho5/ffmpeg-skill)

*"Give your coding agent a video editor."* — Local FFmpeg · No cloud · No API keys

Enquanto o HyperFrames **cria** vídeo (HTML → MP4), o ffmpeg-skill **processa** material existente.
São complementares: um renderiza composições do zero, o outro manipula arquivos reais.

### Workflow estruturado

```
probe (medir) → edit (lossless quando possível) → check (validar) → verify (contact sheet)
```

A diferença-chave: o agente não "chuta" parâmetros. Primeiro faz probe do material (duração, fps,
resolução, HDR, canais de áudio), depois age baseado em dados reais, e verifica o resultado.

### 42 ferramentas

| Grupo | Tools |
|---|---|
| Análise | `probe`, `scenes`, `look` |
| Edição | `cut`, `join`, `silence`, `fit`, `crop`, `cropdetect`, `denoise`, `stabilize`, `reverse`, `speedramp`, `loop`, `freeze`, `pad`, `broll`, `metadata`, `grid` |
| Áudio | `audio`, `sync`, `loudness` |
| Imagem | `caption`, `overlay`, `graphics`, `color` |
| Entrega | `export`, `proxy`, `check`, `report` |
| Orquestração | `render`, `batch`, `multicam`, `verify` |

### Quando usar

| Tarefa | Use |
|--------|-----|
| Criar vídeo do zero (promo, explainer, motion graphic) | HyperFrames |
| Cortar/juntar/processar material existente | **ffmpeg-skill** |
| Ajustar loudness para plataforma | **ffmpeg-skill** |
| Remover silêncios de gravação | **ffmpeg-skill** |
| Sincronizar múltiplas câmeras | **ffmpeg-skill** |
| Converter HDR→SDR para delivery | **ffmpeg-skill** |
| Adicionar legendas em vídeo existente | **ffmpeg-skill** |
| Renderizar composição HTML→MP4 | HyperFrames |

### Presets de entrega

Templates prontos para: `tiktok`, `reels`, `shorts`, `youtube`, `x`, `linkedin`, `facebook`, `podcast`.

```bash
python3 $S/export.py input.mp4 --preset reels --json
python3 $S/render.py talk.mp4 --template tiktok --cues cues.txt
python3 $S/check.py output.mp4 --platform youtube   # PASS/WARN/FAIL
```

### Instalação

```bash
npx ffmpeg-skill --all        # instala para Claude, Cursor e Codex
npx ffmpeg-skill doctor       # verifica componentes FFmpeg disponíveis
```

**Requisitos:** FFmpeg 5.0+, Python 3.9+ (standard library only).

---

## §fframes — motor alternativo

Fonte: [`dmtrKovalenko/fframes`](https://github.com/dmtrKovalenko/fframes), skill instalada via
[`fframes.studio`](https://fframes.studio).

Use `fframes-video` quando o vídeo for predominantemente vetorial e o ganho de render GPU,
inspeção automatizada ou batch compensar a complexidade de Rust e das bibliotecas nativas.

O ciclo recomendado é:

```
timeline → inspect → strip/frame/onion → audio analyze → render --draft → render
```

`inspect` verifica fontes, imagens, SVG, cortes de texto e falhas sem renderizar todos os pixels;
`strip`, `frame`, `onion` e `snapshot` produzem evidência visual; `audio analyze` mede LUFS, true
peak, clipping e silêncios. A skill exige revisar essas saídas antes de declarar o vídeo pronto.

O motor é MIT, mas a instalação exige Rust, Skia/Metal/Vulkan ou backend CPU, `libclang`, `nasm`,
Ninja e codecs FFmpeg conforme o alvo. O desempenho anunciado pelo projeto é uma hipótese para o
benchmark local, não uma garantia do ninja.

Não use `fframes-video` para editar material existente: continue usando `ffmpeg-skill` para probe,
cortes, normalização, multicam e entrega.

---

## §Alternativas a complementar

As alternativas da imagem cobrem necessidades reais, mas ainda não têm integração de agente no
mesmo nível do HyperFrames. A complementação deve acontecer como adaptadores pequenos e verificáveis:

1. **Skill Revideo/Motion Canvas:** começar pelo Revideo, que já expõe `renderVideo()`, player React,
   entradas dinâmicas e render paralelo; cobrir também o scaffold Motion Canvas, generators,
   sincronização de áudio, exportação FFmpeg, `check` e integração com `motion-doctrine`/`seam-craft`.
2. **Skill MoviePy:** API v2, composição orientada a dados, efeitos e áudio; delegar operações de
   arquivo ao `ffmpeg-skill` e terminar com `check`/`verify`.
3. **Matriz de benchmark:** comparar os quatro caminhos em determinismo, tempo de render, alpha,
   áudio, 1080×1920, execução local/servidor e custo/licença.
4. **Detecção de capacidade:** o roteador deve informar quando Motion Canvas ou MoviePy não estão
   instalados, em vez de encaminhar para uma skill inexistente.

Esse trabalho complementa o ninja sem duplicar o que o `ffmpeg-skill` já resolve.

---

## §Estilos Artísticos — aquarela e kinetic typography

Fonte: [`tuzhechen2005/opus-video-skills`](https://github.com/tuzhechen2005/opus-video-skills)

Duas skills que produzem vídeo **inteiramente em código** — cada frame é função pura do tempo,
sem modelos generativos. Renderiza em headless Chrome + ffmpeg.

### `/painted-animation` — cartoon aquarela animado

Desenha cada shot com p5.js e a biblioteca p5.brush de aquarela. Personagens têm biblioteca de
expressões e princípios de movimento. Music videos são cortados no beat medido, lyric videos
carregam legendas karaoke palavra-por-palavra.

**Use quando:** curta animado, music video, lyric video com karaoke, estilo "pintado à mão",
aquarela, tinta, cartoon com personagens.

**Dependências extra:** Python 3 com numpy (só para tempo detection).

### `/kinetic-reel` — showreel tipográfico com WebGL

Combina canvas 2D de tipografia com camadas three.js (terreno de partículas, marble líquido,
chrome knot, nuvem que condensa em forma) e post-pass WebGL. Shots ligados por transições de
continuidade de forma. Score sintetizado da mesma timeline da imagem.

**Use quando:** portfolio reel, showreel, work reel, product intro, tipografia cinética com
efeitos visuais 3D.

**Nota de overlap:** `/motion-graphics` do HyperFrames também faz kinetic typography, mas sem as
camadas WebGL específicas (particle terrain, liquid marble). Use `/kinetic-reel` quando quiser
esses efeitos visuais 3D específicos.

### Recomendação de modelo

Funciona melhor com Claude Opus 5.5, mas não é obrigatório — outros modelos podem usar as skills
com resultados variáveis.

---

## §Motion Lab — motion em código, do brief ao loop validado

Use este método para loops, product films e peças de motion geradas como código. Comece em
`/hyperframes`, carregue `/motion-doctrine` e trate o modelo como autor do programa que desenha os
frames — cada quadro precisa ser reproduzível e inspecionável.

Antes de gerar o código, transforme o brief em uma lista de estados com intervalos de frames: uma
ação principal por shot, o handoff para o próximo e o que precisa continuar igual (produto, forma,
proporções, marca). Especifique objetivo, engine, formato, resolução, fps, duração, câmera e
parâmetros mensuráveis. Troque pedidos vagos como “parece premium” por decisões observáveis; nomeie
os padrões visuais proibidos e atualize essa lista depois de ver a primeira renderização.

Peça recursos de revisão dentro do próprio preview — frame labels, playhead ou marcações de beat —
para conferir timing e pousos; remova-os da exportação final. Faça render de stills antes do vídeo
completo, revise uma contact sheet e frames adjacentes aos problemas, e limite cada rodada a um ou
dois ajustes descritos com frame e medida. Faça uma auditoria numérica separada da crítica visual.
Duas a quatro rodadas são uma referência do artigo, não um limite obrigatório.

Para som, escreva cues ligados aos frames e meça o arquivo decodificado para checar sync, loudness,
true peak e clipping, e escute a mixagem final. Métricas não substituem a revisão auditiva. Em loops
de N frames, renderize `0..N-1` e use `phase = frame / N` com ciclos inteiros para fechar a costura.
O artigo relata um alvo de -14 LUFS/-1 dBTP e hits de som cerca de um frame após a imagem; trate
esses números como referência daquele laboratório e confirme as exigências do destino.

Separe fatos do produto de decisões criativas. Use telas, logos e assets reais; confira a lista de
assets antes de animar e pare para pedir o que estiver faltando, sem desenhar uma interface de
substituição. Para referências visuais, derive uma gramática de estilo permitida e não replique
shots ou assets sem autorização. Componha cada proporção como variante própria e revise cada uma.
Guarde brief, state list, referências, assets aprovados, critérios de aceite e recibos por etapa;
gates devem permitir retomar, pedir informação ou parar quando faltar evidência.

Procedimento, checklist e comparação das fontes em
[references/motion-lab.md](references/motion-lab.md). As fontes originais são [Opus 5.5 Motion
Lab](https://x.com/i/article/2105052379590578176), de [@flxrnc](https://x.com/flxrnc/status/2105311836190978392),
e [Motion Engineering](https://x.com/0xwhrrari/status/2105643919119696297), de
[@0xwhrrari](https://x.com/0xwhrrari). O texto arquivado do primeiro artigo não inclui prompts que
estavam embutidos em imagens ou vídeos.

---

## §Remotion — quando não é HyperFrames

O HyperFrames é o default. Remotion entra em 3 casos:

| Caso | Skill |
|---|---|
| Port explícito de fonte Remotion → HyperFrames | `/remotion-to-hyperframes` (um caminho só, Remotion→HF) |
| Projeto Remotion existente que deve **continuar** Remotion | `/remotion-best-practices` + `/remotion-markup` + `/remotion-render` |
| **Captura de tela → product film** | `/product-film` (AVAssembly, sem ffmpeg, sem editor) |

`/product-film` é auto-contido: Cada quadro é função pura do tempo, sem CSS transitions, sem
`Date.now()`. Regra não-negociável: **o design do produto vence** — tokens, componentes, landing
page e copy reais. Roda ao lado do codebase do produto, reusa componentes de verdade.

Demais `remotion-*`: `remotion-create`, `remotion-captions`, `remotion-studio`, `remotion-multimedia`,
`remotion-interactivity`, `remotion-maps`, `remotion-saas`, `remotion-upgrade`, `remotion-docs`.

---

## §Método My-Little-Studio

Quatro técnicas que o mercado de skills de vídeo **não tem** — pesquisadas e confirmadas como
lacuna em set/2026. Só importam quando o ninja está dentro de um **projeto de pipeline** (produção
recorrente), não num vídeo único.

| Técnica | Por quê ninguém tem |
|---|---|
| **Rastreabilidade com sha256** — cada etapa grava a impressão digital do que leu e **recusa rodar** se o dado de antes mudou, dizendo qual comando falta | Nenhum repo de skills implementa staleness detection |
| **A "fita"** — ASR decodificando **letra a 20 ms**, preservando retomadas que transcrição comercial **esconde** | Todo mundo usa Whisper/ElevenLabs/ASR cloud, que junta as duas tentativas. É o único jeito de cortar no início da sílaba sem erro |
| **Setup de cor reutilizável** — LUT + ganho + nitidez calibrados uma vez por câmera/luz/cenário | Nenhuma skill de color grading; e `/media-use` resolve LUT por clip, não por câmera |
| **Mapa de corpo** — RTMPose/MediaPipe → onde um elemento cabe sem encostar no corpo. Medido: **LLM erra 12% da largura da tela** | Nenhum repo. Posicionamento nunca pode vir de modelo de linguagem |

Mais os **quadros visuais** (desenhar sobre o vídeo quadro a quadro em HTML e exportar frame +
instrução + traços — a IA lê o desenho melhor que o texto) como forma de pedir algo específico.

Detalhes completos, com os aprendizados: [references/metodologia-mls.md](references/metodologia-mls.md).

---

## §Registry — 173 blocos prontos

Antes de construir qualquer visual nomeado, **busque no registry**:

```bash
npx hyperframes add <busca>       # ex: "camera dolly", "bar chart", "glass title"
npx hyperframes catalog           # lista o que está instalado
```

Já existem `camera-dolly-zoom`, `bar-chart-race`, `beat-freeze-cut`, `camcorder-hud`,
carousels, titles de vidro, etc. Usar `/hyperframes-registry` **antes** de codar à mão economiza
tempo e herda a corretude de render.

---

## Guardrails

1. **`/hyperframes` primeiro.** Ele é o roteador autoritativo entre workflows. Não force um
   workflow à mão se a tabela de prioridade dele não casar.
2. **Doutrina antes de animação.** `/motion-doctrine` é GATEWAY e supersede orientação genérica.
   Animar sem ele é o erro mais caro deste pipeline.
3. **Não reserve faixa de legenda.** Legenda é overlay. Ver `/captions-overlay` constraint #13.
4. **Positions never from an LLM.** Qualquer decisão de coordenada em tela vem de medição
   (rastreamento), nunca de "parece que fica ali". O erro medido foi de 12% da largura.
5. **Mídia fotográfica sempre passa por `/media-use`.** Deixar mídia adequada sem alteração é um
   resultado válido — mas a varredura tem que acontecer.
6. **Confirmar antes de render.** `render`, `publish` e `batch-render` custam tempo e API.
   `check` é barato e roda sempre.
7. **Pin de versão.** Um projeto faz pin de `hyperframes@<versão>` e o pin não sobe sozinho.
   Antes do primeiro render: `npx hyperframes@latest upgrade --project . --check`.

---

## Manutenção

| O quê | Comando | Nota |
|---|---|---|
| Skills HyperFrames publicadas | `npx hyperframes skills` | Set publicado completo |
| Refresh de uma skill específica | `npx hyperframes skills update <name>` | |
| Diagnosticar staleness | `npx hyperframes skills check` | Sai != 0 se stale |
| Atualizar os outros repos | `npx skills update -g` | Atualiza pelo lockfile |
| Sync dos repos-fonte (não faz nada aqui) | `./sync-repos.sh` | Este ninja é `no-sync` — ver abaixo |

### Este ninja é `no-sync`

As 46 skills já são consumidas como agent skills instaladas. Clonar os 7 repos-fonte adicionaria
~510 MB (489 MB só do `hyperframes`) sem ganho funcional. Por isso o `video-ninja` está na lista
`NEVER_CLONE_NINJAS` do `sync-repos.sh` e marcado com `no-sync` no `repos.md` — um
`./sync-repos.sh` (todos ou `video-ninja`) o **pula**.

A garantia é testada: `./tests/test-no-sync.sh` (roda no CI via `no-sync-guard.yml`).

> ⚠️ **As 6 skills de doutrina interna** (`motion-doctrine`, `cut-the-curve`, `seam-craft`,
> `oversized-cursor`, `captions-overlay`, `changelog-video`) são `metadata: internal: true` no
> upstream. A CLI **não as instala** e `npx hyperframes skills` faz *prune de skills não-publicadas*
> — então elas podem sumir num update. Estão registradas no lockfile como `internal-doctrine`.
> Se sumirem, reinstale copiando de `.agents/skills/<nome>/` do repo (sparse checkout).
