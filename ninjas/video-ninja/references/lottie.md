# Reuso de animações Lottie em HyperFrames

**Estado no Video Ninja:** instrução de integração sob demanda. Lottie Web não está instalada pelo
Ninja; carregue a dependência somente quando o projeto fornecer ou já usar um asset Lottie.  
**Fonte:** [`airbnb/lottie-web`](https://github.com/airbnb/lottie-web).

## Quando usar

Reaproveitar animações `.json` exportadas de After Effects como elementos de uma composição
HyperFrames. Não trocar o renderer da composição pelo player Lottie, nem buscar ou gerar assets
remotamente durante render.

## Captura determinística

Player Lottie oferece `goToAndStop(value, isFrame)` para buscar um ponto exato em tempo ou frame. Para
captura por seek do HyperFrames:

1. Instalar/bundlar o player como dependência local do projeto que usa o asset.
2. Carregar o JSON e dependências referenciadas localmente; manter autoplay e loop desligados.
3. Em cada chamada de `seek(t)`, calcular a posição correspondente no asset e chamar
   `goToAndStop(...)`; não depender de reprodução em tempo real, `setTimeout` ou do último estado
   visual do player.
4. Confirmar que o frame foi atualizado antes de capturar. Conferir eventos/tempo de carregamento do
   player e das imagens referenciadas.
5. Inspecionar frames no início, meio, fim e em transições; rodar o `check` do HyperFrames e revisar
   o vídeo final.

Use milissegundos com `goToAndStop(1000 * seconds, false)` ou frame explícito com
`goToAndStop(frame, true)`. Fixe o mapeamento entre relógio da composição e FPS original do Lottie;
não arredonde silenciosamente quando a composição usa outro frame rate.

## Limites e revisão

- O JSON pode referenciar imagens, fontes e recursos auxiliares; incluí-los no projeto local para que
  a renderização não dependa de rede.
- Conferir transparência, clipping, dimensões, FPS e cores sobre o fundo final.
- Se o player não responder a seeks repetidos com o mesmo frame ou não estabilizar antes da captura,
  não confiar no preview; converter o asset ou reconstruir a animação em HyperFrames.
- A integração deve respeitar licenças e proveniência do arquivo Lottie recebido.

Lottie é um formato/player de asset, não uma skill nem engine de vídeo. Não aumenta a contagem de
skills instaladas nem entra nos repositórios do `sync-repos.sh`.
