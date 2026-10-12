# Satori — JSX to SVG for Title Cards and Thumbnails

Reference for generating SVG images from JSX/HTML layouts. Satori converts React-like markup into
SVG, useful for programmatic title cards, thumbnails, OG images, and text-heavy graphics in video
compositions.

> Repository: [`vercel/satori`](https://github.com/vercel/satori)
> License: MPL-2.0
> Stars: 11k+

---

## When to use Satori

| Scenario | Use Satori | Use HyperFrames directly |
|---|---|---|
| Generate title cards from data | ✅ | ❌ |
| Create thumbnails programmatically | ✅ | ❌ |
| Text-heavy graphics with complex layouts | ✅ | ✅ |
| Animated text | ❌ | ✅ |
| Interactive elements | ❌ | ✅ |
| Video composition | ❌ | ✅ |

**Rule:** Satori produces **static SVG**. Use it as a pre-processing step to generate assets that
then go into a HyperFrames composition, or for batch-generating thumbnails and title cards outside
of video rendering.

---

## Core concept

Satori takes JSX (React-like syntax) and outputs SVG. It handles:

- Flexbox layout (the only layout mode)
- Text rendering with custom fonts
- Images (base64 or URLs)
- Borders, shadows, gradients
- Emoji rendering

It does **not** support:

- CSS Grid
- Animations or transitions
- `position: absolute/fixed` (except for basic cases)
- `dangerouslySetInnerHTML`
- React state/effects

---

## Basic usage

```javascript
import satori from 'satori';

const svg = await satori(
  <div
    style={{
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'center',
      width: '100%',
      height: '100%',
      backgroundColor: '#1a1a2e',
      color: 'white',
      fontFamily: 'Inter',
      fontSize: 64,
    }}
  >
    <div style={{ fontWeight: 700 }}>Episode 12</div>
    <div style={{ fontSize: 32, color: '#888' }}>Building the Future</div>
  </div>,
  {
    width: 1200,
    height: 630,
    fonts: [
      {
        name: 'Inter',
        data: interFontBuffer,  // ArrayBuffer of font file
        weight: 400,
        style: 'normal',
      },
      {
        name: 'Inter',
        data: interBoldBuffer,
        weight: 700,
        style: 'normal',
      },
    ],
  }
);

// svg is now a string containing the SVG markup
```

---

## Loading fonts

Fonts must be provided as `ArrayBuffer`. Common patterns:

### From file (Node.js)

```javascript
import { readFile } from 'fs/promises';

const interRegular = await readFile('./fonts/Inter-Regular.ttf');
const interBold = await readFile('./fonts/Inter-Bold.ttf');

const fonts = [
  { name: 'Inter', data: interRegular, weight: 400, style: 'normal' },
  { name: 'Inter', data: interBold, weight: 700, style: 'normal' },
];
```

### From URL (fetch)

```javascript
const fontResponse = await fetch('https://example.com/Inter-Regular.ttf');
const fontData = await fontResponse.arrayBuffer();

const fonts = [
  { name: 'Inter', data: fontData, weight: 400, style: 'normal' },
];
```

### Google Fonts helper

```javascript
async function loadGoogleFont(font, weight = 400) {
  const API = `https://fonts.googleapis.com/css2?family=${font}:wght@${weight}`;
  const css = await (await fetch(API)).text();
  const match = css.match(/src: url\((.+)\) format\('(opentype|truetype)'\)/);
  if (!match) throw new Error(`Font not found: ${font}`);
  return await (await fetch(match[1])).arrayBuffer();
}

const interData = await loadGoogleFont('Inter', 700);
```

---

## Converting SVG to PNG

Satori outputs SVG. To get PNG (for thumbnails, OG images):

### With Resvg (recommended)

```javascript
import { Resvg } from '@resvg/resvg-js';

const svg = await satori(/* ... */);

const resvg = new Resvg(svg, {
  fitTo: {
    mode: 'width',
    value: 1200,
  },
});

const pngData = resvg.render();
const pngBuffer = pngData.asPng();

// Write to file or use as buffer
await writeFile('output.png', pngBuffer);
```

### With Sharp

```javascript
import sharp from 'sharp';

const svg = await satori(/* ... */);
const pngBuffer = await sharp(Buffer.from(svg)).png().toBuffer();
```

---

## Title card patterns for video

### Basic title card

```jsx
const TitleCard = ({ title, subtitle, episode }) => (
  <div
    style={{
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'center',
      width: '100%',
      height: '100%',
      background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
      padding: 60,
    }}
  >
    {episode && (
      <div style={{ fontSize: 24, color: 'rgba(255,255,255,0.7)', marginBottom: 20 }}>
        Episode {episode}
      </div>
    )}
    <div
      style={{
        fontSize: 72,
        fontWeight: 700,
        color: 'white',
        textAlign: 'center',
        lineHeight: 1.2,
      }}
    >
      {title}
    </div>
    {subtitle && (
      <div style={{ fontSize: 32, color: 'rgba(255,255,255,0.8)', marginTop: 30 }}>
        {subtitle}
      </div>
    )}
  </div>
);

const svg = await satori(<TitleCard title="The Architecture" episode={5} />, options);
```

### Quote card

```jsx
const QuoteCard = ({ quote, author, avatar }) => (
  <div
    style={{
      display: 'flex',
      flexDirection: 'column',
      width: '100%',
      height: '100%',
      backgroundColor: '#0f0f0f',
      padding: 80,
      justifyContent: 'center',
    }}
  >
    <div style={{ fontSize: 48, color: '#ffffff', lineHeight: 1.4, fontStyle: 'italic' }}>
      "{quote}"
    </div>
    <div style={{ display: 'flex', alignItems: 'center', marginTop: 40 }}>
      {avatar && (
        <img
          src={avatar}
          style={{ width: 60, height: 60, borderRadius: 30, marginRight: 20 }}
        />
      )}
      <div style={{ fontSize: 24, color: '#888888' }}>— {author}</div>
    </div>
  </div>
);
```

### Stats/data card

```jsx
const StatsCard = ({ stats }) => (
  <div
    style={{
      display: 'flex',
      width: '100%',
      height: '100%',
      backgroundColor: '#1a1a2e',
      padding: 60,
      justifyContent: 'space-around',
      alignItems: 'center',
    }}
  >
    {stats.map((stat, i) => (
      <div
        key={i}
        style={{
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
        }}
      >
        <div style={{ fontSize: 72, fontWeight: 700, color: '#4ade80' }}>
          {stat.value}
        </div>
        <div style={{ fontSize: 24, color: '#888', marginTop: 10 }}>
          {stat.label}
        </div>
      </div>
    ))}
  </div>
);

const svg = await satori(
  <StatsCard stats={[
    { value: '2.4M', label: 'Users' },
    { value: '99.9%', label: 'Uptime' },
    { value: '< 50ms', label: 'Latency' },
  ]} />,
  options
);
```

---

## HyperFrames integration

### Generate title cards for a video sequence

```javascript
import satori from 'satori';
import { Resvg } from '@resvg/resvg-js';
import { writeFile } from 'fs/promises';

const chapters = [
  { title: 'Introduction', time: '0:00' },
  { title: 'The Problem', time: '2:30' },
  { title: 'Our Solution', time: '5:45' },
  { title: 'Demo', time: '8:00' },
  { title: 'Conclusion', time: '12:30' },
];

async function generateTitleCards(chapters, fonts) {
  for (const [i, chapter] of chapters.entries()) {
    const svg = await satori(
      <TitleCard title={chapter.title} chapter={i + 1} />,
      { width: 1920, height: 1080, fonts }
    );
    
    const resvg = new Resvg(svg, { fitTo: { mode: 'width', value: 1920 } });
    const png = resvg.render().asPng();
    
    await writeFile(`assets/title-${i + 1}.png`, png);
  }
}

// Generated PNGs can then be used in HyperFrames composition
```

### Batch thumbnail generation

```javascript
const videos = [
  { id: 'abc123', title: 'Getting Started', views: '10K' },
  { id: 'def456', title: 'Advanced Patterns', views: '5K' },
  // ...
];

for (const video of videos) {
  const svg = await satori(
    <ThumbnailTemplate title={video.title} views={video.views} />,
    options
  );
  await saveThumbnail(video.id, svg);
}
```

---

## Supported CSS properties

Satori supports a subset of CSS. Key supported properties:

**Layout (Flexbox only):**
- `display: flex`
- `flexDirection`, `flexWrap`, `flex`, `flexGrow`, `flexShrink`, `flexBasis`
- `alignItems`, `alignSelf`, `alignContent`
- `justifyContent`
- `gap`

**Box model:**
- `width`, `height`, `minWidth`, `maxWidth`, `minHeight`, `maxHeight`
- `margin`, `padding`
- `border`, `borderRadius`
- `overflow: hidden`

**Typography:**
- `fontFamily`, `fontSize`, `fontWeight`, `fontStyle`
- `lineHeight`, `letterSpacing`
- `textAlign`, `textDecoration`, `textTransform`
- `color`
- `textShadow`

**Visual:**
- `backgroundColor`, `background` (gradients)
- `backgroundImage` (gradients, not images)
- `boxShadow`
- `opacity`
- `objectFit`

**Not supported:**
- CSS Grid
- `position: absolute/fixed` (limited support)
- Animations, transitions
- `transform` (limited)
- `filter`
- CSS variables

---

## Debugging

```javascript
const svg = await satori(element, {
  width: 1200,
  height: 630,
  fonts,
  debug: true,  // Adds visible bounding boxes
});
```

---

## Installation

```bash
npm install satori
npm install @resvg/resvg-js  # For PNG conversion
```

---

## Resources

- Documentation: https://github.com/vercel/satori
- Playground: https://og-playground.vercel.app
- Supported CSS: https://github.com/vercel/satori#css
- @vercel/og (Next.js integration): https://vercel.com/docs/functions/og-image-generation
