# Reusing Lottie animations in HyperFrames

**Video Ninja status:** on-demand integration guidance. The Ninja does not install Lottie Web; load
the dependency only when a project provides or already uses a Lottie asset.

**Source:** [`airbnb/lottie-web`](https://github.com/airbnb/lottie-web).

## When to use it

Reuse `.json` animations exported from After Effects as elements in a HyperFrames composition. Do
not replace the composition renderer with the Lottie player, or fetch or generate assets remotely
during rendering.

## Deterministic capture

The Lottie player provides `goToAndStop(value, isFrame)` to seek to an exact time or frame. For
HyperFrames seek-based capture:

1. Install or bundle the player as a local dependency in the project that uses the asset.
2. Load the JSON and any referenced dependencies locally; keep autoplay and looping off.
3. On each `seek(t)` call, calculate the corresponding position in the asset and call
   `goToAndStop(...)`. Do not rely on real-time playback, `setTimeout`, or the player's last visual
   state.
4. Confirm that the frame has updated before capture. Check the player's events and load time, as
   well as those of any referenced images.
5. Inspect frames at the start, middle, end, and transitions; run the HyperFrames `check` and review
   the finished video.

Use milliseconds with `goToAndStop(1000 * seconds, false)` or an explicit frame with
`goToAndStop(frame, true)`. Fix the mapping between the composition clock and the Lottie asset's
original FPS. Do not silently round when the composition uses a different frame rate.

## Limits and review

- The JSON may reference images, fonts, and auxiliary resources. Include them in the local project so
  rendering does not depend on the network.
- Check transparency, clipping, dimensions, FPS, and colors against the final background.
- If repeated seeks to the same frame produce different results, or the player does not settle before
  capture, do not trust the preview. Convert the asset or rebuild the animation in HyperFrames.
- Respect the license and provenance of the Lottie file you receive.

Lottie is an asset format/player, not a skill or video engine. It does not increase the installed
skill count or belong in the `sync-repos.sh` repository list.
