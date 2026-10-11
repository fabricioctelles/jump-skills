# WhisperX — optional transcription and alignment backend

**Video Ninja status:** evaluated, not installed, and not automatically integrated.

**Source:** [`m-bain/whisperX`](https://github.com/m-bain/whisperX), BSD-2-Clause license.

## When to consider it

Use WhisperX on spoken material when a project needs word-level timestamps, caption segmentation,
or diarization. It combines speech recognition with forced alignment to time words and can assign
speaker IDs.

It provides text and timing for talking-head workflows; it is not an editor or renderer. The Ninja
must check whether `whisperx` is available in the environment. This reference does not install the
dependency.

## How it differs from the “tape”

WhisperX provides **word-level timing** and diarization. It does not provide the letter-by-letter,
20 ms output that My-Little-Studio's “tape” uses to locate syllable onsets and preserve repeated
attempts. Do not replace the tape with WhisperX for fine cuts. They serve different stages: WhisperX
for transcripts and word timing; the tape for edit decisions that depend on microtiming and restarts.

Treat transcription and diarization as hypotheses to check against the original audio. An aligned
timestamp does not prove that a word was recognized correctly, nor does it identify a person's real
name by itself.

## Workflow

1. Use it only on local audio/video authorized for processing.
2. Check availability, version, model, language, and hardware (CPU or GPU/CUDA) before running it.
3. Produce a transcript; add diarization only when needed.
4. Listen and correct recognition errors, names, punctuation, overlapping speech, and phrase cuts.
5. Convert the reviewed data into the cue format used by the captioning or editing workflow.
6. Continue with `/embedded-captions` and `/captions-overlay`; verify sync against frames and audio.

## Requirements and credentials

- The documented install is `pip install whisperx`. Keep it isolated in the project or pipeline's
  Python environment, and pin the version and models before production.
- GPU/CUDA is optional; CPU works with lower performance. The current README recommends CUDA 12.8
  for GPU acceleration.
- Diarization depends on the `speaker-diarization-community-1` model, which requires a Hugging Face
  token and acceptance of that model's terms. Request a token only when diarization is needed, and
  never print or record its value.
- Record the languages and models used alongside generated artifacts so the review can be repeated.

Do not make WhisperX the default or claim that it is installed. If it fails or needs missing
configuration, return to the available audio backend and state the limitation clearly.
