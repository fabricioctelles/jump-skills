# SVGO — otimização de SVG antes de entrar na composição

Steer de referência. Não é skill instalada e não entra no bloco `repos`.

Use quando SVGs exportados (Excalidraw, Penpot, Figma, Illustrator, Lucide) forem entrar na
composição: o SVGO limpa metadados de editor, reduz o tamanho e normaliza o markup — sem quebrar a
animação.

| Peça | Constante |
|---|---|
| SVGO | [svg/svgo](https://github.com/svg/svgo) — otimizador SVG para Node.js e CLI, MIT, ~22,7k ⭐ |

## Como usar

```bash
npx svgo input.svg -o output.svg
```

Config segura para SVG que será animado (`svgo.config.mjs`):

```js
export default {
  plugins: [
    {
      name: "preset-default",
      params: { overrides: { cleanupIds: false, removeViewBox: false } },
    },
  ],
};
```

## Cuidados com animação (o motivo deste steer existir)

- **`cleanupIds` minifica IDs** — se a animação referencia `#path-1`, um `clipPath` ou um `<use>`, o
  vínculo quebra silenciosamente. Desligue para SVGs animados.
- Preserve o `viewBox` (`removeViewBox: false`) para o escalonamento na composição continuar correto.
- `convertPathData` arredonda coordenadas — em grades grandes isso deforma curvas. Confira em um
  frame renderizado, não só no diff de texto.
- SVGs de editores vêm com metadados inúteis (`metadata`, comentários, IDs de editor); o preset
  já remove a maior parte.
- Renderize um still do SVG otimizado **dentro da composição** antes de seguir — o mesmo princípio
  de verificação do Ninja vale para assets.

## Rotas relacionadas

- Animação de path na composição → `/hyperframes-animation`, `/hyperframes-keyframes`.
- Diagramas → [excalidraw.md](excalidraw.md); ícones → [lucide.md](lucide.md).
- Auditoria visual → `ffmpeg-skill` (`look.py`, contact sheet) e `/hyperframes` `check`.
