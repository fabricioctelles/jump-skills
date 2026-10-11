# My-Little-Studio methodology

Four techniques the video-skill ecosystem **does not have**, plus visual frames. Distilled from the
private My-Little-Studio pipeline (Iago Russi Ferla, September 2026), then checked in September 2026
against existing video-skill repositories.

> **When this applies:** only when the Ninja is part of a **production pipeline** that makes videos
> repeatedly, not when making a single video. HyperFrames already handles one-off videos.

---

## Reference architecture: Pipes and Filters

My-Little-Studio uses Pipes and Filters, similar to Unix pipes.

- **Filters** are *runners*: scripts that do **one thing** and can run and be tested independently.
- **Pipes** are the library (one folder per video) plus the run trace.
- Core rule: half **deterministic** (scripts), half **non-deterministic** (the conversation with the
  agent).

The article describes 29 runners and 10 skills. Skills are **procedure manuals**. They do not
explain every script; they explain *when to use one, which script to run, with which parameters, and
where to look if something goes wrong*. The agent opens the code only when something breaks.

### Mapping to this stack

| MLS | HyperFrames equivalent |
|---|---|
| Runner (deterministic script) | HTML composition + `npx hyperframes` CLI |
| Library (folder per video) | HyperFrames project (`.claude/` scaffold) |
| Trace (run history) | `npx hyperframes timeline`, `history`, `BRIEF.md` |
| Execution receipt | `BRIEF.md` + storyboard + project history |
| **Refuse when data changed** | ❌ **not available** — see §1 |
| Procedure skills | The 10 workflows + domain skills |

---

## §1 — SHA-256 provenance (the biggest gap)

### The problem

In a long pipeline, the agent reviews an edit. Then someone reruns the editing script. The file
changes, and the review is stale—but nothing prevents it from being applied. The final video is
wrong, and **no one knows why**.

### The solution

Each stage records a SHA-256 fingerprint of **every file it read**, alongside its decisions. Before
working, the stage checks those fingerprints:

- If they match, proceed.
- If they do not, **refuse to run** and state exactly which command is missing.

Each run also leaves a **receipt**: inputs, outputs, parameters, duration, and cost. There are three
possible outcomes:

| Outcome | What happens |
|---|---|
| Success | Continue |
| Failure | **No partial output remains in the library** |
| Already complete | Nothing is rerun or charged again |

This happened in the article: the review was rejected **twice** because an earlier stage had been
rerun.

### Why implement it

No video-skill repository has this. The cost is one hash function and one state file per video. The
benefit is removing an entire class of silent bugs from recurring production.

### How to implement it here

```bash
# Record the inputs at each stage
sha256sum "$input_file" >> .trace/"$stage".hash

# Before applying a decision
npx hyperframes timeline --json > .current-state.json
diff <(cat .trace/review.hash) <(sha256sum .current-state.json | cut -d' ' -f1) \
  || { echo "REVIEW STALE — rerun the review"; exit 1; }
```

---

## §2 — The “tape” (ASR at 20 ms, letter by letter)

### The problem

To edit spoken video, you need to know **where each syllable starts**. A standard transcript fails
for two reasons:

1. **It hides restarts.** If you recorded “let's look at this / let's look at this,” commercial
   transcription merges both attempts into one. You lose the fact that the **second take** was the
   good one.
2. **Its timing can be off.** AssemblyAI can miss a word ending by up to 150 ms.

### The solution

A **local** ASR model that decodes **every 20 ms**, letter by letter:

```
jonatasgrosman/wav2vec2-large-xlsr-53-portuguese
```

The tape finds speech spans, keeps the last take of each repeated phrase, and places each edit edge
**at the start of the syllable**.

### Why implement it

`WhisperX` is a related backend: it provides word alignment and diarization, but it does not decode
letter by letter every 20 ms or preserve repeated takes as distinct events. The gap remains a tool
that combines **letter-level timing with preserved restarts**. The tape handles that specialized
task; WhisperX can provide word-level cues when that precision is enough. See
[references/whisperx.md](whisperx.md).

In the article's stress test against eight libraries, the tape was the only one that ran locally and
marked repetitions.

### Applying it in HyperFrames

`/media-use` handles transcription and captions through a shared audio engine. WhisperX can be
evaluated as a local word-alignment backend for captions or speaker timing. For fine-grained
talking-head edits, use the tape: derive edit points from letter-level decoding and preserve repeated
takes.

---

## §3 — Reusable color setup

### The problem

`/media-use` handles LUTs, grading, and color setup, but it does so **per clip**. Each video starts
the calibration over.

### The solution

A **Setup** is a LUT, gain, and sharpness calibrated **once** for a camera, lighting, and scene
combination, then **saved for future videos**.

The MLS `color-grade` applies the full Setup in one operation. Save it to disk for reuse.

### Why implement it

No color-grading skill offers this; they all treat the LUT as a clip property. In recurring
production with the same camera and lighting, this is the difference between “consistent” and
“looks like it was made across 12 different sessions.”

### Applying it

Store setups as versioned assets in the HyperFrames project and reapply them through `/media-use`.

---

## §4 — Body map for framing

### The problem

“Put the card down here, to the right of the face.” It is a natural instruction, and one that often
produces the wrong result. Any LLM asked to choose coordinates is guessing.

### The solution

Three tracking tools, all local and able to run without a GPU:

| Tool | Role |
|---|---|
| **YuNet** (OpenCV) | Finds the face |
| **MediaPipe** (Google) | Segments the body from the background |
| **RTMPose** | Tracks two hands, face, and shoulders frame by frame |

Together, they produce a **body map** that names parts of the frame (head, torso, arms, hands) and
shows where an element can fit **without overlapping the person**.

### C1 rule

Margins around each body part, in pixels:

| Body part | Margin |
|---|---:|
| Head | 80 |
| Torso | 40 |
| Arm | 15 |
| Hand | 0 |

`framing-query` also reports **what made the element shrink** and **why**.

### The number that matters

> **Never get positions from a language model.**
> Gemini missed by **12% of the screen width**.

That was measured, not estimated. It is the clearest argument for separating LLM decisions from
measurements.

### Why implement it

No results in any repository. This is one of the most urgently needed techniques for AI video
editors, and one of the least available.

---

## §5 — Visual frames (visual prompts)

### The problem

AI generation “looks good,” but not like what you had in mind. It is hard to explain something
visual **in text**.

### The solution

A frame-review tool that works a bit like Premiere: it shows the video **frame by frame**, lets you
**draw over it**, and gives you a place to write instructions. Because it is HTML, it exports exactly:

- which frame you were looking at
- the instruction
- the drawing

**AI reads the drawing better than text alone.** Seeing the sketch helped it understand the author's
intent better than the author's verbal explanation had.

The first draft of the article's video included **123 marks and 15 notes**.

### An unexpected bonus

After seeing the drawing, the AI **explains in text what it understood**, often better than the
author. Those explanations become better prompts for future automated scripts.

### The three boards

| Board | Purpose | What it exports |
|---|---|---|
| **Sketch** | Animation | Drawings over the video, frame by frame |
| **Animation** | Timing | Full video + each animation separately, frame by frame; step forward/backward and point out where it got stuck |
| **Cut** | Editing | Mark what is wrong at the playhead; the agent changes it and **explains what changed** |

### The article's most valuable idea

> *“Every correction becomes a lesson for the scripts themselves: the project improves with each pass.”*

The cut board is more than a tool; it is the pipeline's **improvement loop**. `/business-motion-film`
uses the same pattern as an independent-critic loop. Both arrive at the same idea: **the person
judging the result should be separate from the person building it**.

---

## Cost-benefit summary

| Technique | Implementation cost | Benefit | Gap in the ecosystem |
|---|---|---|---|
| §1 SHA-256 provenance | Low (hash + state file) | Removes silent failures | ❌ None |
| §2 The tape | Medium (model + decoder) | Cuts at syllable onset | ❌ None |
| §3 Color setup | Low (versioned assets) | Consistency between videos | ❌ None |
| §4 Body map | Medium (three libraries) | Reliable positioning | ❌ None |
| §5 Visual frames | High (HTML + export) | Request precise changes | Partial — `/hyperframes-studio` has a storyboard, but not drawing over video |

**Recommended order:** §1 first (cheap, removes a class of bug), then §3 (cheap, immediate gain),
then §4 (largest quality gain), then §5. Add §2 only if fine talking-head edits are common.

---

## §6 — Remake mode (frame-locked recreation of a launch video)

### The problem

A client asks: *“Recreate [Product X]'s launch video for my brand.”* The expected result is a
side-by-side “original | Opus 5.5 copy” video that shows the ability to reproduce a professional
style. No skill has a structured workflow for this.

### The solution

A four-phase workflow from [`howseen-ai/claude-motion-design`](https://github.com/howseen-ai/claude-motion-design):

| Phase | What it does |
|---|---|
| **0 — Analysis** | Download the reference video (REF), extract all frames, detect hard cuts by mean absolute difference, make six-frame contact sheets, and write `SPEC.md` (shot table with id/f0–f1/content/swap rules) |
| **1 — Engine** | Pure `seek(F)` engine (`index.html` + `core.js`), with SHOT, camera, cursor, words, pixelDissolve, and a **palette filter** that re-hues residual colors from the original brand |
| **2 — Parallel build** | Split shots into four contiguous groups and assign one to each of four parallel agents. Each writes only `shots/Gx.js` and checks side-by-side comparison sheets. A fifth agent handles audio: analyzes REF (BPM, drops, hits, VO slots via STT), finds a royalty-free track on Mixkit, stretches it by ≤8%, cuts on bars so drops land correctly, and synthesizes SFX at the same times |
| **3 — Integration** | Render three parallel chunks, mux, encode split-screen (two panels + gap + “original” / “Opus 5.5 copy” labels, `setsar=1`), and run color/frame QA |

### Honesty rules

- Never reuse music, voices, or photos of people from REF.
- Do not say “made in 15 minutes” if it was not.
- Tag or credit the original brand in the post.
- Do not imply a partnership (for example, “OpenAI × YourBrand”) when none exists.

### Why implement it

None of the seven Video Ninja repositories has this workflow. HyperFrames renders and motion-video-kit
critiques, but none structures **reference analysis**, **parallel work by shot groups**, a **palette
filter**, and **side-by-side QA**.

### Applying it

1. Use shot analysis (Phase 0) for any reference video, not only remakes.
2. Reuse the palette filter to ensure colors from the original brand do not leak through.
3. Use split-screen encoding to demonstrate the skill on LinkedIn or X.

### Bonus: Mixkit SFX ID table

The repository includes IDs ready to download:

| Sound | Mixkit ID |
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

### Validated spring presets

| Use | Stiffness (k) | Damping (d) |
|---|---:|---:|
| Snappy UI | 320 | 30 |
| Containers/camera | 170 | 26 |
| Heavy type/logos | 120 | 24 |
| Playful mascots | 180 | 12 |

Rule: damping ratio ≥ 0.72 (no cartoon bounce).

---

## Cost-benefit summary

| Technique | Implementation cost | Benefit | Gap in the ecosystem |
|---|---|---|---|
| §1 SHA-256 provenance | Low (hash + state file) | Removes silent failures | ❌ None |
| §2 The tape | Medium (model + decoder) | Cuts at syllable onset | ❌ None |
| §3 Color setup | Low (versioned assets) | Consistency between videos | ❌ None |
| §4 Body map | Medium (three libraries) | Reliable positioning | ❌ None |
| §5 Visual frames | High (HTML + export) | Request precise changes | Partial — `/hyperframes-studio` has a storyboard, but not drawing over video |
| §6 Remake mode | Medium (workflow + scripts) | Recreate a launch video | ❌ None |

**Recommended order:** §1 first (cheap, removes a bug class), then §3 (cheap, immediate gain), §4
(largest quality gain), §6 (when a client requests a remake), §5, and §2 only if fine talking-head
editing becomes common.

---

## §7 — Motion design prompting (Anthropic blueprint)

Based on the paper “Prompting Opus 5.5 — Motion Design” (Raphaël Aubry / Howseen AI, October 2026),
which applies Anthropic's official prompting structure to motion design.

### The central idea

> **The model does not make video. It writes a program that does.**

Actual pipeline: `prompt → index.html with seek(t) → Playwright screenshots → ffmpeg → MP4`

Determinism makes the workflow possible: each frame is a pure function of time, so “fix the wobble
at 4.2s” is an actionable instruction. Without it, every fix rerolls the entire video.

### The render contract (four lines, always in the prompt)

```
Every film is a pure function of time:
window.seek(t) paints frame t, nothing else.
No CSS transitions, no setTimeout, no requestAnimationFrame in render mode,
and no state carried between frames. Seeded noise only (mulberry32), never Math.random.
```

### The 10-part structure (Anthropic canonical)

| # | Part | What to include for motion |
|---|---|---|
| 1 | Task context | The model's role: director, animator, sound designer, render engineer |
| 2 | Tone context | House look in two lines + what is banned |
| 3 | Background data | Reference files, asset folder, measured beat grid |
| 4 | Rules | **The render contract**—the most important block |
| 5 | Examples | One or two beats in the desired style, with timings |
| 6 | Conversation history | What the project already knows (`CLAUDE.md`) |
| 7 | Immediate request | One sentence: what to make and at what size |
| 8 | Gates | Named artifacts in order, each shown before the next |
| 9 | Output format | Deliverables by filename + text sizing instructions |
| 10 | Prefill | Opening tag that makes the model plan before coding |

**Parts 1 and 7 are the only required ones.** Order matters: context before rules, rules before
examples, and examples before the request.

### The four prompt tiers

| Tier | Length | What it describes | Result |
|---|---:|---|---|
| **1 — One-liner** | ~90 chars | Genre; lets the model choose everything | One clip (tests the engine) |
| **2 — Brand brief** | ~1,200 chars | URL + real assets + five beats | One ad |
| **3 — XML spec** | ~2,500 chars | **State list** on the beat grid | Product film |
| **4 — Director's brief** | 9,500–19,000 chars | Character bible, beat sheet, critique loop | One film |

**The important jump is from tier 2 to tier 3.** A one-liner and brand brief describe a *feeling*;
an XML spec describes a *state list*—and a state list can be visibly wrong and corrected.

### The six XML spec blocks (tier 3)

```xml
<inputs>      <!-- what to ask before coding -->
<direction>   <!-- the look in five lines + banned list -->
<structure>   <!-- state list on the beat grid, one state per beat -->
<build>       <!-- render contract: seek(t), springs, subframes -->
<gotchas>     <!-- three mistakes the model is known to make -->
<start>       <!-- ask for inputs, show the state list, wait for OK -->
```

**Order matters:** put `<start>` last. If it comes first, the model starts coding before collecting
the inputs.

### Five lines to remove from old prompts

| Line | Why remove it |
|---|---|
| “double-check your answer” | The model already self-corrects. It adds cost without a gain. |
| “think carefully first” | Thinking is already enabled. Effort is the control, not the phrase. |
| “use a subagent to verify” | It causes over-verification and multiplies cost. |
| “show your reasoning” | The request may be refused. Ask for a “short explanation” instead. |
| “avoid the generic AI look” | Too vague. Name the patterns to avoid. |

### A banned list that works

```
Banned defaults: centered title on a gradient, everything fading in,
corner labels and frame borders, glow on UI chrome, generic particle bursts,
cream or off-white backgrounds, italic accent words, numbered "01/02/03"
section labels, pill-shaped buttons.
```

### Effort levels by task

| Effort | When to use it |
|---|---|
| `low` | Rerenders, one-line fixes, format exports |
| `medium` | **Documented default.** Start every new film here. |
| `xhigh` | A new film whose look has not been established yet |
| `max` | The first three seconds of something that has to work |

**Rule:** set `max_tokens` high enough (128,000 for long runs), and change effort per message, not
per session (changing it invalidates the cache).

### Critique loop (seven axes)

| Axis | A low score means |
|---|---|
| Hook in the first 2s | The opening is a title card. Replace it with the strongest image. |
| Readability at 360px | Type is too light, too small, or too close to the background |
| Motion quality | Something slides along a fixed curve instead of settling into a spring |
| Variety | Two or more seconds pass without anything new on screen |
| Composition | Everything is centered. The frame has one idea, with no structure. |
| Brand accuracy | UI was imagined instead of cropped from a screenshot |
| Sound sync | Cuts land near the beat instead of on it. The grid was ignored. |

**FFmpeg commands for critique:**

```bash
# Contact sheet: 2 fps, 6 columns
ffmpeg -i out/final.mp4 -vf "fps=2,scale=270:-1,tile=6x5" -frames:v 1 out/contact.png

# Strip: 12 consecutive frames around 4.2s
ffmpeg -ss 4.1 -i out/final.mp4 -vf "scale=320:-1,tile=12x1" -frames:v 1 out/strip.png

# Phone test: how it looks at 360px wide
ffmpeg -i out/final.mp4 -vf "fps=1,scale=360:-1,tile=5x3" -frames:v 1 out/phone.png

# Loop check: play twice to inspect the seam
ffmpeg -stream_loop 1 -i out/final.mp4 -c copy out/loop_check.mp4
```

**The line that makes it work:**

> *“Be a harsh motion director, not a proud author.”*

Without it, the model gives its own work generous scores and reports an 8 for a 6.

### Keep a long run moving

The model stops when it emits a message without a tool call. A text-only message is a progress
report, not a completed task. Continuation pattern:

```
Your task list still has open items: the animatic and the sound pass.
Continue with them. If one is blocked, say what is blocking it.
```

**Stop after two or three automatic continuations** to avoid a runaway loop.

### Subagents: when to delegate

```
Delegate to a subagent only for large, genuinely independent tracks:
one chapter per agent, no more. Do not delegate work you can finish
in a handful of tool calls, and do not use subagents to check your own work.
Write docs/ANIMATION_GUIDE.md before spawning any, so every agent codes
in the same style.
```

### Common anti-patterns

| Anti-pattern | Why it fails |
|---|---|
| No reference | The model defaults to a centered title on a gradient |
| Describing a vibe | “Make it feel premium” is not a state list; it cannot be objectively wrong |
| No render contract | Timers and CSS transitions creep in; rendering becomes nondeterministic |
| Naming a library first | Specify the look and constraints; let the model choose the technique |
| Loading old instructions | “Double-check” and “think carefully” add cost without adding value |
| Skipping the critique loop | The difference between a clip people share and one that “feels mid” |

### The skill that replaces the long prompt

Once house rules, the banned list, and critique loop live in a skill file, the next film can be one
sentence:

```
/motion-reel for [URL], 20s, vertical, reference ./refs/frame.png
```

---

## Cost-benefit summary

| Technique | Implementation cost | Benefit | Gap in the ecosystem |
|---|---|---|---|
| §1 SHA-256 provenance | Low (hash + state file) | Removes silent failures | ❌ None |
| §2 The tape | Medium (model + decoder) | Cuts at syllable onset | ❌ None |
| §3 Color setup | Low (versioned assets) | Consistency between videos | ❌ None |
| §4 Body map | Medium (three libraries) | Reliable positioning | ❌ None |
| §5 Visual frames | High (HTML + export) | Request precise changes | Partial |
| §6 Remake mode | Medium (workflow + scripts) | Recreate a launch video | ❌ None |
| §7 Prompting blueprint | Low (templates) | Structured motion prompts | Partial — guidance exists, but not its application to motion |

**Recommended order:** §1 first (cheap, removes a bug class), then §3 (cheap, immediate gain), then
§7 (improves every motion prompt), §4 (largest quality gain), §6 (when a client requests a remake),
§5, and §2 only if fine talking-head editing becomes common.

---

## Sources

- MLS article: `https://iago-russi.vercel.app/artigos/pipeline/` — “My-Little-Studio,” September 2026
- Tape model: `huggingface.co/jonatasgrosman/wav2vec2-large-xlsr-53-portuguese`
- Tracking: `github.com/Tau-J/rtmlib` (RTMPose)
- Remake mode, SFX table, spring presets: `github.com/howseen-ai/claude-motion-design` (Raphaël Aubry / Howseen AI), MIT, October 2026
- Prompting blueprint: “Prompting Opus 5.5 — Motion Design” PDF (Raphaël Aubry / Howseen AI), October 2026
- Gap analysis: review of video-skill repositories, September–October 2026
