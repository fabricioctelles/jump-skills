# Excalidraw — diagramas desenhados à mão como assets de vídeo

Steer de referência. Não é skill instalada e não entra no bloco `repos`.

Use quando o vídeo precisar de **diagramas com cara de desenho à mão**: whiteboard, arquitetura,
fluxos, timelines e explicações visuais. O Excalidraw é a fonte do asset; a animação e o render
ficam com o Ninja.

| Peça | Constante |
|---|---|
| Ferramenta | [excalidraw/excalidraw](https://github.com/excalidraw/excalidraw) — whiteboard open source para diagramas estilo desenho à mão, MIT, ~134k ⭐ |
| Geração programática | [yctimlin/mcp_excalidraw](https://github.com/yctimlin/mcp_excalidraw) — MCP server + skill para criar, editar e exportar canvases Excalidraw (MIT, ~2,5k ⭐) |
| Skills já instaladas na máquina | `lanshu-animated-architecture-diagram` (gera `.excalidraw` editável + PNG + GIF animado) e `archify` (diagramas em HTML/SVG com export PNG/SVG/WebM) |

## Como usar no pipeline

1. **Escolha o caminho:**
   - Diagrama para um vídeo → prefira `lanshu-animated-architecture-diagram` ou `archify` (já
     instaladas, com export pronto).
   - Precisa do arquivo `.excalidraw` editável ou de um canvas interativo → gere o `.excalidraw`
     via `mcp_excalidraw`. O formato é JSON aberto: determinístico e versionável.
2. **Leve para a composição como asset estático**: exporte SVG/PNG e anime no `/hyperframes`. O
   efeito “desenhando” é revelação de `strokeDashoffset` sobre o SVG exportado — já coberto em
   `/hyperframes-animation` e no procedimento do [youtube-video.md](youtube-video.md) §6.
3. **Nunca grave a tela do editor** para o vídeo final: o render precisa ser determinístico
   (HTML → MP4 frame a frame). A animação vem do SVG, não do app rodando.
4. **Estados intermediários** (rascunho → completo): exporte variantes e faça o switch/morph na
   timeline, em vez de simular o desenho em tempo real.

## Cuidados

- `coleam00/excalidraw-diagram-skill` (~5k ⭐) é popular, mas **não declara licença** — não copie o
  conteúdo; use só como referência de ideia.
- Gráficos de dados (barras, linhas, dispersão) não são caso de Excalidraw: use os blocos do
  registry (`npx hyperframes add bar-chart`) ou `/motion-graphics`.
- O estilo “desenhado à mão” compete com polícia de borda: mantenha um estilo por vídeo. Não
  misture Excalidraw com UI limpa do produto na mesma cena sem intenção.

## Rotas relacionadas

- Diagramas animados prontos → `lanshu-animated-architecture-diagram` (traço à mão, GIF) e
  `archify` (HTML/SVG explorável).
- Animação de path/SVG na composição → `/hyperframes-animation`, `/hyperframes-keyframes`.
- Explicadores técnicos isométricos → `anatomy` ([anatomy.md](anatomy.md)).
- Otimizar o SVG antes de entrar na composição → [svgo.md](svgo.md).
