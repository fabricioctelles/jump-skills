# Howler.js — Web Audio Control

Reference for programmatic audio control in web compositions beyond what the native `<audio>` element
provides. Howler.js is the standard library for sound effects, fades, sprites, and spatial audio.

> Repository: [`goldfire/howler.js`](https://github.com/goldfire/howler.js)
> License: MIT
> Stars: 24k+

---

## When to use Howler.js

| Scenario | Use Howler | Use native `<audio>` or HyperFrames audio |
|---|---|---|
| Simple background music playback | ❌ | ✅ |
| Sound effects with precise timing | ✅ | ❌ |
| Audio sprites (multiple sounds in one file) | ✅ | ❌ |
| Crossfades between tracks | ✅ | ❌ |
| 3D positional/spatial audio | ✅ | ❌ |
| Volume ducking during voiceover | ✅ | ✅ (hyperframes-audio) |
| Seeking to exact frame in video | ❌ | ✅ (hyperframes-audio) |

**Rule:** For HyperFrames compositions, use `/hyperframes-audio` for timeline-synced audio and
`/media-use` for sourcing BGM and SFX. Consider Howler.js only when you need features those skills
don't cover: audio sprites, spatial audio, or complex runtime sound management.

---

## Core concepts

### Howl — single sound or sprite

```javascript
import { Howl } from 'howler';

// Single sound
const bgm = new Howl({
  src: ['music.mp3', 'music.webm'],  // Fallback formats
  loop: true,
  volume: 0.5,
});

bgm.play();
```

### Audio sprites — multiple sounds in one file

```javascript
const sfx = new Howl({
  src: ['sprites.mp3'],
  sprite: {
    click: [0, 200],       // [start_ms, duration_ms]
    hover: [200, 150],
    success: [350, 800],
    error: [1150, 600],
  },
});

// Play specific sprite
sfx.play('click');
sfx.play('success');
```

**Why sprites:** One HTTP request, one decode, instant playback. Essential for game-like interactions
or compositions with many short sounds.

---

## Fades and crossfades

### Fade in/out

```javascript
const sound = new Howl({ src: ['track.mp3'], volume: 0 });
sound.play();
sound.fade(0, 1, 2000);  // Fade from 0 to 1 over 2 seconds

// Later: fade out
sound.fade(1, 0, 1500);
sound.once('fade', () => sound.stop());
```

### Crossfade between tracks

```javascript
function crossfade(fromSound, toSound, duration = 2000) {
  toSound.volume(0);
  toSound.play();
  toSound.fade(0, 1, duration);
  fromSound.fade(fromSound.volume(), 0, duration);
  fromSound.once('fade', () => fromSound.stop());
}

crossfade(currentTrack, nextTrack, 3000);
```

---

## Spatial / 3D audio

```javascript
const sound = new Howl({
  src: ['ambient.mp3'],
  loop: true,
});

// Set listener position (usually camera or player)
Howler.pos(0, 0, 0);

// Set sound position in 3D space
const id = sound.play();
sound.pos(5, 0, -2, id);  // x, y, z

// Update position over time (e.g., moving object)
function updateSoundPosition(x, y, z) {
  sound.pos(x, y, z, id);
}
```

---

## Events

```javascript
const sound = new Howl({
  src: ['track.mp3'],
  onload: () => console.log('Loaded'),
  onplay: () => console.log('Playing'),
  onend: () => console.log('Finished'),
  onpause: () => console.log('Paused'),
  onstop: () => console.log('Stopped'),
  onseek: () => console.log('Seeked'),
  onfade: () => console.log('Fade complete'),
  onloaderror: (id, err) => console.error('Load error:', err),
  onplayerror: (id, err) => console.error('Play error:', err),
});

// Or add listeners after creation
sound.on('end', () => playNext());
sound.once('load', () => sound.play());  // Once = auto-removes
```

---

## Playback control

```javascript
const sound = new Howl({ src: ['track.mp3'] });

sound.play();
sound.pause();
sound.stop();

// Seek to position (seconds)
sound.seek(30);

// Get current position
const position = sound.seek();

// Playback rate (1.0 = normal, 0.5 = half speed, 2.0 = double)
sound.rate(1.5);

// Volume (0.0 to 1.0)
sound.volume(0.8);

// Mute/unmute
sound.mute(true);
sound.mute(false);
```

---

## Global controls

```javascript
import { Howler } from 'howler';

// Master volume
Howler.volume(0.5);

// Mute all sounds
Howler.mute(true);

// Stop all sounds
Howler.stop();

// Unload all sounds (free memory)
Howler.unload();

// Check Web Audio API support
if (Howler.usingWebAudio) {
  console.log('Using Web Audio API');
} else {
  console.log('Falling back to HTML5 Audio');
}

// Get/set listener position for 3D audio
Howler.pos(x, y, z);
Howler.orientation(x, y, z, xUp, yUp, zUp);
```

---

## HyperFrames integration pattern

When building a HyperFrames composition that needs Howler.js for sound effects:

```javascript
// 1. Load sounds during composition setup
const sfx = new Howl({
  src: ['sfx-sprites.mp3'],
  sprite: {
    whoosh: [0, 300],
    pop: [300, 200],
    ding: [500, 400],
  },
});

// 2. Wait for load before rendering
await new Promise(resolve => sfx.once('load', resolve));

// 3. Trigger sounds at specific frames/times
// In your animation timeline or frame callback:
function onFrame(frame) {
  if (frame === 30) sfx.play('whoosh');
  if (frame === 60) sfx.play('pop');
  if (frame === 120) sfx.play('ding');
}

// 4. Clean up when done
sfx.unload();
```

**Caution:** For deterministic video rendering, Howler.js sounds won't be captured in the video
unless you also record system audio or use a different audio pipeline. For video output, prefer
`/hyperframes-audio` which handles audio tracks in the composition.

---

## Installation

```bash
npm install howler
```

CDN (for quick prototypes):

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/howler/2.2.4/howler.min.js"></script>
```

---

## Common patterns

### Preload all sounds before starting

```javascript
const sounds = {
  bgm: new Howl({ src: ['bgm.mp3'], loop: true }),
  click: new Howl({ src: ['click.mp3'] }),
  success: new Howl({ src: ['success.mp3'] }),
};

async function preloadAll() {
  const promises = Object.values(sounds).map(sound =>
    new Promise((resolve, reject) => {
      if (sound.state() === 'loaded') return resolve();
      sound.once('load', resolve);
      sound.once('loaderror', reject);
    })
  );
  await Promise.all(promises);
}

await preloadAll();
// Now all sounds are ready
```

### Play with overlap prevention

```javascript
let currentId = null;

function playExclusive(sound) {
  if (currentId !== null) {
    sound.stop(currentId);
  }
  currentId = sound.play();
  sound.once('end', () => { currentId = null; }, currentId);
}
```

### Volume ducking for voiceover

```javascript
function duckMusic(music, duckVolume = 0.2, duration = 500) {
  const originalVolume = music.volume();
  music.fade(originalVolume, duckVolume, duration);
  
  return function restore() {
    music.fade(duckVolume, originalVolume, duration);
  };
}

// Usage
const restore = duckMusic(bgm);
voiceover.play();
voiceover.once('end', restore);
```

---

## Resources

- Documentation: https://howlerjs.com
- GitHub: https://github.com/goldfire/howler.js
- Examples: https://github.com/goldfire/howler.js/tree/master/examples
