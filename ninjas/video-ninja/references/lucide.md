# Lucide — ícones de UI consistentes para composições

Steer de referência. Não é skill instalada e não entra no bloco `repos`.

Use quando a composição precisar de ícones de interface coerentes — UI de produto, cards,
lower-thirds, diagramas e listas.

| Peça | Constante |
|---|---|
| Lucide | [lucide-icons/lucide](https://github.com/lucide-icons/lucide) — ~1600 ícones SVG, grid 24×24, traço 2px, herda `currentColor`, licença ISC, ~25k ⭐ |

## Como usar no pipeline

1. **Copie o SVG direto para a composição.** O site do Lucide tem “Copy SVG”; SVG inline é
   determinístico — sem CDN, sem fonte de ícone, sem dependência de runtime no render.
2. Em projeto React (Remotion), use `lucide-react`; em vanilla JS, o pacote `lucide` com
   tree-shaking.
3. Cor vem de `currentColor`: controle pela CSS da composição (o mesmo path serve para qualquer cor).
4. Em tamanhos grandes de tela, escale o SVG inteiro (o traço acompanha na proporção). Não misture
   espessuras da Lucide com sets preenchidos (Material) na mesma peça.

## Cuidados

- **Brand icons não existem na Lucide** — foram removidos na v1 por questões legais e a política é
  não aceitar novos. Para logomarcas, use os assets oficiais do produto (rota `/media-use`) ou o
  Simple Icons (CC0, com licença por marca).
- Licença ISC (parte dos ícones herdados do Feather é MIT): livre para uso comercial; mantenha o
  aviso de licença ao redistribuir os arquivos.
- Não há skill oficial de agente para a Lucide; este steer documenta o uso direto.

## Rotas relacionadas

- UI de produto no vídeo → `/product-launch-video`, `/product-film`.
- Assets e logomarcas → `/media-use`; ícones em title cards via SVG → [satori.md](satori.md).
- Diagramas → [excalidraw.md](excalidraw.md), `archify`; otimização de SVG → [svgo.md](svgo.md).
