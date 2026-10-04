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

**Jump Skill** — Master orchestrator that routes video tasks to 45 installed skills from 7 upstream
repositories, plus a methodology layer distilled from the My-Little-Studio pipeline.

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
| **Cortar/juntar/processar material existente** | **`ffmpeg-skill`** | ver §FFmpeg |
| **Ajustar loudness para plataforma** | **`ffmpeg-skill`** | ver §FFmpeg |
| **Remover silêncios de gravação** | **`ffmpeg-skill`** | ver §FFmpeg |
| **Sincronizar múltiplas câmeras** | **`ffmpeg-skill`** | ver §FFmpeg |
| Explainers, PR, música, deck, motion, livre | os 10 workflows | — |

### Passo 3 — Carregue os domínios

Faixa Transversal: sempre que houver fotografia/mídia, **considere `/media-use`**.
Motion é obrigatório: **sempre carregue `/motion-doctrine` antes de compor** qualquer animação
(ver §Doutrina — ele se declara GATEWAY e supersede orientação genérica).

---

## As 7 camadas

| # | Camada | Skills | Responsabilidade |
|---|---|---|---|
| 1 | **Motor de render** | `hyperframes`, `hyperframes-cli`, `hyperframes-core` | HTML→vídeo determinístico. `core` é o contrato de composição — leia antes de escrever HTML |
| 2 | **Motor de processamento** | `ffmpeg-skill` (42 tools) | probe→edit→verify. Corte, join, loudness, legendas, HDR→SDR, multicam, batch |
| 3 | **Workflows** | `general-video`, `product-launch-video`, `talking-head-recut`, `embedded-captions`, `faceless-explainer`, `pr-to-video`, `music-to-video`, `motion-graphics`, `slideshow`, `figma`, `changelog-video` | O entregável final |
| 4 | **Doutrina de craft** | `motion-doctrine`, `cut-the-curve`, `seam-craft`, `oversized-cursor`, `captions-overlay`, `business-motion-film`, `saas-motion-video` | **Opinião sobre qualidade.** É o que separa "renderizou" de "parece bom" |
| 5 | **Domínios** | `hyperframes-animation`, `hyperframes-keyframes`, `hyperframes-creative`, `hyperframes-audio`, `media-use`, `hyperframes-registry`, `hyperframes-studio` | Movimento, câmera, design, som, mídia, blocos prontos |
| 6 | **Framework 2ª** | `remotion-*` (12), `product-film` | Quando Remotion é a escolha certa |
| 7 | **Estilos artísticos** | `painted-animation`, `kinetic-reel` | Estilos visuais procedurais únicos (aquarela, kinetic typography) |

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

As 45 skills já são consumidas como agent skills instaladas. Clonar os 7 repos-fonte adicionaria
~510 MB (489 MB só do `hyperframes`) sem ganho funcional. Por isso o `video-ninja` está na lista
`NEVER_CLONE_NINJAS` do `sync-repos.sh` e marcado com `no-sync` no `repos.md` — um
`./sync-repos.sh` (todos ou `video-ninja`) o **pula**.

A garantia é testada: `./tests/test-no-sync.sh` (roda no CI via `no-sync-guard.yml`).

> ⚠️ **As 6 skills de doutrina interna** (`motion-doctrine`, `cut-the-curve`, `seam-craft`,
> `oversized-cursor`, `captions-overlay`, `changelog-video`) são `metadata: internal: true` no
> upstream. A CLI **não as instala** e `npx hyperframes skills` faz *prune de skills não-publicadas*
> — então elas podem sumir num update. Estão registradas no lockfile como `internal-doctrine`.
> Se sumirem, reinstale copiando de `.agents/skills/<nome>/` do repo (sparse checkout).
