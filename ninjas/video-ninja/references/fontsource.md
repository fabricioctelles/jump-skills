# Fontsource — fontes self-hosted para render determinístico

Steer de referência. Não é skill instalada e não entra no bloco `repos`.

Use quando uma composição precisar de **fonte própria, local e versionada** — sem CDN. Render de
vídeo é headless: fonte remota é fonte faltando.

| Peça | Constante |
|---|---|
| Fontsource | [fontsource/fontsource](https://github.com/fontsource/fontsource) — fontes open source empacotadas como pacotes npm, MIT, ~6,2k ⭐ |

## Por que isso importa em vídeo

- O HyperFrames captura frames no Chrome headless; se a fonte vem de CDN, o primeiro frame pode
  sair com fallback (FOUT) — ou o render offline falha.
- `fframes-video` checa fontes no `inspect`; `ffmpeg-skill` desenha texto com as fontes do sistema —
  os dois exigem arquivo local.
- Determinismo: a mesma versão do pacote reproduz a mesma fonte em qualquer máquina.

## Como usar

```bash
npm install @fontsource/inter            # estático
npm install @fontsource-variable/inter   # variável (um arquivo, todos os pesos)
```

```js
import "@fontsource/inter/400.css";
import "@fontsource/inter/600.css";
// ou variável:
import "@fontsource-variable/inter";
```

- Espere `document.fonts.ready` antes de capturar o primeiro frame.
- Em projetos Remotion (`/product-film`, [youtube-video.md](youtube-video.md)), carregue via
  `@remotion/google-fonts` ou `staticFile()` apontando para o arquivo local do pacote.

## Cuidados

- O pacote é MIT, mas **cada fonte tem a sua licença** (em geral SIL OFL) — confira a fonte escolhida
  para uso comercial e redistribuição.
- Prefira a variável quando houver muito texto; subset (latin, latin-ext) reduz peso.
- Não use Google Fonts por URL no render final.

## Rotas relacionadas

- Tipografia da composição → `/hyperframes-creative`.
- Fontes no Remotion → `/remotion-multimedia`, [youtube-video.md](youtube-video.md).
