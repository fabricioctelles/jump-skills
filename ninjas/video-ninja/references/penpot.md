# Penpot — o design source aberto para assets de vídeo

Steer de referência. Não é skill instalada e não entra no bloco `repos`.

Use quando o design do vídeo — ou do produto mostrado no vídeo — vive no **Penpot**, a alternativa
open source ao Figma, e você precisa puxar tokens, componentes e frames para a composição.

| Peça | Constante |
|---|---|
| Penpot | [penpot/penpot](https://github.com/penpot/penpot) — plataforma de design open source, MPL-2.0, ~61k ⭐ |
| MCP oficial | [`@penpot/mcp`](https://www.npmjs.com/package/@penpot/mcp) — servidor MCP oficial da Penpot (remoto hospedado ou local); conecta o agente ao arquivo de design via Plugin API |
| Skill comunitária | [ar27111994/penpot-mcp](https://github.com/ar27111994/penpot-mcp) — skill de agente para criar/auditar design systems no Penpot (MIT, ~28 ⭐) |

## Como usar no pipeline

1. **Exporte como asset, não como vídeo.** A Penpot não renderiza vídeo: frames, componentes e
   tokens saem como SVG/PNG (export) ou valores consultados via API/MCP.
2. **MCP oficial**: suba o servidor (`npx -y @penpot/mcp@latest` para o release atual, ou use o
   endpoint remoto da conta) e conecte o plugin “Load from URL” no arquivo aberto. O agente passa a
   consultar e editar o design diretamente.
3. **Tokens e tipografia como fonte de verdade**: paleta, tipo e espaçamento do design do produto
   mandam na composição — o mesmo princípio do `/product-film` (“o design do produto manda”).
4. **Anime na composição**: o SVG exportado entra no `/hyperframes`; revelações, morphs e câmera
   ficam com a doutrina do Ninja (`/motion-doctrine`).

## Cuidados

- O monorepo da Penpot carrega 25 `SKILL.md` em `.agents/skills/` — são skills de
  **desenvolvimento da própria Penpot** (PRs, testes, changelog), não de autoria de design. Não
  confunda a fonte com o uso.
- MPL-2.0 é copyleft por arquivo: usar a Penpot como ferramenta é livre; incorporar código dela em
  outro projeto exige respeitar a licença.
- Este steer não substitui HyperFrames/Remotion em nenhuma etapa de render.

## Rotas relacionadas

- Import de design para composição → `figma` (skill do HyperFrames; o fluxo conceitual vale para a
  Penpot como design source alternativo).
- Fidelidade ao produto no vídeo → `/product-film`; tokens e direção visual → `/hyperframes-creative`.
- Diagramas e ícones → [excalidraw.md](excalidraw.md), [lucide.md](lucide.md).
