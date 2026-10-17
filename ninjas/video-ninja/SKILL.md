---
name: video-ninja
description: >-
  Master orchestrator for video production with agents. Routes to 79 globally installed video
  skills across 11 upstream repositories and the Anatomy skill from a locally synced source,
  plus optional evaluated tools for speech timing, reusable motion assets, interactive animations,
  programmatic graphics, web audio control, mathematical explainers, and advanced 3D graphics
  subsystems, and adds a proven video-pipeline methodology layer.
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
  Remotion, GSAP, Three.js, WebGL, LUT, grade, color grade, BGM, SFX, sound design, voiceover, TTS,
  thumbnail, screen recording, tutorial video, SaaS video, founder video, YouTube, youtube video,
  cold open, end card, Lottie, dotLottie, Rive, title card.
---

# Video Ninja

**Jump Skill** — Master orchestrator that routes video tasks to 79 globally installed skills from 11
upstream repositories, Anatomy from a locally synced repository, and one separately installed
well-known source, plus a methodology layer distilled from the My-Little-Studio pipeline.

> This ninja routes any video task to the installed skills. It is the required entry point: read it
> before choosing a video skill.

---

## Why this ninja exists

The eleven repositories below cover **rendering**, **media processing**, **craft**, **frameworks**,
**animation libraries**, **art styles**, and **3D graphics subsystems**, but each is a silo.
HyperFrames can render video, but it has no opinion on quality. motion-video-kit has a quality
doctrine, but no renderer. Remotion is
an alternative framework, not a plug-in for HyperFrames. opus-video-skills brings distinctive looks
such as watercolor and kinetic typography, but not the other repositories' craft doctrine.
ffmpeg-skill works on existing footage; it does not build compositions from scratch. gsap-skills
teaches correct GSAP patterns but is not a video engine. dotlottie-web handles Lottie assets but
does not compose them into video. The Three.js pack supplies advanced 3D graphics subsystems, but it
neither plans nor delivers a film.

This ninja is the layer that **chooses and connects** them, and keeps track of what the ecosystem
still lacks.

---

## The golden rule

> **`/hyperframes` is the required entry point for video work.**
> It chooses among the 10 workflows and loads domain skills as needed. This ninja does **not replace**
> that routing; it tells you *which layer to use* and *when HyperFrames alone is not enough*.

For video creation, editing, animation, or rendering, start with `/hyperframes`. Come back here for
the exceptions: Remotion, screen capture, craft doctrine, pipeline methods, and the YouTube Video
steer in [references/youtube-video.md](references/youtube-video.md).

---

## The eleven sources

| Repository | Skills | Layer | Status |
|---|---|---|---|
| [`heygen-com/hyperframes`](https://github.com/heygen-com/hyperframes) | 27 | Renderer + domain skills | Installed, Apache-2.0 |
| [`kajisho5/ffmpeg-skill`](https://github.com/kajisho5/ffmpeg-skill) | 1 (42 tools) | Media processing | Installed, MIT |
| [`echris6/motion-video-kit`](https://github.com/echris6/motion-video-kit) | 1 | Quality doctrine | Installed, MIT |
| [`remotion-dev/skills`](https://github.com/remotion-dev/skills) | 12 | Alternative framework | Installed |
| [`Rieranthony/product-film-skill`](https://github.com/Rieranthony/product-film-skill) | 1 | Screen capture | Installed, MIT |
| [`tugrawork-creator/saas-motion-kit`](https://github.com/tugrawork-creator/saas-motion-kit) | 1 | Variety and anti-repetition | Installed |
| [`tuzhechen2005/opus-video-skills`](https://github.com/tuzhechen2005/opus-video-skills) | 2 | Procedural art styles | Installed, MIT |
| [`wheresryan22/anatomy`](https://github.com/wheresryan22/anatomy) | 1 | Isometric technical figures for explainers | Synced locally, MIT |
| [`greensock/gsap-skills`](https://github.com/greensock/gsap-skills) | 8 | Official GSAP skills: timelines, ScrollTrigger, plugins, React | Installed, MIT |
| [`LottieFiles/dotlottie-web`](https://github.com/LottieFiles/dotlottie-web) | 1 | Modern Lottie player: Rust+WASM, state machines, themes | Installed, MIT |
| [`scottstts/Threejs-Awesome-Graphics-Agent-Skills`](https://github.com/scottstts/Threejs-Awesome-Graphics-Agent-Skills) | 24 | Advanced Three.js graphics subsystems | Installed by its own installer; excluded from sync (~261 MB), MIT |

Provenance for globally installed skills is recorded in `~/.agents/.skill-lock.json`. The Three.js
pack is the exception: its own installer (`npx threejs-awesome-graphics-agent-skills@latest install
--agent universal`) installs to `~/.agents/skills/` without a lockfile entry. Anatomy is declared
and synchronized through the root `repos.md`. See [references/repos.md](references/repos.md).

### Separately installed skill

| Source | Skill | Role | Installation |
|---|---|---|---|
| [`fframes.studio`](https://fframes.studio) | `fframes-video` | Alternative Rust/SVG renderer with Skia GPU, FFmpeg, and agent-readable QA | Well-known, installed globally |

### Evaluated external tools that are not installed

| Source | Role | When to consider it | Status |
|---|---|---|---|
| [`m-bain/whisperX`](https://github.com/m-bain/whisperX) | Local ASR with word-level timestamps and diarization | Talking-head, interview, or podcast work that needs word timing or speaker identification | Optional backend; not installed. See [references/whisperx.md](references/whisperx.md) |
| [`airbnb/lottie-web`](https://github.com/airbnb/lottie-web) | Player for After Effects Lottie animations | Reuse a project-provided `.json` Lottie asset in a HyperFrames composition | On-demand dependency; not installed by the Ninja. See [references/lottie.md](references/lottie.md) |
| [`ManimCommunity/manim`](https://github.com/ManimCommunity/manim) | Python engine for mathematical animation | Recurring math explainers that justify another renderer and adapter | Evaluated, not installed. The tweet links to `3b1b/manim` (ManimGL). See [references/repos.md](references/repos.md) |
| [`rive-app/rive-wasm`](https://github.com/rive-app/rive-wasm) | Interactive animations with native state machines | Project has `.riv` assets from Rive Editor, or needs animations that react to app state | On-demand dependency. See [references/rive.md](references/rive.md) |
| [`goldfire/howler.js`](https://github.com/goldfire/howler.js) | Web audio control: sprites, fades, spatial audio | Sound effects with precise timing, audio sprites, 3D positional audio | On-demand dependency. See [references/howler.md](references/howler.md) |
| [`vercel/satori`](https://github.com/vercel/satori) | JSX → SVG for title cards and thumbnails | Batch-generate title cards, thumbnails, or text-heavy graphics from data | On-demand dependency. See [references/satori.md](references/satori.md) |

Anatomy produces a **visual asset or scene**, not the finished video. Its source is synchronized at
`{{JUMP_SKILLS_DIR}}/repos/video-ninja/anatomy/`; read that repository's `SKILL.md` when routing to
it. Build and inspect the figure, then bring the output into `/hyperframes` and follow the motion,
composition, and rendering doctrine. If the path is missing, treat Anatomy as unavailable and use
the fallback described in [references/anatomy.md](references/anatomy.md).

Do not assume WhisperX or Manim is installed or available. Lottie is an asset format: load its player
only when the project already includes that kind of animation.

### Additional reference documentation

The following tools are documented in the references folder for on-demand use:

| Tool | Reference | Use case |
|---|---|---|
| Rive | [references/rive.md](references/rive.md) | Interactive animations with state machines; alternative to Lottie when project has `.riv` assets |
| Howler.js | [references/howler.md](references/howler.md) | Web audio control: sprites, fades, spatial audio; complements `/hyperframes-audio` |
| Satori | [references/satori.md](references/satori.md) | JSX → SVG for title cards, thumbnails, OG images; batch generation of text graphics |
| YouTube Video | [references/youtube-video.md](references/youtube-video.md) | Raw talking-head edited into a polished YouTube video with explanatory motion graphics |

These tools are not installed skills but are documented for when their specific capabilities are needed.
The YouTube Video row is a pipeline steer, not a library.

Five more pipeline steers cover asset tooling used while producing graphics for a composition:
[excalidraw.md](references/excalidraw.md) (hand-drawn diagrams as video assets),
[penpot.md](references/penpot.md) (open-source design source with an official MCP),
[fontsource.md](references/fontsource.md) (self-hosted fonts for deterministic render),
[lucide.md](references/lucide.md) (UI icon set), and
[svgo.md](references/svgo.md) (animation-safe SVG optimization). None of them installs a skill.

## Engine map

The source image mixes composition engines, project frameworks, and a file editor. Use these
distinctions before choosing a workflow:

| Engine | How it works | When to choose it | Status in the Ninja |
|---|---|---|---|
| **HyperFrames** | HTML/CSS/JS in headless Chrome + FFmpeg | New compositions, motion design, and agent-directed video | Default, installed |
| **ffmpeg-skill** | Probe → edit → validate existing files | Cutting, joining, audio normalization, multicam, and delivery | Processing, installed |
| **fframes-video** | Per-frame Rust/SVG, Skia GPU, FFmpeg, and inspection CLI | High-throughput vector rendering, batch work, and automated review | Alternative engine, installed |
| **Remotion** | React/TypeScript, local or Lambda rendering | Existing React projects, composition ports, or distributed rendering | Alternative framework, installed |
| **Motion Canvas / Revideo** | TypeScript generators; Revideo adds a React player, headless rendering, and dynamic inputs | Motion Canvas for editor-based vector animation; Revideo for parameterized templates and Node/serverless rendering | Evaluated; no skill installed |
| **MoviePy** | Python clips, compositions, and frame effects | Data-driven Python pipelines or composition prototypes | Evaluated; no skill installed |
| **Manim Community Edition** | Python for programmatic math animation | Recurring explainers about math, charts, or geometry | Evaluated; no skill or adapter installed |

Do not present Motion Canvas, Revideo, MoviePy, or ManimCE as installed capabilities until a skill
defines routing, a render contract, and verification. If a project already uses one of these tools,
the Ninja can keep it and apply the same motion, audio, and validation doctrine.

Check Remotion's license before production: its code is source-available, and the free license covers
individuals and organizations of up to three people. Larger teams or automated use may require a
Company License. Do not describe it as MIT or OSI-approved open source.

---

## Routing

### Step 1 — Is this actually a video task?

If it is **not** a video task, this ninja does not apply:

| Request | Route to |
|---|---|
| Website/app | `impeccable`, `apple-design` |
| UI animation only (not a video) | `animate`, `improve-animations` (Emil Kowalski pack) |
| Marketing copy or script only | `copywriting`, `social` |

### Step 2 — Route by deliverable

**Let `/hyperframes` choose among the 10 workflows.** Its priority table is authoritative. This ninja
only needs to identify the **layer** to add:

| Request | Workflow | Additional Ninja layer |
|---|---|---|
| Legenda em talking-head | `/embedded-captions` | + `/captions-overlay` |
| Cards de overlay em podcast | `/talking-head-recut` | + `/cut-the-curve` |
| Product or URL promo | `/product-launch-video` | + `/motion-doctrine`, `/seam-craft`, §Product launch |
| Weekly changelog video | `/changelog-video` | — |
| Screen recording → demo | **`/product-film`** (dedicated skill) | See §Remotion |
| Business film (live action, AI, premium) | **`/business-motion-film`** | See §Doctrine |
| Anti-repetition SaaS promo | **`/saas-motion-video`** | See §Doctrine |
| Watercolor cartoon / karaoke lyric video | **`/painted-animation`** | See §Art styles |
| Kinetic type showreel / portfolio | **`/kinetic-reel`** | See §Art styles |
| Technical explainer with an isometric mechanism or object | **Anatomy (when synced)** | Read its local `SKILL.md`, build and inspect SVG/HTML; bring the asset into `/hyperframes` for composition and rendering. See [references/anatomy.md](references/anatomy.md) |
| Talking-head with word timing or diarization | `/embedded-captions` + **optional WhisperX** (if installed) | Align words or identify speakers, then check against the audio. The “tape” is still needed for cuts that depend on restarts or syllable onsets. See [references/whisperx.md](references/whisperx.md) |
| Raw talking-head → polished YouTube video with explanatory motion graphics | **YouTube Video steer** (Remotion) | Do not start in HyperFrames. Read [references/youtube-video.md](references/youtube-video.md). Keep the speech language. Do not publish without approval. |
| Project supplies a Lottie `.json` animation | `/hyperframes` + **Lottie Web on demand** | Disable autoplay and seek explicitly by frame or time for deterministic capture. See [references/lottie.md](references/lottie.md) |
| High-rigor math explainer | **ManimCE (optional, if installed and justified)** | Specialized math renderer; inspect the final composition. HyperFrames remains the default for other videos |
| Code-generated motion, loops, or frame animation | **`/hyperframes`** | + `/motion-doctrine`, see §Motion Lab |
| **3D scene, procedural graphics, or a Three.js subsystem** (materials, ocean, clouds, planets, VFX) | **`threejs-*` pack** (start at `threejs-skill-router`) | Load only the targeted subsystem, then bring the result into `/hyperframes` or the project's engine. See §3D graphics |
| **Cut, join, or process existing footage** | **`ffmpeg-skill`** | See §FFmpeg |
| **Adjust loudness for a platform** | **`ffmpeg-skill`** | See §FFmpeg |
| **Remove recording silences** | **`ffmpeg-skill`** | See §FFmpeg |
| **Sync multiple cameras** | **`ffmpeg-skill`** | See §FFmpeg |
| Vector video with GPU rendering and CLI QA | **`fframes-video`** | See §fframes |
| Existing Motion Canvas/Revideo project | **Motion Canvas/Revideo** | Keep it only if the dependency already exists; apply §Doctrine |
| Python composition or data pipeline | **MoviePy** | Use only when Python is a requirement; finish with §FFmpeg |
| Explainer, PR, music, deck, motion, open-ended video | The 10 workflows | — |

### Step 3 — Load the relevant domains

Cross-cutting: whenever photography or other media is involved, **consider `/media-use`**.
Motion is mandatory: **always load `/motion-doctrine` before composing** any animation (see §Doctrine;
it declares itself the GATEWAY and supersedes generic guidance).

---

## The eleven layers

| # | Layer | Skills | Responsibility |
|---|---|---|---|
| 1 | **Renderer** | `hyperframes`, `hyperframes-cli`, `hyperframes-core` | Deterministic HTML-to-video. `core` is the composition contract; read it before writing HTML |
| 2 | **Processing engine** | `ffmpeg-skill` (42 tools) | probe→edit→verify. Cuts, joins, loudness, captions, HDR-to-SDR, multicam, batch work |
| 3 | **Alternative engine** | `fframes-video` | Rust/SVG, Skia GPU, lane rendering, frame inspection, snapshots, and audio analysis |
| 4 | **Workflows** | `general-video`, `product-launch-video`, `talking-head-recut`, `embedded-captions`, `faceless-explainer`, `pr-to-video`, `music-to-video`, `motion-graphics`, `slideshow`, `figma`, `changelog-video` | The final deliverable |
| 5 | **Craft doctrine** | `motion-doctrine`, `cut-the-curve`, `seam-craft`, `oversized-cursor`, `captions-overlay`, `business-motion-film`, `saas-motion-video` | **An opinion on quality.** What separates “it rendered” from “it looks good” |
| 6 | **Domains** | `hyperframes-animation`, `hyperframes-keyframes`, `hyperframes-creative`, `hyperframes-audio`, `media-use`, `hyperframes-registry`, `hyperframes-studio` | Motion, camera, design, sound, media, and ready-made blocks |
| 7 | **Second framework** | `remotion-*` (12), `product-film` | When Remotion is the right choice |
| 8 | **Art styles** | `painted-animation`, `kinetic-reel` | Distinct procedural looks such as watercolor and kinetic typography |
| 9 | **Animation library** | `gsap-*` (8 skills) | Correct GSAP patterns: timelines, ScrollTrigger, plugins, React cleanup, performance |
| 10 | **Motion assets** | `dotlottie-web` | Lottie/dotLottie player: state machines, themes, Web Workers, deterministic capture |
| 11 | **3D graphics subsystems** | `threejs-*` (24 skills) | Advanced Three.js graphics: procedural geometry/fields/materials, ocean, clouds, planets, shadows, GTAO, bloom, color grading, VFX, and visual validation |

---

## §Doctrine — the layer engines lack

This is the part that is **not** obvious, and what makes this more than a skill index.

### `/motion-doctrine` — the GATEWAY; load it first

> *"These rules SUPERSEDE generic / upstream motion guidance."*

Without it, a multi-scene video becomes a stack of independently animated slides. With it, the
scenes become **one continuous camera move**. It covers the vector law (how you exit determines how
you enter), Z scale-sign, carrier elements, causal motion, the Seam Gate, and the **ban on idle
wobble**: movement must **perform**, not breathe.

It routes to lower-level techniques: `/cut-the-curve`, `/oversized-cursor`, and `/seam-craft`.

### `/cut-the-curve` — the technique catalog

Five cuts with matched velocity (zoom-through, reverse zoom-through, cut-the-curve, waterfall cut,
rack-focus blur-cut), plus two in-scene techniques (staggered waterfall entry and slow-fast-slow
nudge curve). Includes the 10/65/25 slide ratio.

**Read it before:** authoring a transition, handing off text to a beat, a kinetic entrance, or group
repositioning.

### `/seam-craft` — render correctness

Requirements for transitions to composite correctly on the master timeline. Load it when assembling
`index.html` and **whenever a white flash** appears in a cut or crossfade, especially in dark films.
It covers the opaque stage-ground guard (`#root` background).

### `/business-motion-film` — the independent critic

The only one of the five with a **critique loop**: a builder and a separate, tough critic, with an
explicit quality bar. Its motion principles were distilled from **28 professional launch films**.
It also covers sound design and a business-offer playbook, and uses Three.js selectively.

**Use it when** quality matters more than speed and the work is for a client.

### `/saas-motion-video` — avoid repetition

Tone matrix, variety audit, a 24-transition atlas, and **100 storyboard themes**. It solves one
problem: two product videos should not look like the same video. A seven-stage process.

### `/captions-overlay` — captions are overlays

Three models, `drop` / `rail` / `embed` (35 styles in the catalog). Captions are **composited over
the film**; do not reserve a bottom strip and push the content out of the way. This doctrine applies
**on top of** `/embedded-captions`.

## §Product launch — visual proof and QA

For a product promo or demo, route to `/product-launch-video` and apply these criteria during
storyboarding and final review. They are conditional gates based on the brief and available assets;
do not impose a fixed duration, feature count, or pace.

1. **Make the opening frame work as a thumbnail.** Review the first frame on its own. It should
   communicate the promise or create interest without relying on an empty fade. Keep the chosen hook;
   do not force a UI screen when the story calls for another kind of opening.
2. **Show verifiable product behavior.** When a feature proves the benefit, show the action, the
   product's visible response, and the user outcome. Base screens, controls, and results on captured
   or otherwise confirmed material. Do not invent behavior to fill the sequence.
3. **Compose for each aspect ratio.** If the brief asks for both landscape and vertical versions,
   plan and review each as its own layout. Reposition copy and product for the vertical frame instead
   of relying on an automatic crop. Do not create extra versions by default.
4. **Keep data and claims truthful.** Synthetic data is fine for protecting personal information,
   as long as it looks plausible and is clearly fictional when that could be misleading. Never use
   real personal data without authorization or show a capability, result, or CTA the product does
   not offer.

These criteria do not replace real capture as the source of truth, the promise and story arc in
`/product-launch-video`, or HyperFrames storyboard and render gates. Source: [12 rules for a launch
video — Amanda Sartini](https://x.com/i/article/2109015312729587712).

### `/oversized-cursor` — the house style

Oversized macOS cursor. Use it when the scene has a cursor, when a pointer leads the action, or
when a static or lifeless scene needs an effective, low-cost source of motion.

### The sound layer

`/hyperframes-audio` handles audio already placed in the composition: fades, crossfades, gain,
automation, VO ducking/carving, effect chains, and submix buses. `/media-use` handles **media
sources**. Keep their roles straight: `/media-use` finds and generates assets; `/hyperframes-audio`
mixes what is already on the timeline.

---

## §FFmpeg — the processing engine

Source: [`kajisho5/ffmpeg-skill`](https://github.com/kajisho5/ffmpeg-skill)

*"Give your coding agent a video editor."* — Local FFmpeg · No cloud · No API keys

HyperFrames **creates** video (HTML → MP4); ffmpeg-skill **processes** existing media. They work
together: one renders new compositions, while the other edits actual files.

### Structured workflow

```
probe (measure) → edit (lossless when possible) → check (validate) → verify (contact sheet)
```

The key difference: the agent does not guess at parameters. It probes the media first (duration,
fps, resolution, HDR, audio channels), edits based on those facts, then checks the result.

### 42 tools

| Group | Tools |
|---|---|
| Analysis | `probe`, `scenes`, `look` |
| Editing | `cut`, `join`, `silence`, `fit`, `crop`, `cropdetect`, `denoise`, `stabilize`, `reverse`, `speedramp`, `loop`, `freeze`, `pad`, `broll`, `metadata`, `grid` |
| Audio | `audio`, `sync`, `loudness` |
| Image | `caption`, `overlay`, `graphics`, `color` |
| Delivery | `export`, `proxy`, `check`, `report` |
| Orchestration | `render`, `batch`, `multicam`, `verify` |

### When to use it

| Task | Use |
|--------|-----|
| Create a video from scratch (promo, explainer, motion graphic) | HyperFrames |
| Cut, join, or process existing footage | **ffmpeg-skill** |
| Adjust loudness for a platform | **ffmpeg-skill** |
| Remove recording silences | **ffmpeg-skill** |
| Sync multiple cameras | **ffmpeg-skill** |
| Convert HDR to SDR for delivery | **ffmpeg-skill** |
| Add captions to an existing video | **ffmpeg-skill** |
| Render an HTML-to-MP4 composition | HyperFrames |

### Delivery presets

Ready-made templates for: `tiktok`, `reels`, `shorts`, `youtube`, `x`, `linkedin`, `facebook`, and
`podcast`.

```bash
python3 $S/export.py input.mp4 --preset reels --json
python3 $S/render.py talk.mp4 --template tiktok --cues cues.txt
python3 $S/check.py output.mp4 --platform youtube   # PASS/WARN/FAIL
```

### Installation

```bash
npx ffmpeg-skill --all        # install for Claude, Cursor, and Codex
npx ffmpeg-skill doctor       # check available FFmpeg components
```

**Requirements:** FFmpeg 5.0+ and Python 3.9+ (standard library only).

---

## §fframes — alternative engine

Source: [`dmtrKovalenko/fframes`](https://github.com/dmtrKovalenko/fframes), skill installed through
[`fframes.studio`](https://fframes.studio).

Use `fframes-video` when the video is primarily vector-based and GPU rendering, automated
inspection, or batch processing is worth the added complexity of Rust and native libraries.

Recommended cycle:

```
timeline → inspect → strip/frame/onion → audio analyze → render --draft → render
```

`inspect` checks fonts, images, SVG, text clipping, and failures without rendering every pixel.
`strip`, `frame`, `onion`, and `snapshot` produce visual evidence; `audio analyze` measures LUFS,
true peak, clipping, and silence. Review these outputs before calling the video finished.

The engine is MIT-licensed, but installation requires Rust, Skia with Metal/Vulkan or a CPU backend,
`libclang`, `nasm`, Ninja, and FFmpeg codecs for the target platform. The project's performance
claims are hypotheses to test locally, not a guarantee from this Ninja.

Do not use `fframes-video` to edit existing media. Keep using `ffmpeg-skill` for probing, cuts,
normalization, multicam work, and delivery.

---

## §Alternatives to integrate

The alternatives in the source image address real needs, but they do not yet have the same level of
agent integration as HyperFrames. Add support through small, verifiable adapters:

1. **Revideo/Motion Canvas skill:** start with Revideo, which already exposes `renderVideo()`, a
   React player, dynamic inputs, and parallel rendering. Also cover Motion Canvas scaffolding,
   generators, audio sync, FFmpeg export, `check`, and integration with `motion-doctrine` and
   `seam-craft`.
2. **MoviePy skill:** cover API v2, data-driven composition, effects, and audio. Delegate file
   operations to `ffmpeg-skill` and finish with `check`/`verify`.
3. **Benchmark matrix:** compare all four paths for determinism, render time, alpha, audio,
   1080×1920 output, local/server execution, and cost/licensing.
4. **Capability detection:** the router should say when Motion Canvas or MoviePy is not installed
   instead of routing to a nonexistent skill.

This would extend the Ninja without duplicating what `ffmpeg-skill` already handles.

---

## §Art styles — watercolor, kinetic typography, and technical illustrations

Source: [`tuzhechen2005/opus-video-skills`](https://github.com/tuzhechen2005/opus-video-skills)

Two skills that produce video **entirely in code**: each frame is a pure function of time, with no
generative models. They render in headless Chrome with FFmpeg.

### `/painted-animation` — animated watercolor cartoons

It draws each shot with p5.js and the p5.brush watercolor library. Characters have expression
libraries and motion principles. Music videos are cut to measured beats; lyric videos use
word-by-word karaoke captions.

**Use it for:** animated shorts, music videos, karaoke lyric videos, hand-painted or watercolor
looks, ink, and character-driven cartoons.

**Extra dependency:** Python 3 with numpy (for beat detection only).

### `/kinetic-reel` — kinetic type showreels with WebGL

It combines a 2D typography canvas with Three.js layers (particle terrain, liquid marble, chrome
knot, and a cloud condensing into shape), followed by a WebGL post-pass. Shape-continuity
transitions connect the shots. The score is synthesized from the same timeline as the visuals.

**Use it for:** portfolio reels, work reels, product intros, and kinetic type with 3D visual effects.

**Overlap:** HyperFrames `/motion-graphics` also supports kinetic typography, but not these specific
WebGL layers (particle terrain, liquid marble). Choose `/kinetic-reel` when you need those 3D effects.

### Anatomy — isometric illustrations for technical explainers

Anatomy is synchronized as a local source repository at
`{{JUMP_SKILLS_DIR}}/repos/video-ninja/anatomy/`. It turns a concept into an isometric object or
machine, with parts, motion, and model-generated data. Use it when showing a physical mechanism makes
the explanation clearer, such as a cache represented as a lock or a rate limiter as a reservoir.

It can produce standalone HTML, standalone SVG, or React/Next components; WebGL is optional.
Geometry audits and Chrome captures help check fit, lines, and visual states. Anatomy is not a chart
library, timeline, editor, or video engine. Its 3D mode is in beta, and detailed figures take time.

**When the source path exists:** read `SKILL.md` from the synced repository and follow its build and
verification workflow → `/hyperframes` integrates the asset and renders the video →
`/motion-doctrine` governs motion and transitions. If the source path is missing, use HyperFrames
composition tools without implying Anatomy is available.

Details, usage criteria, limits, and the original X post: [references/anatomy.md](references/anatomy.md).

### Model recommendation

It works best with Claude Opus 5.5, but that is not a requirement. Other models can use these skills
with varying results.

---

## §3D graphics — the Three.js pack

Source: [`scottstts/Threejs-Awesome-Graphics-Agent-Skills`](https://github.com/scottstts/Threejs-Awesome-Graphics-Agent-Skills)
— 24 skills, MIT. Installed globally by the pack's own installer
(`npx threejs-awesome-graphics-agent-skills@latest install --agent universal`); excluded from the
repo sync because its clone is about 261 MB.

A library of **Three.js subsystems**, not a workflow: each skill owns one visual system and ships
working examples and assets that carry much of the implementation value. Start at
`threejs-skill-router` — it maps a required visual result to the smallest skill set and defines the
execution order (visual contract → camera → subject → animation → fields → lighting/shadows →
image pipeline → atomic effects → validation).

| Group | Skills |
|---|---|
| Routing and validation | `threejs-skill-router`, `threejs-visual-validation` |
| Scene building | `threejs-camera-direction`, `threejs-procedural-animation`, `threejs-procedural-fields`, `threejs-procedural-geometry`, `threejs-procedural-architecture`, `threejs-procedural-vegetation` |
| Surfaces, materials, and planets | `threejs-procedural-materials`, `threejs-parallax-occlusion-mapping`, `threejs-procedural-planets`, `threejs-temporal-surfaces` |
| Sky and weather | `threejs-atmosphere-aerial-perspective`, `threejs-volumetric-clouds`, `threejs-precipitation-surfaces` |
| Water | `threejs-spectral-ocean`, `threejs-water-optics` |
| Space and effects | `threejs-raymarched-space-effects`, `threejs-procedural-vfx` |
| Image pipeline | `threejs-shadow-systems`, `threejs-screen-space-ambient-occlusion`, `threejs-bloom`, `threejs-exposure-color-grading`, `threejs-image-pipeline` |

**When to use it:** product films and promos that need a hero 3D element, motion graphics with a 3D
climax, explainers that show a mechanism as a rendered object, or any shot whose value is an
advanced graphics system (ocean, clouds, planets, bloom). It complements `/kinetic-reel`, which
already uses simple Three.js layers, and `/business-motion-film`, which uses Three.js selectively.

**Boundaries:**

- It does not plan, score, cut, or deliver a film. Bring the rendered output into `/hyperframes`
  (or Remotion) and apply the usual doctrine: `/motion-doctrine`, `/cut-the-curve`, `/seam-craft`.
- Do not load a skill for API setup alone; inspect the installed Three.js version and use the
  official docs. WebGPU/TSL paths require a matching Three.js version.
- One example (`threejs-precipitation-surfaces`, wet-puddle rain) includes GPL-licensed source
  material — keep its license boundary when copying or publishing.

**Coupling to the Ninja's flow:** treat this layer as a **shot generator**. Define the visual
contract, build the subsystem, validate with `threejs-visual-validation` (fixed-view diagnostics,
seed sweeps, budget evidence), capture frames deterministically, and only then composite the shot
into the master timeline.

---

## §Motion Lab — code-driven motion, from brief to validated loop

Use this method for loops, product films, and code-generated motion. Start with `/hyperframes`, load
`/motion-doctrine`, and treat the model as the author of the program that draws the frames. Every
frame must be reproducible and inspectable.

Before generating code, turn the brief into a frame-ranged state list: one main action per shot, the
handoff to the next shot, and what must stay consistent (product, shape, proportions, brand). Specify
the goal, engine, format, resolution, fps, duration, camera, and measurable parameters. Replace vague
requests such as “make it feel premium” with observable decisions. Name visual patterns to avoid,
then update the list after reviewing the first render.

Add review aids to the preview itself—frame labels, a playhead, or beat markers—to check timing and
landings; remove them from the final export. Render stills before the full video, review a contact
sheet and frames around any problems, and limit each pass to one or two adjustments described by
frame and measurement. Keep numerical audits separate from visual critique. Two to four passes is a
reference from the article, not a hard limit.

For sound, write frame-linked cues, measure the decoded file for sync, loudness, true peak, and
clipping, and listen to the final mix. Metrics do not replace listening. For an N-frame loop, render
`0..N-1` and use `phase = frame / N` with whole cycles to close the seam. The article reports a
-14 LUFS/-1 dBTP target and sound hits about one frame after the image; treat these as that lab's
reference and check the delivery platform's requirements.

Separate product facts from creative decisions. Use real screens, logos, and assets. Check the asset
list before animating and stop to request anything missing; do not draw a replacement interface.
For visual references, identify the style grammar you can borrow without copying shots or assets
without permission. Compose and review each aspect ratio as its own variant. Save the brief, state
list, references, approved assets, acceptance criteria, and receipts for each stage. Gates should
let the workflow resume, request information, or stop when evidence is missing.

The procedure, checklist, and source comparison are in
[references/motion-lab.md](references/motion-lab.md). The original sources are [Opus 5.5 Motion
Lab](https://x.com/i/article/2105052379590578176), by [@flxrnc](https://x.com/flxrnc/status/2105311836190978392),
and [Motion Engineering](https://x.com/0xwhrrari/status/2105643919119696297), by
[@0xwhrrari](https://x.com/0xwhrrari). The archived text of the first article does not include
prompts that were embedded in images or videos.

---

## §Remotion — when HyperFrames is not the right fit

HyperFrames is the default. Use Remotion in three cases:

| Case | Skill |
|---|---|
| Explicitly porting a Remotion source project to HyperFrames | `/remotion-to-hyperframes` (one-way, Remotion → HF) |
| Existing Remotion project that should **stay** in Remotion | `/remotion-best-practices` + `/remotion-markup` + `/remotion-render` |
| **Screen capture → product film** | `/product-film` (AVAssembly; no FFmpeg or editor) |
| Raw talking-head → polished YouTube video with explanatory graphics | [YouTube Video steer](references/youtube-video.md) + `/remotion-best-practices` + `/remotion-render`; `ffmpeg-skill` for probe, encode, and loudness |

`/product-film` is self-contained. Each frame is a pure function of time, with no CSS transitions or
`Date.now()`. Non-negotiable rule: **the product's design wins**—use its actual tokens, components,
landing page, and copy. Run alongside the product codebase and reuse real components.

Other `remotion-*` skills: `remotion-create`, `remotion-captions`, `remotion-studio`, `remotion-multimedia`,
`remotion-interactivity`, `remotion-maps`, `remotion-saas`, `remotion-upgrade`, `remotion-docs`.

---

## §My-Little-Studio method

Four techniques the video-skill ecosystem **does not have**, researched and confirmed as gaps in
September 2026. They matter when the Ninja is part of a **recurring production pipeline**, not for a
one-off video.

| Technique | Why it is unusual |
|---|---|
| **SHA-256 provenance** — each stage records a fingerprint of its inputs and **refuses to run** if an earlier input changed, naming the missing command | No skills repository implements staleness detection |
| **The “tape”** — ASR decoded **letter by letter at 20 ms**, preserving restarts that commercial transcription **hides** | WhisperX provides word timing, not the combination of microtiming and restarts; the tape preserves this fine-grained editing function |
| **Reusable color setup** — LUT, gain, and sharpness calibrated once per camera, lighting setup, and scene | No color-grading skill; `/media-use` resolves LUTs per clip, not per camera |
| **Body map** — RTMPose/MediaPipe determines where an element can fit without overlapping the body. Measured result: **an LLM misses by 12% of screen width** | No repository offers this. Screen positioning must never come from a language model |

It also uses **visual frames**: draw over the video frame by frame in HTML, then export the frame,
instruction, and marks. AI can read the drawing better than text alone, making this a useful way to
request precise changes.

`WhisperX` can provide word alignment and diarization when needed, but it does not replace the
“tape”: the tape operates at 20 ms and preserves restarts for fine cuts. To reuse Lottie animations,
follow the deterministic time-control guidance in [references/lottie.md](references/lottie.md).

Full details and lessons learned: [references/metodologia-mls.md](references/metodologia-mls.md).

---

## §Registry — 173 ready-made blocks

Before building any named visual, **search the registry**:

```bash
npx hyperframes add <query>       # e.g. "camera dolly", "bar chart", "glass title"
npx hyperframes catalog           # list installed blocks
```

It already includes `camera-dolly-zoom`, `bar-chart-race`, `beat-freeze-cut`, `camcorder-hud`,
carousels, glass titles, and more. Using `/hyperframes-registry` **before** writing custom code
saves time and inherits known render correctness.

---

## Guardrails

1. **`/hyperframes` first.** It is the authoritative workflow router. Do not force a workflow if its
   priority table points elsewhere.
2. **Doctrine before animation.** `/motion-doctrine` is the GATEWAY and supersedes generic guidance.
   Animating without it is the most expensive mistake in this pipeline.
3. **Do not reserve a caption strip.** Captions are overlays. See `/captions-overlay`, constraint #13.
4. **Never get positions from an LLM.** Every screen coordinate must come from measurement
   (tracking), never from “it looks about right.” The measured error was 12% of screen width.
5. **Route photographic media through `/media-use`.** Leaving suitable media untouched is a valid
   result, but the scan must still happen.
6. **Check before rendering.** `render`, `publish`, and `batch-render` cost time and API usage.
   `check` is cheap; always run it.
7. **Pin the version.** Each project pins `hyperframes@<version>`; the pin does not update itself.
   Before the first render, run `npx hyperframes@latest upgrade --project . --check`.

---

## Maintenance

| Task | Command | Note |
|---|---|---|
| Published HyperFrames skills | `npx hyperframes skills` | Complete published set |
| Update one skill | `npx hyperframes skills update <name>` | |
| Check for stale skills | `npx hyperframes skills check` | Exits nonzero when stale |
| Update other repositories | `npx skills update -g` | Updates from the lockfile; the kinetic-reel entry may fail while the upstream YAML is invalid (see [references/repos.md](references/repos.md)) |
| Update the Three.js pack | `npx threejs-awesome-graphics-agent-skills@latest install --agent universal` | The pack's own installer; no lockfile entry |
| Sync source repositories | `./sync-repos.sh video-ninja` | Syncs Anatomy and the other eligible sources; skips HyperFrames (~489 MB) and the Three.js pack (~261 MB) because of their size |

### Repository-level sync exclusions

`sync-repos.sh video-ninja` syncs the sources listed for this Ninja except repositories in its
`no-sync-repos` block. HyperFrames (~489 MB) and the Three.js pack (~261 MB) are excluded because
their clones are heavy and their skills are already installed globally (the Three.js pack through
its own installer); Anatomy is cloned because the Ninja needs its local `SKILL.md` to route
technical isometric explainers. The exclusion is per repository, so it does not block other missing
sources.

The sync policy is documented in the root [repos.md](../../repos.md).

> ⚠️ **The six internal doctrine skills** (`motion-doctrine`, `cut-the-curve`, `seam-craft`,
> `oversized-cursor`, `captions-overlay`, `changelog-video`) have `metadata: internal: true` upstream.
> The CLI **does not install them**, and `npx hyperframes skills` prunes unpublished skills, so an
> update may remove them. They are recorded in the lockfile as `internal-doctrine`. If they disappear,
> reinstall them by copying `.agents/skills/<name>/` from the repository (sparse checkout).
