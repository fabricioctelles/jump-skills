# Repositórios do video-ninja

Cada seção traz um repositório fonte das skills daquele ninja. Os 7 já estão **instalados como
skills globais** — por isso este ninja **não** precisa de `sync-repos.sh` (ver nota no fim).

---

## [video-ninja]

Sete repositórios de vídeo que se complementam: um motor de render, um motor de processamento,
uma doutrina de qualidade, uma framework alternativa e três nichos.

```repos
https://github.com/heygen-com/hyperframes
https://github.com/kajisho5/ffmpeg-skill
https://github.com/echris6/motion-video-kit
https://github.com/remotion-dev/skills
https://github.com/Rieranthony/product-film-skill
https://github.com/tugrawork-creator/saas-motion-kit
https://github.com/tuzhechen2005/opus-video-skills
```

| Repositório | Org | Skills | Licença | Papel |
|---|---|---|---|---|
| hyperframes | heygen-com | 27 | Apache-2.0 | Motor de render: HTML → vídeo. 21 publicadas + 6 de doutrina interna |
| ffmpeg-skill | kajisho5 | 1 | MIT | Motor de processamento: probe → edit → verify. 42 tools FFmpeg |
| motion-video-kit | echris6 | 1 | MIT | Doutrina: crítico independente, 28 filmes de launch, quality bar |
| skills | remotion-dev | 12 | — | Remotion oficial (2ª framework) |
| product-film-skill | Rieranthony | 1 | MIT | Captura de tela → product film (AVFoundation) |
| saas-motion-kit | tugrawork-creator | 1 | — | Promo SaaS: tone matrix, 24 transições, 100 temas |
| opus-video-skills | tuzhechen2005 | 2 | MIT | Estilos artísticos procedurais: aquarela animada, kinetic typography |

---

## Frameworks avaliadas, ainda sem skill

Motion Canvas, Revideo e MoviePy aparecem na matriz comparativa, mas não fazem parte das sete fontes
instaladas. Mantê-las nesta seção evita prometer um roteamento que ainda não existe.

| Framework | Licença | Ponto forte | Complemento necessário |
|---|---|---|---|
| [Motion Canvas](https://github.com/motion-canvas/motion-canvas) / [Revideo](https://github.com/midrender/revideo) | MIT | Motion Canvas: generators e editor vetorial. Revideo: player React, `renderVideo()`, entradas dinâmicas e render headless | Skill para scaffold, render, áudio, `check` e integração com a doutrina |
| [MoviePy](https://github.com/Zulko/moviepy) | MIT | Python para cortes, composição, títulos, efeitos e automação orientada a dados | Skill para API v2; operações de arquivo devem continuar no `ffmpeg-skill` |

O Remotion permanece instalado como framework alternativa, mas sua licença é source-available: a
licença gratuita cobre indivíduos e organizações de até três pessoas; equipes maiores precisam
validar a Company License antes de produção.

---

## Skill externa instalada, fora do sync

[`fframes-video`](https://github.com/dmtrKovalenko/fframes/tree/main/skills/fframes-video) foi
instalada pela fonte well-known [`fframes.studio`](https://fframes.studio). Ela não entra no bloco
`repos` porque `video-ninja` permanece protegido por `no-sync` e o repositório Rust completo não é
necessário para usar a skill.

| Fonte | Skill | Licença | Papel |
|---|---|---|---|
| [dmtrKovalenko/fframes](https://github.com/dmtrKovalenko/fframes) via [fframes.studio](https://fframes.studio) | `fframes-video` | MIT | Motor alternativo Rust/SVG com Skia GPU, FFmpeg, inspeção de frames, snapshots e análise de áudio |

Proveniência: `~/.agents/.skill-lock.json`, `sourceType: well-known`, `source: fframes.studio`.

---

## Detalhe: `kajisho5/ffmpeg-skill` — motor de processamento

> ⭐ — skill única, 42 tools. Licença MIT. ~2MB

*"Give your coding agent a video editor."* — Local FFmpeg · No cloud · No API keys

Enquanto o HyperFrames **cria** vídeo (HTML → vídeo), o ffmpeg-skill **processa** vídeo existente
(probe → edit → verify). São complementares: um renderiza composições, o outro manipula material.

**Workflow estruturado:**

```
probe (medir) → edit (lossless quando possível) → check (validar) → verify (contact sheet)
```

A diferença-chave: o agente não "chuta" parâmetros. Primeiro faz probe do material (duração, fps,
resolução, HDR, canais de áudio), depois age baseado em dados reais, e verifica o resultado.

**42 ferramentas** organizadas por grupo:

| Grupo | Tools |
|---|---|
| Análise | `probe`, `scenes`, `look` |
| Edição | `cut`, `join`, `silence`, `fit`, `crop`, `cropdetect`, `deinterlace`, `denoise`, `redact`, `sphere`, `straighten`, `insert`, `background`, `reverse`, `stabilize`, `sequence`, `waveform`, `freeze`, `pad`, `speedramp`, `loop`, `broll`, `metadata`, `grid` |
| Áudio | `audio`, `sync`, `loudness` |
| Imagem | `caption`, `overlay`, `graphics`, `color` |
| Entrega | `export`, `proxy`, `check`, `report` |
| Orquestração | `render`, `batch`, `multicam`, `verify` |

**Contract machine-readable:**

```bash
npx ffmpeg-skill contract --json   # input/output schema de cada tool
npx ffmpeg-skill doctor            # verifica componentes FFmpeg disponíveis
```

O contract inclui `input_schema` derivado do argparse de cada script (SPEC pattern), então nunca
diverge do código real.

**MCP Server:**

```json
{
  "mcpServers": {
    "ffmpeg-skill": {
      "command": "python3",
      "args": ["~/.claude/skills/ffmpeg-skill/mcp/server.py"]
    }
  }
}
```

Lista 12 tools core por default; `FFMPEG_SKILL_MCP_FULL=1` lista todos os 42.

**Verificação:**

- `look.py` — contact sheet PNG para o agente inspecionar visualmente
- `check.py` — PASS/WARN/FAIL contra specs de YouTube, TikTok, Reels, podcast, broadcast
- Sempre faz probe do output e reporta métricas reais

**Presets de entrega:**

```bash
python3 $S/export.py input.mp4 --preset reels --json
python3 $S/render.py talk.mp4 --template tiktok --cues cues.txt
```

Templates para: `tiktok`, `reels`, `shorts`, `youtube`, `x`, `linkedin`, `facebook`, `podcast`.

**Instalação:**

```bash
npx ffmpeg-skill              # Claude Code → ~/.claude/skills/ffmpeg-skill
npx ffmpeg-skill --cursor     # Cursor
npx ffmpeg-skill --codex      # Codex → ~/.agents/skills/ffmpeg-skill
npx ffmpeg-skill --all        # todos
```

**Requisitos:** FFmpeg 5.0+, Python 3.9+ (standard library only).

**Quando usar vs HyperFrames:**

| Tarefa | Use |
|--------|-----|
| Criar vídeo do zero (promo, explainer, motion graphic) | HyperFrames |
| Cortar/juntar/processar material existente | ffmpeg-skill |
| Ajustar loudness para plataforma | ffmpeg-skill |
| Remover silêncios de gravação | ffmpeg-skill |
| Adicionar legendas em vídeo existente | ffmpeg-skill |
| Sincronizar múltiplas câmeras | ffmpeg-skill |
| Renderizar composição HTML→MP4 | HyperFrames |
| Converter HDR→SDR para delivery | ffmpeg-skill |

---

## Detalhe: `heygen-com/hyperframes` — o motor de render

> *"Write HTML. Render video. Built for agents."* — ⭐ 55.8k

Cada animação é uma **página HTML** com o movimento em GSAP. Para virar vídeo: abre a página num
Chrome invisível, avança quadro a quadro, fotografa cada um e junta com FFmpeg. Como é tudo HTML,
qualquer coisa que um navegador desenha vira vídeo, e a mesma página dá sempre o mesmo resultado.

**21 skills publicadas** (`skills/`):

| Grupo | Skills |
|---|---|
| Entrada | `hyperframes` (roteador obrigatório) |
| Domínios | `hyperframes-core`, `hyperframes-animation`, `hyperframes-keyframes`, `hyperframes-creative`, `hyperframes-audio`, `hyperframes-registry`, `hyperframes-studio`, `media-use` |
| CLI | `hyperframes-cli` |
| Workflows | `general-video`, `product-launch-video`, `talking-head-recut`, `embedded-captions`, `faceless-explainer`, `pr-to-video`, `music-to-video`, `motion-graphics`, `slideshow`, `figma`, `remotion-to-hyperframes` |

**6 skills de doutrina interna** (`.agents/skills/`, `metadata: internal: true`):

| Skill | O que é |
|---|---|
| `motion-doctrine` | **GATEWAY.** Lei do vetor, Z scale-sign, Seam Gate, ban on idle wobble. Supersede guidance genérica |
| `cut-the-curve` | 5 costuras com velocidade casada + waterfall ENTRY + nudge curve. Razão 10/65/25 |
| `seam-craft` | Corretude de render de transições. Guard de stage-ground opaco, flash branco |
| `oversized-cursor` | Técnica do cursor macOS gigante como motor de movimento |
| `captions-overlay` | Legenda é OVERLAY, não faixa reservada. Modelos drop/rail/embed |
| `changelog-video` | Changelog `.md` → vídeo de marca, 1080 quadrado, ~45-60s |

⚠️ Estas 6 **não são instaláveis pela CLI** — `internal: true` e fora do índice publicado.
`npx hyperframes skills` faz prune de não-publicadas, então podem sumir num update.

**Registry**: 173 blocos prontos em `registry/blocks/` — `camera-dolly-zoom`, `bar-chart-race`,
`beat-freeze-cut`, `camcorder-hud`, carousels, titles de vidro, cubes, etc.

**Comandos**:

```bash
npx hyperframes skills              # instala o set publicado completo
npx hyperframes skills check        # diagnostica staleness (sai != 0 se stale)
npx hyperframes skills update <n>   # instala/atualiza uma skill
npx hyperframes add <busca>         # busca no registry
npx hyperframes catalog             # lista blocos instalados
```

---

## Detalhe: `echris6/motion-video-kit` — a doutrina

> ⭐ 956 — o repo mais recente instalado (30/09/2026 16:48)

Único dos cinco que traz um **loop de crítica**: um construtor e um crítico severo **separado**,
com quality bar explícita e comparação contra a barra até vencer.

- Princípios de movimento destilados de **28 filmes de launch profissionais**
- Audio rules (sound design)
- Playbook de oferta de negócio
- Three.js seletivo
- Templates e scripts inclusos

Diferença-chave em relação ao HyperFrames: o HyperFrames é **motor**, não tem opinião sobre
qualidade. Este é o que **julga**.

---

## Detalhe: `remotion-dev/skills` — framework alternativa

> ⭐ 4.8k — oficial do Remotion. Versão pinada: `4.0.529`

`remotion-create`, `remotion-best-practices`, `remotion-markup`, `remotion-captions`,
`remotion-multimedia`, `remotion-studio`, `remotion-interactivity`, `remotion-maps`,
`remotion-render`, `remotion-saas`, `remotion-upgrade`, `remotion-docs`.

Entra em 3 casos: port explícito para HyperFrames (`/remotion-to-hyperframes`, um caminho só),
projeto Remotion existente que deve continuar Remotion, ou captura de tela (`/product-film`).

---

## Detalhe: `Rieranthony/product-film-skill` — captura de tela

> ⭐ 385 — skill única em `plugins/product-film/skills/product-film/`

Screen recording → product film com **AVFoundation, sem ffmpeg, sem editor**.

Regras não-negociáveis:

- **O design do produto vence** — tokens, componentes, `rules` files, landing page e copy reais.
  Nunca carregar o gosto de outro produto.
- **Perguntar, não assumir** — entrevistar antes de escrever a história, oferecer opções derivadas
  do que existe no código.
- **Cada quadro é função pura do tempo** — sem CSS transitions/keyframes, sem timers, sem
  `Date.now()`, sem estado entre quadros.

Roda ao lado do codebase do produto, então reusa componentes de verdade e fica editável.

---

## Detalhe: `tugrawork-creator/saas-motion-kit` — anti-repetição

> ⭐ 200 — skill única em `.claude/skills/saas-motion-video/`. ~16MB (100 temas)

*"No two films should feel the same."*

- **Tone matrix** + **variety audit**
- **Atlas de 24 transições**
- **100 temas de storyboard** com tokens e slots editáveis
- Processo de 7 estágios: brief → componentes → tema → storyboard → build → som → entrega

Regra da skill: **a limpeza com a imagem vale só quando a imagem é limpa**. Assets do próprio
produto antes de gerados.

---

## Detalhe: `tuzhechen2005/opus-video-skills` — estilos artísticos procedurais

> ⭐ — 2 skills em `skills/`. Licença MIT.

Produção de vídeo **inteiramente em código** — cada frame é função pura do tempo, sem modelos
generativos de imagem/vídeo/áudio. Renderiza em headless Chrome + ffmpeg.

| Skill | Estilo | Uso típico |
|---|---|---|
| `painted-animation` | Aquarela e tinta à mão (p5.js + p5.brush), personagens com acting | Curtas animados, MVs, lyric videos com karaoke |
| `kinetic-reel` | Tipografia cinética com WebGL (three.js, partículas, marble líquido, chrome knot) | Showreels, portfolios, intros, product films |

**Diferencial-chave**: estilos visuais únicos não cobertos pelos outros 6 repos. `painted-animation`
é o único que faz **cartoon aquarela animado** com personagens. `kinetic-reel` combina tipografia
condensada com camadas WebGL (terreno de partículas, marble, nuvem que condensa em forma).

**Dependências**: Node.js, Google Chrome, ffmpeg, Python 3 com numpy (só para tempo detection em
`painted-animation`).

**Recomendação**: funciona melhor com Claude Opus 5.5, mas não é obrigatório.

**Comandos** (instalação via Claude Code marketplace):

```bash
/plugin marketplace add tuzhechen2005/opus-video-skills
/plugin install painted-animation@opus-video-skills
/plugin install kinetic-reel@opus-video-skills
```

Ou como skills pessoais:

```bash
git clone https://github.com/tuzhechen2005/opus-video-skills ~/opus-video-skills
ln -s ~/opus-video-skills/skills/painted-animation ~/.claude/skills/painted-animation
ln -s ~/opus-video-skills/skills/kinetic-reel ~/.claude/skills/kinetic-reel
```

---

## Nota de instalação

Diferente dos outros ninjas, **aqui não há `sync-repos.sh`**. Os 7 repositórios já estão consumidos
como skills globais em `~/.agents/skills/`, espelhados em `~/.claude/skills/` e por symlink em
`~/.codex`, `~/.gemini` e `~/.cursor`.

Motivo prático: `hyperframes` tem **489 MB**. Clonar os 7 para `repos/video-ninja/` adicionaria
~510 MB ao repositório sem nenhum ganho funcional — as skills já estão disponíveis.

**Instalação do ffmpeg-skill** (se ainda não instalado):

```bash
npx ffmpeg-skill --all        # instala para Claude, Cursor e Codex
npx ffmpeg-skill doctor       # verifica componentes FFmpeg
```

Provenance completa (fonte, hash, timestamps de cada skill):
`~/.agents/.skill-lock.json` — filtre por `source` para isolar este ninja.
