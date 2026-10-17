# Video Ninja repositories

Each section describes a source repository for this Ninja's skills. The source repositories are
synced under `repos/video-ninja/` except HyperFrames, whose installed skills are used globally
because its repository is too large to clone. Anatomy is synced locally so the Ninja can load its
skill instructions when needed.

---

## [video-ninja]

Eleven video repositories that complement one another: a rendering engine, a processing engine, a
quality doctrine, an alternative framework, three niche toolkits, a technical illustration skill,
an animation library skill set, a modern Lottie player, and an advanced 3D graphics pack.

```repos
https://github.com/heygen-com/hyperframes
https://github.com/kajisho5/ffmpeg-skill
https://github.com/echris6/motion-video-kit
https://github.com/remotion-dev/skills
https://github.com/Rieranthony/product-film-skill
https://github.com/tugrawork-creator/saas-motion-kit
https://github.com/tuzhechen2005/opus-video-skills
https://github.com/wheresryan22/anatomy
https://github.com/greensock/gsap-skills
https://github.com/LottieFiles/dotlottie-web
https://github.com/scottstts/Threejs-Awesome-Graphics-Agent-Skills
```

`hyperframes` and the Three.js pack are excluded from sync: their clones are about 489 MB and
261 MB respectively, and their skills are already installed globally (the Three.js skills through
the pack's own installer). See the per-repository `no-sync-repos` block in the root `repos.md`.

| Repository | Organization | Skills | License | Role |
|---|---|---:|---|---|
| hyperframes | heygen-com | 27 | Apache-2.0 | Rendering engine: HTML → video. 21 published skills + 6 internal doctrine skills |
| ffmpeg-skill | kajisho5 | 1 | MIT | Processing engine: probe → edit → verify. 42 FFmpeg tools |
| motion-video-kit | echris6 | 1 | MIT | Doctrine: independent critic, 28 launch films, explicit quality bar |
| skills | remotion-dev | 12 | — | Official Remotion skills (second framework) |
| product-film-skill | Rieranthony | 1 | MIT | Screen capture → product film (AVFoundation) |
| saas-motion-kit | tugrawork-creator | 1 | — | SaaS promos: tone matrix, 24 transitions, 100 themes |
| opus-video-skills | tuzhechen2005 | 2 | MIT | Procedural art styles: animated watercolor, kinetic typography |
| anatomy | wheresryan22 | 1 | MIT | Isometric SVG/HTML figures for technical explainers; synced locally |
| gsap-skills | greensock | 8 | MIT | Official GSAP skills: timelines, ScrollTrigger, plugins, React cleanup, performance |
| dotlottie-web | LottieFiles | 1 | MIT | Modern Lottie player: Rust+WASM, .lottie format, state machines, themes, Web Workers |
| Threejs-Awesome-Graphics-Agent-Skills | scottstts | 24 | MIT | Advanced Three.js graphics subsystems: procedural geometry/fields/materials, ocean, clouds, planets, shadows, GTAO, bloom, grading, VFX, validation. Installed by its own installer; excluded from sync |

---

## Evaluated engines and frameworks without a skill

Motion Canvas, Revideo, MoviePy, and ManimCE are not part of the eleven installed sources. Keeping
them here avoids implying that routing is already available.

| Engine/framework | License | Strength | Integration still needed |
|---|---|---|---|
| [Motion Canvas](https://github.com/motion-canvas/motion-canvas) / [Revideo](https://github.com/midrender/revideo) | MIT | Motion Canvas: generators and a vector editor. Revideo: React player, `renderVideo()`, dynamic inputs, and headless rendering | Skill for scaffolding, rendering, audio, `check`, and integration with the doctrine |
| [MoviePy](https://github.com/Zulko/moviepy) | MIT | Python for cuts, compositions, titles, effects, and data-driven automation | Skill for API v2; keep file operations in `ffmpeg-skill` |
| [Manim Community](https://github.com/ManimCommunity/manim) | MIT | Python engine specialized in mathematical animation | Consider an adapter if math explainers become recurring work; the tweet's repo (`3b1b/manim`) is a different project, ManimGL |

Remotion remains installed as an alternative framework, but its license is source-available. The
free license covers individuals and organizations of up to three people; larger teams should verify
the Company License before production.

## Evaluated supporting tools that are not integrated

These sources extend specific tasks. They are not integrated skills, are not included in the count
of 79, and do not belong in the `repos` block used by `sync-repos.sh`.

| Source | Potential use | Limit / routing |
|---|---|---|
| [WhisperX](https://github.com/m-bain/whisperX), BSD-2-Clause | Local word alignment and diarization for speech | Optional backend for `/embedded-captions`; does not replace the 20 ms “tape” that preserves restarts. Requires a Python environment; diarization requires a Hugging Face token and terms acceptance |
| [Lottie Web](https://github.com/airbnb/lottie-web) | Play an After Effects `.json` asset in a web composition | Load only when a project provides a Lottie asset; control the playhead by frame or time and confirm seeks before capture. See [references/lottie.md](lottie.md) |

Operational details: [WhisperX](whisperx.md) and [Lottie](lottie.md).

The [YouTube Video steer](youtube-video.md) is a pipeline reference, not a repository. Use it when a
raw talking-head becomes a polished YouTube video in Remotion. It is not synced and it is not one of
the installed skills.

---

## Separately installed skill, outside the repo sync list

[`fframes-video`](https://github.com/dmtrKovalenko/fframes/tree/main/skills/fframes-video) was
installed through the well-known source [`fframes.studio`](https://fframes.studio). It is not part
of the `repos` block because the full Rust repository is not needed to use the skill.

| Source | Skill | License | Role |
|---|---|---|---|
| [dmtrKovalenko/fframes](https://github.com/dmtrKovalenko/fframes) via [fframes.studio](https://fframes.studio) | `fframes-video` | MIT | Alternative Rust/SVG engine with Skia GPU, FFmpeg, frame inspection, snapshots, and audio analysis |

Provenance: `~/.agents/.skill-lock.json`, `sourceType: well-known`, `source: fframes.studio`.

---

## Details: `kajisho5/ffmpeg-skill` — the processing engine

> ⭐ — one skill, 42 tools. MIT license. ~2 MB

*“Give your coding agent a video editor.”* — Local FFmpeg · No cloud · No API keys

HyperFrames **creates** video (HTML → video); ffmpeg-skill **processes** existing footage
(probe → edit → verify). They complement each other: one renders compositions, the other edits media.

**Structured workflow:**

```
probe (measure) → edit (lossless when possible) → check (validate) → verify (contact sheet)
```

The key difference: the agent does not guess at parameters. It probes the media first (duration,
fps, resolution, HDR, audio channels), acts on real data, and checks the result.

**42 tools** by group:

| Group | Tools |
|---|---|
| Analysis | `probe`, `scenes`, `look` |
| Editing | `cut`, `join`, `silence`, `fit`, `crop`, `cropdetect`, `deinterlace`, `denoise`, `redact`, `sphere`, `straighten`, `insert`, `background`, `reverse`, `stabilize`, `sequence`, `waveform`, `freeze`, `pad`, `speedramp`, `loop`, `broll`, `metadata`, `grid` |
| Audio | `audio`, `sync`, `loudness` |
| Image | `caption`, `overlay`, `graphics`, `color` |
| Delivery | `export`, `proxy`, `check`, `report` |
| Orchestration | `render`, `batch`, `multicam`, `verify` |

**Machine-readable contract:**

```bash
npx ffmpeg-skill contract --json   # input/output schema for every tool
npx ffmpeg-skill doctor            # check available FFmpeg components
```

The contract includes each script's `input_schema`, derived from its argparse configuration (SPEC
pattern), so it does not drift from the code.

**MCP server:**

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

It lists 12 core tools by default; `FFMPEG_SKILL_MCP_FULL=1` lists all 42.

**Verification:**

- `look.py` — creates a PNG contact sheet for visual inspection
- `check.py` — reports PASS/WARN/FAIL against YouTube, TikTok, Reels, podcast, and broadcast specs
- Always probes the output and reports actual metrics

**Delivery presets:**

```bash
python3 $S/export.py input.mp4 --preset reels --json
python3 $S/render.py talk.mp4 --template tiktok --cues cues.txt
```

Templates: `tiktok`, `reels`, `shorts`, `youtube`, `x`, `linkedin`, `facebook`, and `podcast`.

**Installation:**

```bash
npx ffmpeg-skill              # Claude Code → ~/.claude/skills/ffmpeg-skill
npx ffmpeg-skill --cursor     # Cursor
npx ffmpeg-skill --codex      # Codex → ~/.agents/skills/ffmpeg-skill
npx ffmpeg-skill --all        # all supported agents
```

**Requirements:** FFmpeg 5.0+, Python 3.9+ (standard library only).

**When to use it instead of HyperFrames:**

| Task | Use |
|---|---|
| Create a video from scratch (promo, explainer, motion graphic) | HyperFrames |
| Cut, join, or process existing footage | ffmpeg-skill |
| Adjust loudness for a platform | ffmpeg-skill |
| Remove recording silences | ffmpeg-skill |
| Add captions to an existing video | ffmpeg-skill |
| Sync multiple cameras | ffmpeg-skill |
| Render an HTML-to-MP4 composition | HyperFrames |
| Convert HDR to SDR for delivery | ffmpeg-skill |

---

## Details: `heygen-com/hyperframes` — the rendering engine

> *“Write HTML. Render video. Built for agents.”* — ⭐ 55.8k

Each animation is an **HTML page** with motion built in GSAP. To turn it into video, the tool opens
the page in headless Chrome, advances frame by frame, captures each frame, then joins them with
FFmpeg. Since it is all HTML, anything a browser can draw can become video, and the same page
produces the same result each time.

**21 published skills** (`skills/`):

| Group | Skills |
|---|---|
| Entry point | `hyperframes` (required router) |
| Domains | `hyperframes-core`, `hyperframes-animation`, `hyperframes-keyframes`, `hyperframes-creative`, `hyperframes-audio`, `hyperframes-registry`, `hyperframes-studio`, `media-use` |
| CLI | `hyperframes-cli` |
| Workflows | `general-video`, `product-launch-video`, `talking-head-recut`, `embedded-captions`, `faceless-explainer`, `pr-to-video`, `music-to-video`, `motion-graphics`, `slideshow`, `figma`, `remotion-to-hyperframes` |

**Six internal doctrine skills** (`.agents/skills/`, `metadata: internal: true`):

| Skill | Description |
|---|---|
| `motion-doctrine` | **GATEWAY.** Vector law, Z scale-sign, Seam Gate, ban on idle wobble. Supersedes generic guidance |
| `cut-the-curve` | Five velocity-matched cuts + waterfall entry + nudge curve. 10/65/25 ratio |
| `seam-craft` | Transition render correctness. Opaque stage-ground guard, white flashes |
| `oversized-cursor` | Giant macOS cursor as a motion device |
| `captions-overlay` | Captions are OVERLAYS, not a reserved strip. Drop/rail/embed models |
| `changelog-video` | Branded `.md` changelog → video, square 1080, about 45–60 seconds |

⚠️ These six skills **cannot be installed through the CLI**: they have `internal: true` and are not
in the published index. `npx hyperframes skills` prunes unpublished skills, so an update may remove
them.

**Registry:** 173 ready-made blocks in `registry/blocks/`, including `camera-dolly-zoom`,
`bar-chart-race`, `beat-freeze-cut`, `camcorder-hud`, carousels, glass titles, cubes, and more.

**Commands:**

```bash
npx hyperframes skills              # install the complete published set
npx hyperframes skills check        # check for stale skills (nonzero if stale)
npx hyperframes skills update <n>   # install or update a skill
npx hyperframes add <query>         # search the registry
npx hyperframes catalog             # list installed blocks
```

---

## Details: `echris6/motion-video-kit` — the doctrine

> ⭐ 956 — the most recently installed repository (2026-09-30 16:48)

The only one of the five with a **critique loop**: a builder and a separate, tough critic, with an
explicit quality bar and comparison against that bar until the work meets it.

- Motion principles distilled from **28 professional launch films**
- Audio rules (sound design)
- Business-offer playbook
- Selective Three.js use
- Templates and scripts included

The key difference from HyperFrames: HyperFrames is the **engine**; it does not judge quality. This
repository does the **judging**.

---

## Details: `remotion-dev/skills` — alternative framework

> ⭐ 4.8k — official Remotion skills. Pinned version: `4.0.529`

`remotion-create`, `remotion-best-practices`, `remotion-markup`, `remotion-captions`,
`remotion-multimedia`, `remotion-studio`, `remotion-interactivity`, `remotion-maps`,
`remotion-render`, `remotion-saas`, `remotion-upgrade`, `remotion-docs`.

Use it in three cases: explicitly porting a project to HyperFrames (`/remotion-to-hyperframes`, one
way only), keeping an existing Remotion project in Remotion, or making a screen recording
(`/product-film`).

---

## Details: `Rieranthony/product-film-skill` — screen capture

> ⭐ 385 — one skill in `plugins/product-film/skills/product-film/`

Screen recording → product film with **AVFoundation, no FFmpeg, no editor**.

Non-negotiable rules:

- **The product's design wins**—use its actual tokens, components, `rules` files, landing page, and
  copy. Never bring another product's style into it.
- **Ask; do not assume.** Interview before writing the story and offer options based on what exists
  in the code.
- **Each frame is a pure function of time**—no CSS transitions/keyframes, timers, `Date.now()`, or
  state shared between frames.

It runs alongside the product codebase, so it reuses real components and remains editable.

---

## Details: `tugrawork-creator/saas-motion-kit` — avoid repetition

> ⭐ 200 — one skill in `.claude/skills/saas-motion-video/`. ~16 MB (100 themes)

*“No two films should feel the same.”*

- **Tone matrix** + **variety audit**
- **24-transition atlas**
- **100 storyboard themes** with editable tokens and slots
- Seven-stage process: brief → components → theme → storyboard → build → sound → delivery

The skill's rule: **clean product footage works only when the footage is clean**. Use the product's
own assets before generating new ones.

---

## Details: `tuzhechen2005/opus-video-skills` — procedural art styles

> ⭐ — two skills in `skills/`. MIT license.

Video production **entirely in code**: each frame is a pure function of time, with no generative
image, video, or audio models. Renders in headless Chrome with FFmpeg.

| Skill | Style | Typical use |
|---|---|---|
| `painted-animation` | Watercolor and hand-drawn ink (p5.js + p5.brush), expressive characters | Animated shorts, music videos, karaoke lyric videos |
| `kinetic-reel` | Kinetic typography with WebGL (Three.js, particles, liquid marble, chrome knot) | Showreels, portfolios, intros, product films |

**Key distinction:** distinctive looks not covered by the other six repositories. `painted-animation`
is the only one for animated watercolor cartoons with characters. `kinetic-reel` combines condensed
type with WebGL layers (particle terrain, marble, a cloud condensing into shape).

**Dependencies:** Node.js, Google Chrome, FFmpeg, and Python 3 with numpy (only for beat detection
in `painted-animation`).

**Recommendation:** works best with Claude Opus 5.5, but that is not required.

**Commands** (Claude Code marketplace installation):

```bash
/plugin marketplace add tuzhechen2005/opus-video-skills
/plugin install painted-animation@opus-video-skills
/plugin install kinetic-reel@opus-video-skills
```

Or install as personal skills:

```bash
git clone https://github.com/tuzhechen2005/opus-video-skills ~/opus-video-skills
ln -s ~/opus-video-skills/skills/painted-animation ~/.claude/skills/painted-animation
ln -s ~/opus-video-skills/skills/kinetic-reel ~/.claude/skills/kinetic-reel
```

> ⚠️ **Upstream YAML fix (2026-10-17):** the upstream `kinetic-reel/SKILL.md` has invalid YAML —
> its `description:` value contains an unquoted `: ` sequence and the parse fails with
> *“Nested mappings are not allowed in compact mappings.”* The installed copy quotes the value;
> the lockfile entry was updated by hand to keep GitHub provenance. `npx skills update -g` may
> fail on `kinetic-reel` until the upstream file is fixed — reinstall from a corrected local copy
> instead.

---

## Installation note

The source repositories are also consumed as global skills in `~/.agents/skills/`, with per-skill
symlinks for agents that do not read that directory directly (Claude Code, Kiro, Qwen, and
Windsurf), so the same skill set is visible to every supported agent. The Three.js pack is the
exception: its own installer places the 24 `threejs-*` skills directly in `~/.agents/skills/`.

`sync-repos.sh video-ninja` now syncs eligible repositories locally. It skips only `hyperframes`
(about **489 MB**) through the per-repository exclusion. Anatomy is synced because the router loads
its `SKILL.md` from that checkout.

**Install ffmpeg-skill** if it is not already installed:

```bash
npx ffmpeg-skill --all        # install for Claude, Cursor, and Codex
npx ffmpeg-skill doctor       # check FFmpeg components
```

The generic CLI also works and preserves the full skill, including the 46 scripts, `mcp/server.py`,
references, and the `doctor` command:

```bash
npx skills add https://github.com/kajisho5/ffmpeg-skill -g -y -s ffmpeg-skill
```

Full provenance (source, hash, and timestamp for each skill):
`~/.agents/.skill-lock.json` — filter by `source` to isolate this Ninja.

---

## Details: `greensock/gsap-skills` — official GSAP skills for agents

> ⭐ — eight skills in `skills/`. MIT license.

Official AI skills from GreenSock that teach agents correct GSAP usage: core API, timelines,
ScrollTrigger, plugins, React/Vue/Svelte, vanilla JS, and performance best practices.

GSAP is 100% free — including every plugin. Following Webflow's acquisition of GSAP, all formerly
Club GSAP plugins (SplitText, MorphSVG, Flip, Draggable, etc.) are free for everyone, including
commercial use. No `.npmrc` or private registry required.

| Skill | Description |
|---|---|
| `gsap-core` | Core API: `gsap.to()` / `from()` / `fromTo()`, easing, duration, stagger, defaults |
| `gsap-timeline` | Timelines: sequencing, position parameter, labels, nesting, playback |
| `gsap-scrolltrigger` | ScrollTrigger: scroll-linked animations, pinning, scrub, triggers, refresh & cleanup |
| `gsap-plugins` | Plugins: ScrollToPlugin, ScrollSmoother, Flip, Draggable, Inertia, Observer, SplitText, ScrambleText, SVG & physics plugins, CustomEase, EasePack, GSDevTools |
| `gsap-utils` | `gsap.utils`: clamp, mapRange, normalize, interpolate, random, snap, toArray, selector, wrap, pipe |
| `gsap-react` | React: `useGSAP` hook, refs, `gsap.context()`, cleanup, SSR |
| `gsap-performance` | Performance: transforms over layout props, will-change, batching, ScrollTrigger tips |
| `gsap-frameworks` | Vue, Svelte: lifecycle, scoping selectors, cleanup on unmount |

**Why add it:** HyperFrames uses GSAP as its primary animation engine, but the agent had no
structured guidance for correct patterns. These skills teach cleanup in React (critical for avoiding
memory leaks), proper ScrollTrigger refresh after layout changes, and plugin usage.

**Installation:**

```bash
npx skills add https://github.com/greensock/gsap-skills
```

Or for specific agents:

```bash
npx skills add https://github.com/greensock/gsap-skills --agent claude
npx skills add https://github.com/greensock/gsap-skills --agent cursor
```

**Canonical GSAP pattern:**

```javascript
// 1. Imports and plugin registration (once per app)
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
gsap.registerPlugin(ScrollTrigger);

// 2. Single tween — prefer transform aliases and autoAlpha
gsap.to(".box", { x: 100, autoAlpha: 1, duration: 0.6, ease: "power2.inOut" });

// 3. Timeline for sequencing (prefer over chained delay)
const tl = gsap.timeline({ defaults: { duration: 0.5, ease: "power2" } });
tl.to(".a", { x: 100 })
  .to(".b", { y: 50 }, "+=0.2")
  .to(".c", { opacity: 0 }, "-=0.1");

// 4. React: useGSAP + scope + cleanup
// useGSAP(() => { gsap.to(ref.current, { x: 100 }); }, { scope: containerRef });
```

---

## Details: `LottieFiles/dotlottie-web` — modern Lottie player

> ⭐ — one skill with `SKILL.md`. MIT license.

The official LottieFiles player for Lottie (`.json`) and dotLottie (`.lottie`) animations on the
web — a Rust + WASM core powered by ThorVG, with Software, WebGL2, and WebGPU rendering backends
and full dotLottie v2 support (theming, state machines, and audio).

**Replaces/complements** the `airbnb/lottie-web` reference. The dotLottie format offers:

- **Smaller files** — compressed `.lottie` bundles
- **Multi-animation** — multiple animations in one file
- **Embedded assets** — images and fonts bundled
- **State machines** — interactive animations without code
- **Theming with slots** — runtime color/value customization

| Package | When to use |
|---|---|
| `@lottiefiles/dotlottie-web` | Direct canvas control, framework-agnostic, maximum performance |
| `@lottiefiles/dotlottie-react` | React applications, declarative component API |

**Web Workers (recommended):**

```javascript
import { DotLottieWorker } from '@lottiefiles/dotlottie-web';

const dotLottie = new DotLottieWorker({
  canvas: document.getElementById('canvas'),
  src: 'animation.lottie',
  autoplay: true,
  loop: true,
});
```

**React:**

```jsx
import { DotLottieReact } from '@lottiefiles/dotlottie-react';

function Animation() {
  return <DotLottieReact src="animation.lottie" autoplay loop />;
}
```

**State machines (interactivity):**

```javascript
dotLottie.stateMachineFireEvent('click');
dotLottie.stateMachineFireEvent('hover');
dotLottie.stateMachineSetBooleanInput('isActive', true);
```

**When to use instead of airbnb/lottie-web:**

| Scenario | Use |
|---|---|
| Project already uses `airbnb/lottie-web` | Keep it, migrate gradually |
| New project with Lottie animations | **dotlottie-web** |
| Need state machines or theming | **dotlottie-web** |
| Need smallest possible bundle | **dotlottie-web** |
| Need Web Workers for performance | **dotlottie-web** |

**Installation:**

```bash
npm install @lottiefiles/dotlottie-web
npm install @lottiefiles/dotlottie-react  # for React
```

**HyperFrames integration:** When a composition includes a `.lottie` or `.json` Lottie asset, set
`autoplay: false` and seek explicitly by frame for deterministic capture:

```javascript
dotLottie.addEventListener('load', () => {
  dotLottie.setFrame(targetFrame);
  // Canvas now shows that exact frame
});
```

**Resources:**
- Documentation: https://developers.lottiefiles.com/docs/dotlottie-player
- State Machine Guide: https://github.com/LottieFiles/dotlottie-web/wiki/dotLottie-State-Machine-Guide
- dotLottie 2.0 Spec: https://dotlottie.io/spec/2.0/

---

## Details: `scottstts/Threejs-Awesome-Graphics-Agent-Skills` — 3D graphics subsystems

> ⭐ 914 — 24 skills in `skills/`. MIT license. About 261 MB in a depth-1 clone (66 MB
> `example-gallery` + 71 MB `skills`); excluded from sync.

A pack of **Three.js subsystems for agents**: each skill owns one visual system and ships working
examples and assets that carry much of the implementation value. Start at `threejs-skill-router`,
which maps a required visual result to the smallest skill set and defines the execution order:
visual contract → camera → subject → animation → fields → lighting/shadows → image pipeline →
atomic effects → validation.

| Group | Skills |
|---|---|
| Routing and validation | `threejs-skill-router`, `threejs-visual-validation` |
| Scene building | `threejs-camera-direction`, `threejs-procedural-animation`, `threejs-procedural-fields`, `threejs-procedural-geometry`, `threejs-procedural-architecture`, `threejs-procedural-vegetation` |
| Surfaces, materials, and planets | `threejs-procedural-materials`, `threejs-parallax-occlusion-mapping`, `threejs-procedural-planets`, `threejs-temporal-surfaces` |
| Sky and weather | `threejs-atmosphere-aerial-perspective`, `threejs-volumetric-clouds`, `threejs-precipitation-surfaces` |
| Water | `threejs-spectral-ocean`, `threejs-water-optics` |
| Space and effects | `threejs-raymarched-space-effects`, `threejs-procedural-vfx` |
| Image pipeline | `threejs-shadow-systems`, `threejs-screen-space-ambient-occlusion`, `threejs-bloom`, `threejs-exposure-color-grading`, `threejs-image-pipeline` |

**Installation** (the pack's own installer; not the generic `skills` CLI):

```bash
npx threejs-awesome-graphics-agent-skills@latest install --agent universal
```

This places the 24 `threejs-*` skills in `~/.agents/skills/` (the universal location). The pack is
**not recorded in `~/.agents/.skill-lock.json`**, so `npx skills update -g` does not manage it;
update it by re-running the installer above. Agents that do not read `~/.agents/skills/` directly
(Claude Code, Kiro, Qwen, Windsurf) need per-skill symlinks to the same directory.

**Routing rules from the pack itself:**

- Do not load a skill for API setup alone; inspect the installed Three.js version and use the
  official docs.
- Do not route “make it beautiful” directly to post-processing; find the missing authored system.
- Prefer one strong, inspectable visual rule over several independent noise layers.

**Boundaries:**

- It does not plan, score, cut, or deliver a film. Render the subsystem, then bring the output into
  `/hyperframes` (or Remotion) and apply the Ninja's doctrine (`/motion-doctrine`, `/cut-the-curve`,
  `/seam-craft`).
- One example (`threejs-precipitation-surfaces`, wet puddle rain) **includes GPL-licensed source
  material**; its `SKILL.md` requires preserving the license boundary when copying or publishing.
- WebGPU/TSL paths require a matching Three.js version; validate with `threejs-visual-validation`
  (fixed-view contracts, seed sweeps, temporal stability, GPU budgets) instead of screenshots alone.

**Why it was chosen over alternatives** (October 2026): `majidmanzarpour/threejs-game-skills`
(2.5k stars) targets playable browser games; `viettranx/3dviz-pro-max` (789 stars) centers on
Blender scenes; `dgreenheck/webgpu-claude-skill` (1.25k stars) is narrow (WebGPU/TSL only). The
chosen pack is the broadest graphics-subsystem library and complements `/kinetic-reel` (simple
Three.js layers) and `/business-motion-film` (selective Three.js use).
