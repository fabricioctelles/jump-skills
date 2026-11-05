# Film families and film styles

A two-axis map for choosing **how a short video tells its story** (the family) and **what it looks
like** (the style). The families come from an internal Reels production library; the 81 styles live
in two upstream repositories, which this file references without copying:
[`lemomo-ai/lemo-opuscar`](https://github.com/lemomo-ai/lemo-opuscar) (66) and
[`Vincentwei1021/mg-styles-15`](https://github.com/Vincentwei1021/mg-styles-15) (15). Family H uses
[`JohnHeibel/ClaudeAnimationBase`](https://github.com/JohnHeibel/ClaudeAnimationBase).

Use this reference in **Step 2b** of the Ninja's routing: after the deliverable is known, pick one
family, then at most one style. Families combine freely (a G talking-head can cut to an F diagram);
a style should stay single per film unless the user asks for a deliberate mix.

---

## The two axes

| Axis | Question it answers | Chosen from | Changes |
|---|---|---|---|
| **Family** | How is the story told: camera, screen, type, map, presenter, character? | A–H below | The engine, the workflow skill, and the shot grammar |
| **Style** | What is the visual language: watercolor, blueprint, newsreel, Bauhaus…? | 81 upstream styles (see the catalog pointers below) | The palette, texture, type, sound, and the signature features to keep |

A family without a style is fine: HyperFrames and the doctrine still decide the look. A style
without a family is not: decide the storytelling grammar first, or the style becomes a skin on a
shapeless film.

---

## Families of video

| Family | What it is | Primary route in this Ninja | Supporting skills | Styles that fit |
|---|---|---|---|---|
| **A · 3D cinema** | Realistic 3D: city, objects, environments, a flying camera | `threejs-*` pack (start at `threejs-skill-router`) for browser 3D; Blender only when the project already has it | `threejs-camera-direction`, `threejs-procedural-architecture`, `threejs-atmosphere-aerial-perspective`, `threejs-exposure-color-grading`, `/motion-doctrine` | `tilt-shift`, `glass-product`, `desktop-flythrough`, `lowpoly-island`, `white-model`, MG `04-3d-render` |
| **B · 2D motion with 3D objects** | HTML/GSAP screens, cards, type and numbers layered over light 3D objects | `/hyperframes` + `/motion-graphics` | `threejs-*` for the objects, `/kinetic-reel` for WebGL layers, `dotlottie-web` for Lottie assets, `gsap-*` | MG `01-flat-vector`, `03-isometric`, `12-aurora-glass`, `19-paperclip`; `iso-infographic`, `dark-keynote`, `hologram-hud` |
| **C · Phone and chat** | Phone screens, chat threads, notifications, an AI answering | `/hyperframes` (registry blocks: `npx hyperframes catalog --tag social`) | `/product-launch-video`, `/saas-motion-video`, `/oversized-cursor`, `/captions-overlay` | `living-screencast`, `dark-keynote`, MG `12-aurora-glass`, `18-hanazi` |
| **D · Device in 3D** | A phone or laptop in 3D space showing the product | `/product-film` (real screen capture) or `/hyperframes` with a device-frame block | `threejs-*` for the device scene, `/product-launch-video`, `/seam-craft` | `teardown`, `glass-product`, `desktop-flythrough`, MG `04-3d-render` |
| **E · Kinetic typography** | Type is the picture: words slam, morph, flex, match-cut | `/kinetic-reel` (WebGL type reels) or `/motion-graphics` | `/cut-the-curve`, `/captions-overlay`, `gsap-*` | `swiss-motion`, `spy-titles`, `pictogram-motion`, `caption-news`, MG `08-morph`, `09-bauhaus`, `18-hanazi` |
| **F · Map and diagram** | Maps, routes, processes, mechanisms, charts | Anatomy (isometric mechanisms, when synced) or `/hyperframes` + data blocks | `remotion-maps` (Remotion projects), [Excalidraw](excalidraw.md), `dataviz` for chart rules, `/faceless-explainer` | `dataviz`, `transit-map`, `satellite-briefing`, `iso-infographic`, `blueprint`, `briefing-board`, `whiteboard`, `chalkboard`, `data-physical` |
| **G · You on camera** | A filmed presenter, talking-head, interview or vlog | `/talking-head-recut` or `/embedded-captions`; the [YouTube steer](youtube-video.md) for long-form; `video-editor-skills` for Resolve | `/captions-overlay`, `ffmpeg-skill` (loudness, silences), WhisperX (optional) | MG `18-hanazi`, `caption-news`, `news-package` as overlay grammar |
| **H · Hand-animated character** | A painted character that acts: emotions, gazes, gestures, props | **ClaudeAnimationBase** (locally synced) or `/painted-animation` | `/motion-doctrine` for transitions; contact-sheet review from the kit | `watercolor`, `crayon-book`, `rubber-hose`, `midcentury-toon`, MG `05-cel-boil` |

### Family notes

- **A needs a render budget.** Browser 3D (`threejs-*`) is light; a Blender Cycles pipeline is heavy
  and has no skill in this Ninja. Prefer the Three.js route unless the project already renders in
  Blender, and say so when quality would require it.
- **B and D often carry an HTML layer pinned to 3D.** Labels, pins, cards and lines that follow scene
  points must be placed from the projected 3D coordinates of each frame, never by eye (Guardrail 4).
- **C and D: fictional content.** Chat threads, notifications and phone screens must use fictional
  names, numbers and brands unless the user supplies approved real material. Never show real
  customer data.
- **G is footage-first.** Start from the recording: probe and clean with `ffmpeg-skill`, cut by
  transcript, then add overlays. A style here is an overlay grammar, not a repaint of the face.
- **H is top-of-funnel.** The character lives the audience's situation; it works without voice and
  without text. See §ClaudeAnimationBase below for the rules and the mascot rule.

---

## Choosing a style

1. **Start from the family.** Use the "Styles that fit" column above; leave it only for a reason.
2. **Match the use case.** Each upstream `STYLE.md` or prompt says what the style is for. A style chosen only
   for looks usually fights the message.
3. **Prefer evidence styles for factual claims.** Evidence Films and Edit & Documentary styles film
   real material and expect every number to be sourced. If no sources exist, pick another style.
4. **Plan the aspect ratio.** The upstream example films are horizontal (16:9). For Reels, Shorts
   or TikTok, recompose for 1080×1920 (move and resize elements, re-time reveals); do not crop a 16:9
   render. MG `18-hanazi` is the only style shipped vertical.
5. **Keep the signature, change the story.** Replace the example's story, brand, copy and colors;
   keep the features that make the style recognizable.

---

## How to produce a style

### Opuscar styles (66): use the `lemo-opuscar` skill

The library is directed by its own skill. When installed, the user can ask "make a 30-second Reels
in the Blueprint style about…" and the skill runs the full process: style choice, one round of
questions, `TREATMENT.md`, production, and delivery per its `DIRECTOR.md` §11.

| Item | Detail |
|---|---|
| Install (user approval required) | `claude plugin marketplace add lemomo-ai/lemo-opuscar` then `claude plugin install lemo-opuscar@lemolab`. For other agents, copy `plugin/skills/lemo-opuscar/` into the skills folder |
| Library location | `~/lemo-opuscar` (override with `LEMO_OPUSCAR_HOME`), a sparse clone made by the skill's `scripts/setup.sh`; demo sources are fetched one at a time with `setup.sh demo <slug>` |
| Dependencies | `setup.sh deps` installs Node packages, a headless Chromium and a Python venv; `deps voice` / `deps music` only when the film needs them. Report missing system tools (Node, ffmpeg, Python 3.11+) instead of installing them |
| Style reference | `$LIB/styles/<slug>/STYLE.md` lists the look, the packages, and the signature features |
| Own styles | The skill can adapt a style or start blank; saved styles live in `~/lemo-my-styles/` |
| Model | Tuned for Claude Opus 5.5; other models may not reproduce the styles well |

If the skill is not installed, do not install it silently: tell the user the style needs it, give
the two commands, and offer the closest route already available (for example `/painted-animation`
for `watercolor`, `/kinetic-reel` for kinetic type, Anatomy for `iso-infographic`).

### MG Styles (15): reuse the prompt and the harness

Each style ships a complete prompt (`prompts/<slug>.md`), the film's full source
(`demos/<slug>/`), a renderer (`harness/render.mjs`, `window.renderAt(t)` captured in headless
Chrome, muxed with ffmpeg), a synthesized-audio toolkit (`lib/audio/`), a review rubric
(`rubric.md`) and a template for new styles (`template.md`).

The repository is about 1.2 GB (the `videos/` folder alone is ~420 MB), so it is **not synced**.
Fetch only what the film needs:

```bash
git clone --depth 1 --filter=blob:none --sparse https://github.com/Vincentwei1021/mg-styles-15.git
cd mg-styles-15 && git sparse-checkout set prompts harness lib template.md rubric.md package.json requirements.txt
```

Workflow:

1. Read `prompts/<slug>.md`. Only the **Creative seed** is the example story: replace its story,
   brand, copy and colors. Keep **Signature features**.
2. Change **Output** to 1080×1920 for vertical delivery, and set the length.
3. Build the film as a page that draws any time `t` (the same contract as HyperFrames' seekable
   timelines); render with `harness/render.mjs` or port the page into `/hyperframes`.
4. Review with `rubric.md` by a second, independent pass, and revise twice (the upstream films
   scored 7.57–8.21/10 after two rounds). Apply `/motion-doctrine` throughout.
5. `04-3d-render` uses Blender for the picture; prefer the `threejs-*` route unless Blender is
   available.

Fonts are not in the repository (`assets/fonts/README.md` lists them); substitute self-hosted fonts
through [Fontsource](fontsource.md).

### ClaudeAnimationBase (family H)

A p5.js + p5.brush starter kit for a hand-painted character: views, 31 emotions, eyes, mouths,
hats, emotes and dances; a timeline with brush-wipe transitions; and a renderer that outputs contact
sheets, frame strips, crops, stills and the MP4. It is synced locally at
`{{JUMP_SKILLS_DIR}}/repos/video-ninja/ClaudeAnimationBase/`.

1. Read `ANIMATION_GUIDE.md` first. Its rules: a solid medium (brush strokes, flat 2D, boiling
   linework), **no text**, something happens in every scene, timing modeled on the viewer, alive,
   transitions always, one piece with a vision before code.
2. Storyboard before code, build shot by shot in `src/scenes/`, then look at the result with the
   contact sheet and frame strips before rendering (`node render.mjs --clip --out=out/video.mp4`).
3. Watercolor fills are slow without a dedicated GPU (seconds per frame). On integrated graphics ask
   for another fill; on Linux without a GPU add `--soft-gl`; on a headless NVIDIA node add
   `--gpu-angle=gl-egl`.
4. Requires Node.js, Google Chrome (or a Playwright Chromium) and ffmpeg.

> ⚠️ **Mascot rule.** The kit's character, Clawd, is Anthropic's mascot. Use Clawd when the video is
> about Claude (features, launches, tutorials, Claude-centered stories). For any other subject, brand
> or client, create a new character with the same kit (views, emotion set, props). In both cases a
> person reviews the character for brand, rights and audience before external use.

### Licenses and attribution

| Source | Code and docs | Example films and stills | Notes |
|---|---|---|---|
| `lemo-opuscar` | MIT | CC BY 4.0: credit LemoLab with a link if you reuse them | Films you make are yours. Three demo voice tracks are excluded from CC BY (Game Show Flat, Paper-cut Lightbox, Broadcast News Package); do not reuse them. Third-party demo assets keep their own licenses (`CREDITS`) |
| `mg-styles-15` | MIT | MIT | A few films use CC0 or public-domain photos; fonts are not included |
| `ClaudeAnimationBase` | MIT | — | Clawd is Anthropic's mascot: use it only in videos about Claude; otherwise create your own character |

Everything produced with these styles is a draft: a person must review content, brand, rights and
tone before any external publication.

---

## Style catalog: where the 81 styles live

The catalogs belong to their upstream repositories and are not copied here. Read them at the source:

| Source | Catalog | Per-style detail |
|---|---|---|
| Lemo-Opuscar (66 styles, 11 groups) | Gallery: <https://lemomo-ai.github.io/lemo-opuscar/>; list in `$LIB/styles/README.md` once the skill has set up `~/lemo-opuscar` | `$LIB/styles/<slug>/STYLE.md` |
| MG Styles (15 styles) | Gallery with sound: <https://vincentwei1021.github.io/mg-styles-15/>; list in the upstream `README.md` | `prompts/<slug>.md` (sparse checkout) |

The slugs named in the family table above are routing hints; confirm each one against the upstream
catalog before using it, since upstream may rename or add styles.

---

## What the source library has that this Ninja does not

The Reels library this map comes from also lists capabilities that have no skill here. Do not
present them as available:

| Capability in the source library | Status in this Ninja |
|---|---|
| Blender Cycles realistic 3D with GPU temperature watch | Not covered; use the `threejs-*` route or an existing Blender project |
| ElevenLabs voices, scored music and SFX by description | Not covered; `/hyperframes-audio` and the project's own audio pipeline apply. External TTS/music services need the user's account and approval |
| Automatic perception review (cuts, motion, loudness, Reels format) and reference-Reels analysis | Partly covered: `/business-motion-film` (independent critic), `ffmpeg-skill` (`look`, loudness), MG `rubric.md` |
| 448-piece catalog of scenes and effects | Use the HyperFrames registry (`npx hyperframes catalog`, see §Registry) |
| An 11-seat content council (hook, structure, story, copy…) | Use the marketing skills (`marketing-council`, `copywriting`) before production |
