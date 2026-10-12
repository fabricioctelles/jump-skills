# Anatomy as an optional visual source

**Status:** integrated source repository; synchronized locally by `./sync-repos.sh video-ninja`.

**Decision:** use it as a specialist for isometric figures in technical explainers. It is a synced
repository skill, not a video renderer or a globally installed agent skill. The router loads its
instructions from `{{JUMP_SKILLS_DIR}}/repos/video-ninja/anatomy/SKILL.md` when that file exists.

## What it offers

[`wheresryan22/anatomy`](https://github.com/wheresryan22/anatomy) is an Agent Skill that explains a
technical concept by building an isometric machine or object with coherent parts and behavior. It
can output standalone HTML, standalone SVG, or React/Next components. It also offers an optional
WebGL layer for effects such as water, light, fire, and steam. The repository declares an MIT license.

Its useful distinction for video is a **scene or asset with a visual mechanism**, rather than just
cards, charts, or box-and-arrow diagrams. The figure can serve as an explanatory scene or an asset
inside a HyperFrames composition.

## When to use it

- Explainers about systems, hardware, science, or processes where physical parts and relationships
  help explain the concept.
- Demonstrations where a transformation or mechanism is central to the story.
- When a detailed isometric figure is worth the extra build and review time.

## Limits and integration

- It is not a chart library: it does not provide axes, series, or data visualizations.
- It is not a timeline, editor, or video renderer. HyperFrames remains responsible for the
  composition and finished video.
- Its domain is machines, instruments, tools, and furniture; concepts without a physical mechanism
  tend to be a poor fit.
- Geometry audits and Chrome captures help review fit, lines, and states.
- The 3D mode is in beta; WebGL depends on browser support. SVG remains the most readable baseline.
- Upstream documents installation through the skills CLI into agent-specific directories. Jump
  Skills instead syncs the repository under its own `repos/video-ninja/anatomy/` path; this makes
  the skill instructions available to any installed Ninja without requiring a global `/anatomy`
  command. The router must check that the local `SKILL.md` exists before using it.

### Suggested workflow when synced

1. Read `{{JUMP_SKILLS_DIR}}/repos/video-ninja/anatomy/SKILL.md` and define the concept, numbers,
   and mechanism that must be accurate.
2. Follow Anatomy to build the figure and specify standalone HTML or SVG based on the destination.
3. Run the audits and captures required by the skill, then review the visual result.
4. Bring the asset into `/hyperframes`; use `/motion-doctrine` for motion and continuity.
5. Render and review it through the standard video workflow.

If the local source path is absent, compose the scene with available HyperFrames tools or choose
another representation. Do not describe Anatomy as available in that environment.

## Evaluation sources

- Meng To's tweet: <https://x.com/MengTo/status/2109182449179836579?s=20>. The cited example uses
  `/anatomy` to explain how Seedream separates an image into layers in a single HTML file, then asks
  for a camera push-in/zoom across scenes 1–5.
- Repository and documentation: <https://github.com/wheresryan22/anatomy> and
  <https://github.com/wheresryan22/anatomy/blob/main/SKILL.md>.
- Reviewed on 2026-10-11. Recheck scope, compatibility, and status before installing.
