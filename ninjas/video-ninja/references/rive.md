# Rive — Interactive Animations with State Machines

Reference for Rive runtime integration in web compositions. Rive is a design tool and runtime for
interactive animations with built-in state machines, offering an alternative to Lottie for
animations that need to respond to user input or application state.

> Repository: [`rive-app/rive-wasm`](https://github.com/rive-app/rive-wasm)
> Documentation: https://rive.app/docs/runtimes/web
> License: MIT
> Stars: 1k+

---

## Rive vs Lottie

| Feature | Rive | Lottie (airbnb) | dotLottie |
|---|---|---|---|
| File format | `.riv` | `.json` | `.lottie` |
| State machines | ✅ Native | ❌ | ✅ (v2) |
| Runtime size | ~200KB (WASM) | ~300KB | ~150KB (WASM) |
| Interactivity | ✅ Built-in | ❌ Code required | ✅ State machines |
| Design tool | Rive Editor | After Effects + Bodymovin | After Effects / Rive |
| Blend modes | ✅ Full support | ⚠️ Limited | ⚠️ Limited |
| Mesh deformations | ✅ | ❌ | ❌ |
| Bones/rigging | ✅ | ❌ | ❌ |

**When to use Rive:**
- Project already has `.riv` assets from the Rive Editor
- Animations need to react to hover, click, scroll, or app state
- Complex character animations with bones/rigging
- Need native state machines without custom code

**When to use Lottie/dotLottie:**
- Project has After Effects animations exported via Bodymovin
- Simple play/pause animations
- Broader ecosystem support

---

## Installation

```bash
# High-level API (recommended)
npm install @rive-app/canvas

# Or with React
npm install @rive-app/react-canvas

# Low-level WASM API (advanced)
npm install @rive-app/webgl
```

---

## Basic usage

### Vanilla JavaScript

```javascript
import { Rive } from '@rive-app/canvas';

const rive = new Rive({
  src: 'animation.riv',
  canvas: document.getElementById('canvas'),
  autoplay: true,
  onLoad: () => {
    console.log('Rive loaded');
  },
});
```

### React

```jsx
import { useRive } from '@rive-app/react-canvas';

function Animation() {
  const { RiveComponent } = useRive({
    src: 'animation.riv',
    autoplay: true,
  });

  return <RiveComponent style={{ width: 400, height: 400 }} />;
}
```

### React with controls

```jsx
import { useRive, useStateMachineInput } from '@rive-app/react-canvas';

function InteractiveAnimation() {
  const { rive, RiveComponent } = useRive({
    src: 'button.riv',
    stateMachines: 'State Machine 1',
    autoplay: true,
  });

  // Get state machine input
  const hoverInput = useStateMachineInput(rive, 'State Machine 1', 'hover');

  return (
    <RiveComponent
      style={{ width: 200, height: 60 }}
      onMouseEnter={() => hoverInput && (hoverInput.value = true)}
      onMouseLeave={() => hoverInput && (hoverInput.value = false)}
    />
  );
}
```

---

## State machines

State machines are Rive's killer feature. They allow animations to transition between states based
on inputs, without writing transition logic in code.

### Input types

| Type | Description | Example |
|---|---|---|
| **Trigger** | Fire-once event | `click`, `submit` |
| **Boolean** | True/false state | `isHovered`, `isActive` |
| **Number** | Numeric value | `progress`, `speed` |

### Using state machine inputs

```javascript
const rive = new Rive({
  src: 'interactive.riv',
  canvas,
  stateMachines: 'State Machine 1',
  autoplay: true,
  onLoad: () => {
    // Get inputs
    const inputs = rive.stateMachineInputs('State Machine 1');
    
    // Find specific input by name
    const hoverInput = inputs.find(i => i.name === 'hover');
    const clickTrigger = inputs.find(i => i.name === 'click');
    const progressInput = inputs.find(i => i.name === 'progress');
    
    // Set boolean
    hoverInput.value = true;
    
    // Fire trigger
    clickTrigger.fire();
    
    // Set number
    progressInput.value = 0.75;
  },
});
```

### Listening for state changes

```javascript
rive.on('statechange', (event) => {
  console.log('State changed:', event.data);
});
```

---

## Artboards and animations

A `.riv` file can contain multiple artboards, and each artboard can have multiple animations.

### Multiple artboards

```javascript
const rive = new Rive({
  src: 'multi.riv',
  canvas,
  artboard: 'Mobile',  // Select specific artboard
  autoplay: true,
});

// Switch artboard at runtime
rive.reset({
  artboard: 'Desktop',
  autoplay: true,
});
```

### Playing specific animations

```javascript
const rive = new Rive({
  src: 'animation.riv',
  canvas,
  animations: ['idle'],  // Start with 'idle' animation
  autoplay: true,
});

// Play different animation
rive.play('walk');

// Play multiple animations (layered)
rive.play(['walk', 'wave']);

// Stop specific animation
rive.stop('wave');

// Pause all
rive.pause();
```

---

## Layout and fitting

```javascript
const rive = new Rive({
  src: 'animation.riv',
  canvas,
  layout: new Layout({
    fit: Fit.Contain,      // Contain, Cover, Fill, FitWidth, FitHeight, None, ScaleDown
    alignment: Alignment.Center,
  }),
  autoplay: true,
});

// Update layout at runtime
rive.layout = new Layout({
  fit: Fit.Cover,
  alignment: Alignment.TopCenter,
});
```

### Fit modes

| Fit | Description |
|---|---|
| `Contain` | Scale to fit, maintain aspect ratio (letterbox) |
| `Cover` | Scale to fill, maintain aspect ratio (crop) |
| `Fill` | Stretch to fill (distort) |
| `FitWidth` | Scale to fit width |
| `FitHeight` | Scale to fit height |
| `None` | No scaling (1:1 pixels) |
| `ScaleDown` | Like Contain, but never scale up |

---

## Text runs (dynamic text)

Rive supports dynamic text content:

```javascript
const rive = new Rive({
  src: 'template.riv',
  canvas,
  autoplay: true,
  onLoad: () => {
    // Get text run by name
    const textRun = rive.textRun('username');
    
    // Set text content
    textRun.text = 'John Doe';
  },
});
```

---

## Events

```javascript
const rive = new Rive({
  src: 'animation.riv',
  canvas,
  autoplay: true,
  onLoad: () => console.log('Loaded'),
  onPlay: () => console.log('Playing'),
  onPause: () => console.log('Paused'),
  onStop: () => console.log('Stopped'),
  onLoop: () => console.log('Looped'),
  onStateChange: (event) => console.log('State:', event.data),
  onAdvance: (event) => console.log('Frame:', event.data),  // Called each frame
});

// Or add listeners after creation
rive.on('load', callback);
rive.on('play', callback);
rive.on('statechange', callback);

// Remove listener
rive.off('play', callback);
```

---

## HyperFrames integration

### Deterministic frame capture

For video rendering, disable autoplay and advance frames manually:

```javascript
const rive = new Rive({
  src: 'animation.riv',
  canvas,
  autoplay: false,  // Manual control
  onLoad: () => {
    // Get animation duration
    const duration = rive.animationDuration('animation-name');
    const fps = 60;
    const totalFrames = duration * fps;
    
    // Advance to specific time
    function renderFrame(frameNumber) {
      const time = frameNumber / fps;
      rive.scrub('animation-name', time);
      rive.advance(0);  // Render without advancing time
      rive.render();
      // Canvas now shows that exact frame
    }
  },
});
```

### Capturing state machine at specific state

```javascript
const rive = new Rive({
  src: 'button.riv',
  canvas,
  stateMachines: 'State Machine 1',
  autoplay: false,
  onLoad: () => {
    // Set state machine input
    const inputs = rive.stateMachineInputs('State Machine 1');
    const hoverInput = inputs.find(i => i.name === 'hover');
    hoverInput.value = true;
    
    // Advance state machine by a small amount to apply state
    rive.advance(0.1);
    rive.render();
    // Canvas now shows hover state
  },
});
```

### Batch rendering multiple states

```javascript
async function renderAllStates(riveSrc, canvas, states) {
  const rive = new Rive({
    src: riveSrc,
    canvas,
    stateMachines: 'State Machine 1',
    autoplay: false,
  });
  
  await new Promise(resolve => rive.on('load', resolve));
  
  const inputs = rive.stateMachineInputs('State Machine 1');
  const results = [];
  
  for (const state of states) {
    // Apply state
    for (const [name, value] of Object.entries(state.inputs)) {
      const input = inputs.find(i => i.name === name);
      if (input.type === 'trigger') input.fire();
      else input.value = value;
    }
    
    // Render
    rive.advance(0.1);
    rive.render();
    
    // Capture
    results.push({
      name: state.name,
      dataUrl: canvas.toDataURL('image/png'),
    });
  }
  
  rive.cleanup();
  return results;
}

// Usage
const states = [
  { name: 'default', inputs: { hover: false, active: false } },
  { name: 'hover', inputs: { hover: true, active: false } },
  { name: 'active', inputs: { hover: true, active: true } },
];

const renderedStates = await renderAllStates('button.riv', canvas, states);
```

---

## Performance tips

1. **Use `@rive-app/canvas`** for most cases (2D Canvas API)
2. **Use `@rive-app/webgl`** for complex animations with many blend modes
3. **Reuse Rive instances** instead of creating new ones
4. **Call `cleanup()`** when done to free memory
5. **Disable autoplay** when not visible

```javascript
// Visibility-based playback
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      rive.play();
    } else {
      rive.pause();
    }
  });
});
observer.observe(canvas);

// Cleanup when done
function dispose() {
  observer.disconnect();
  rive.cleanup();
}
```

---

## Comparison with Lottie integration

| Task | Lottie/dotLottie | Rive |
|---|---|---|
| Play animation | `lottie.play()` | `rive.play()` |
| Go to frame | `lottie.goToAndStop(frame)` | `rive.scrub(anim, time)` |
| Set loop | `lottie.setLoop(true)` | `rive.loop = true` |
| Interactive states | Manual code | State machine inputs |
| Dynamic text | Not supported | `rive.textRun('name').text` |
| Cleanup | `lottie.destroy()` | `rive.cleanup()` |

---

## Resources

- Documentation: https://rive.app/docs/runtimes/web
- Community: https://rive.app/community
- GitHub: https://github.com/rive-app/rive-wasm
- React package: https://github.com/rive-app/rive-react
- Examples: https://rive.app/examples
- Editor: https://rive.app (free tier available)
