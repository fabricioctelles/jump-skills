# Motion Lab — a production method for code-driven motion

An operational method distilled from two articles: [Opus 5.5 Motion Lab: Make Claude Animate Like
a Studio](https://x.com/i/article/2105052379590578176), by Florence (`@flxrnc`), and [Motion
Engineering: Build a Video Studio Around Opus 5.5](https://x.com/0xwhrrari/status/2105643919119696297),
by rari (`@0xwhrrari`). The first documents three animation and sound experiments; the second
describes briefs, references, variants, gates, and the artifacts in a reusable studio.

> [!info] Source scope
> The note at `brain/pesquisas/Opus 5.5 Motion Lab - Make Claude Animate Like a Studio.md` preserves
> text extracted from the X Article. Prompts and data shown only in images or videos were not
> extracted. This playbook summarizes the available text; it does not invent or reproduce those
> prompts. The second article is archived at `brain/pesquisas/Motion Engineering - Build a Video
> Studio Around Opus 5.5.md`.

## When to use it

- Short visual loops, product motion pieces, or 3D animation built in code.
- When revisions need to point to reproducible frames and measurements.
- When a deliverable described as “one prompt” also needs to preserve the actual revisions and edits.

Start with `/hyperframes` and use `/motion-doctrine` for craft rules. The articles show HTML/CSS for
small 2D loops, Three.js for 3D scenes, and Remotion for series, templates, or data-driven pieces.
Choose the final tool according to the limits of the installed workflows.

## 1. Write the specification as verifiable states

Before composing, list each shot with its frame range, start and end states, main action, parameters,
and handoff. Include the invariants that must not change, such as a character's proportions, product
geometry, brand text, or framing limits.

```text
GOAL: one sentence describing what the viewer should notice or do.
OUTPUT: engine, aspect ratio, resolution, fps, duration, and total frame count.
SHOTS: frame ranges, one main movement, end state, and handoff for each shot.
LOOK: observable choices for camera, materials, lighting, and composition.
PRESERVE: elements and proportions that must not change.
BAN: specific visual patterns that must not appear.
RENDER: each frame is a pure function of time; no clocks, timers, or unseeded randomness.
QA: stills, review frames, numeric checks, audio, and acceptance criteria.
```

This is a schema adapted for the Ninja, not a literal prompt from the article. Add detail until each
important decision can be checked in the image or code. For 3D work, also specify the lens or field
of view, camera, and geometry parameters. The list of banned patterns should reflect clichés that
actually appeared in the first render.

## 2. Instrument the preview for review

During iteration, ask the model to show frame labels, a playhead, and markers on beats or actions
that need to land on a specific frame. These make timing observable: if a marker lights up before the
action, there is a sync problem. Remove the instrumentation from the final composition.

Render key-pose stills first. Then review a 12-frame contact sheet as a storyboard and a strip of
consecutive frames around each problem. Also inspect at 360 px wide to catch readability issues on
small screens. Onion skinning helps reveal uneven spacing; a velocity graph exposes linear movement
and abrupt stops. When a correction does not hold up, compare the two frames around the issue and
describe the visual difference. Render only what changed.

## 3. Keep iterations small and leave receipts

For each pass:

1. Record the input project/render version, the frames inspected, and what is wrong.
2. Turn impressions into instructions with a frame and measurement. For example, use `scale 1.00 →
   1.08 → 1.00 over 6 frames` instead of “make it more impactful.”
3. Fix one or two points; do not turn a local correction into a full rewrite.
4. Render again, inspect the same frame, and update the follow-up log.

The article describes two to four passes as common, but the number depends on the issues found. Keep
creative changes separate from technical fixes such as font loading, frame capture, or audio setup.
Count the follow-ups published with the piece; do not call a long process “one prompt.”

Run an objective audit separately from the aesthetic critique. Check the expected landmarks,
preserved proportions, state changes, movements, and beats on their specified frames. The audit
should fail when an event misses its target frame, even if the clip looks good in playback.

## 4. Audio and loops

- Make the visuals work without sound; social platforms may start videos muted.
- Tie each cue to a visual event and its expected frame. The lab reports hits about one frame after
  the image and measures the decoded audio export.
- Measure loudness, true peak, clipping, and padding/continuity at the seam. The article uses -14
  LUFS and -1 dBTP for its videos; check platform and project requirements before adopting those
  values.
- For an `N`-frame loop, render frames `0` through `N-1`, never frame `N` (which repeats frame `0`).
  Use `phase = frame / N` and whole cycles so position, rotation, and shapes return to their start.
- Export frame `0` as a complete composition. For GIFs, use a shared palette across frames and
  verify the effective duration, since centisecond timing can introduce drift.
- For a six-second, 24 fps GIF loop, the article corrects rounding by alternating five 40 ms frames
  and one 50 ms frame. Check that the exported file is exactly 6.00 seconds.

Use `hyperframes-audio` to mix tracks in the composition and `ffmpeg-skill` to measure and validate
the final file. Listen to the final mix as well: loudness and numeric sync do not guarantee that the
track has shape or connects with the image. Do not treat a measurement reported in an article as a
universal platform standard.

## 5. Preserve product truth and respect references

Separate verifiable product facts from creative direction in the brief. Give the agent access to the
real screens, logos, copy, and assets that may appear; ask for a list of planned assets and approve it
before rendering. If a screen or other required material is missing, stop and request it or propose a
test frame. Do not replace a real interface with a plausible-looking invention.

When using a visual reference, identify which parts of its style grammar you can borrow—type,
contrast, rhythm, motion, or palette—and preserve the project's identity and assets. Use
`/media-use` to find and verify media. A reference can inform choices; it does not grant permission
to copy someone else's assets.

Each beat needs an entry state, an exit state, and a narrative reason. Remove a shot if it adds no
information or does not prepare the next change. Define motion rules by object class: a small control
can respond quickly, while a panel or camera should settle without disorienting the viewer. The
review question is whether the viewer knows where to look after the movement.

## 6. Build resumable variants and gates

A vertical version is not an automatic crop of a landscape one. Reuse assets and narrative states,
but adjust composition, type scale, element count, and camera path for each format. Generate contact
sheets and review each variant separately.

Save the brief, approved asset list, style grammar, state list, render contract, acceptance criteria,
and results from each gate. A long run should name the next artifacts and stop when a reference,
asset, or brand decision is missing. In that case, request the information or produce a small test;
do not spend a full render on an assumption. Mark the delivery complete only after reviewing the
evidence, not just because the export command finished.

## What each article adds

| Topic | Opus 5.5 Motion Lab (`@flxrnc`) | Motion Engineering (`@0xwhrrari`) |
|---|---|---|
| Deterministic motion and state list | Render contract, target frames, and exact loop | Confirms seekability as a requirement for local review |
| Iteration | Stills, frame labels, contact sheet, small follow-ups, and numeric audit | Contact sheet per beat, explicit visual critique, and review before export |
| Distinctive contribution | Measured animation, sound, and GIF experiments | Product truth, authorized references, aspect-ratio variants, and continuity between sessions |
| Sound | Reported sync and loudness measurements | Adds listening and integration of the track into the story |
| Recurring production | Keeps prompts and follow-ups with each piece | Packages briefs, assets, and gates as the basis for the next production |

## Sources and limits

- [X Article: Opus 5.5 Motion Lab](https://x.com/i/article/2105052379590578176)
- [Florence's post sharing the article](https://x.com/flxrnc/status/2105311836190978392)
- [Post/X Article: Motion Engineering](https://x.com/0xwhrrari/status/2105643919119696297)
- Archived note: `brain/pesquisas/Opus 5.5 Motion Lab - Make Claude Animate Like a Studio.md`
- Archived note: `brain/pesquisas/Motion Engineering - Build a Video Studio Around Opus 5.5.md`

The article's examples use Opus 5.5. The method can be applied with other models, but the results
depend on their ability to generate and inspect code and images. Performance, views, timing, and mix
figures are reports from the article's experiments, not guarantees.
