# Motion Lab — procedimento de produção com motion em código

Procedimento operacional sintetizado de dois artigos: [Opus 5.5 Motion Lab: Make Claude Animate
Like a Studio](https://x.com/i/article/2105052379590578176), de Florence (`@flxrnc`), e [Motion
Engineering: Build a Video Studio Around Opus 5.5](https://x.com/0xwhrrari/status/2105643919119696297),
de rari (`@0xwhrrari`). O primeiro registra três experimentos de animação e som; o segundo descreve
brief, referências, variantes, gates e os artefatos de um estúdio reutilizável.

> [!info] Escopo da fonte
> A nota arquivada em `brain/pesquisas/Opus 5.5 Motion Lab - Make Claude Animate Like a Studio.md`
> preserva o texto extraído do X Article. Prompts e dados que aparecem apenas em imagens/vídeos não
> foram extraídos; este playbook resume o texto disponível e não inventa nem reproduz esses prompts.
> O segundo artigo também foi arquivado em `brain/pesquisas/Motion Engineering - Build a Video Studio Around Opus 5.5.md`.

## Quando aplicar

- Loop visual curto, peça de motion para produto ou animação 3D que será desenhada por código.
- Quando as correções precisam apontar para frames e medidas reproduzíveis.
- Quando uma entrega chamada de “um prompt” precisa preservar também as revisões e os ajustes reais.

Continue pelo `/hyperframes` como entrada e use `/motion-doctrine` para as regras de craft. O artigo
mostra HTML/CSS para loops 2D pequenos, Three.js para cenas 3D e Remotion para peças em série,
templates ou guiadas por dados. A escolha final segue os limites de cada workflow já instalado.

## 1. Escreva a especificação como estados verificáveis

Antes da composição, liste cada shot com intervalo de frames, estado inicial/final, ação principal,
parâmetros e handoff. Inclua também os invariantes que não podem mudar, como proporções de um
personagem, geometria do produto, texto da marca ou limites de enquadramento.

```text
GOAL: uma frase sobre o que a pessoa deve perceber ou fazer.
OUTPUT: engine, proporção, resolução, fps, duração e total de frames.
SHOTS: intervalos de frames, um movimento principal, estado final e handoff por shot.
LOOK: câmera, materiais, luz e composição descritos por escolhas observáveis.
PRESERVE: elementos e proporções que não podem variar.
BAN: padrões visuais específicos que não devem aparecer.
RENDER: frame função pura do tempo; sem relógio, timers ou aleatoriedade não semeada.
QA: stills, frames de checagem, testes numéricos, áudio e critérios de aceite.
```

Este é um esquema adaptado para o ninja, não um prompt literal do artigo. Aumente a especificidade
até que cada decisão importante possa ser verificada na imagem ou no código. Em peça 3D, informe
também lente/campo de visão, câmera e parâmetros de geometria. A lista de proibições deve refletir
os clichês que a primeira renderização realmente usou.

## 2. Instrumente o preview para revisão

Durante a iteração, peça ao modelo que mostre frame labels, playhead e marcadores nos beats ou nas
ações que precisam pousar em um frame específico. Esses elementos transformam timing em algo
observável: se o marcador acende antes da ação, há um erro de sincronização. Remova a instrumentação
da composição final.

Faça primeiro stills em poses-chave. Depois revise uma contact sheet de 12 frames como storyboard e
uma tira de frames consecutivos ao redor de cada problema. Veja também a 360 px de largura para
capturar falhas de leitura em tela pequena. Onion skin ajuda a ver espaçamento irregular; um gráfico
de velocidade expõe movimentos lineares e paradas bruscas. Quando uma correção não se sustentar,
compare os dois frames em volta do erro e descreva a diferença visual. Renderize de novo só o que
mudou.

## 3. Conduza rodadas pequenas e com recibos

Por rodada:

1. Registre a versão do projeto/render de entrada, os frames inspecionados e o que está errado.
2. Traduza impressões em instruções com frame e medida: por exemplo, `escala 1.00 → 1.08 → 1.00
   em 6 frames`, em vez de “deixe mais impactante”.
3. Corrija um ou dois pontos; não transforme uma correção localizada numa reescrita geral.
4. Re-renderize, confira o mesmo frame e atualize o registro de follow-ups.

O artigo descreve duas a quatro rodadas como comum, mas a quantidade depende dos erros observados.
Mantenha um registro separado para mudanças criativas e para correções técnicas, como carregamento
de fonte, captura de frame ou configuração de áudio. Conte os follow-ups publicados junto com a
peça; não chame um processo longo de “um prompt”.

Faça uma auditoria objetiva em separado da crítica estética. Verifique landmarks previstos,
proporções preservadas, mudanças de estado, movimentos e beats nos frames declarados. A auditoria
deve falhar quando um evento não acontece no frame especificado, mesmo que o clipe pareça bom no
playback.

## 4. Áudio e loops

- Faça a imagem funcionar sem som; redes sociais podem iniciar o vídeo no mudo.
- Associe cada cue a um evento visual e ao frame esperado. O laboratório relata hits cerca de um
  frame após a imagem e mede o áudio exportado já decodificado.
- Meça loudness, true peak, clipping e padding/continuidade na emenda. O artigo usa -14 LUFS e
  -1 dBTP como alvo para seus vídeos; confirme as especificações da plataforma e do projeto antes
  de adotar esses valores.
- Para um loop de `N` frames, renderize `0` até `N-1`, nunca o frame `N` (que repete o `0`). Use
  `phase = frame / N` e ciclos inteiros para que posição, rotação e formas retornem ao início.
- Exporte o frame `0` como composição completa. Para GIF, use uma paleta comum entre frames e
  valide a duração efetiva, pois a grade de centésimos de segundo pode introduzir drift.
- Para um loop de 6 segundos a 24 fps em GIF, o artigo corrige o arredondamento alternando cinco
  frames de 40 ms e um de 50 ms; confirme no arquivo exportado que a duração é 6,00 s.

Use `hyperframes-audio` para mixar trilhas da composição e `ffmpeg-skill` para medir e validar o
arquivo final. Escute o mix final além de medir; loudness e alinhamento numérico não garantem que a
trilha tenha forma ou que soe conectada à imagem. Não trate uma medição relatada em um artigo como
norma universal de plataforma.

## 5. Preserve a verdade do produto e as referências

Separe no brief o que é fato verificável sobre o produto do que é direção criativa. Dê ao agente
acesso às telas, logos, textos e assets reais que podem aparecer; peça uma lista dos assets que ele
planeja usar e aprove-a antes de renderizar. Se faltar uma tela ou outro material necessário, pare
para pedir o asset ou proponha um frame de teste. Não substitua uma interface real por uma tela
inventada que pareça plausível.

Quando usar uma referência visual, identifique a gramática de estilo que pode ser aproveitada —
tipografia, contraste, ritmo, movimento ou paleta — e preserve a identidade e os assets do projeto.
Use `/media-use` para localizar e verificar mídia. A referência informa escolhas; ela não autoriza
copiar assets de terceiros.

Cada beat deve ter estado de entrada, estado de saída e razão narrativa. Se um shot não acrescenta
informação ou não prepara a próxima mudança, remova-o. Defina regras de movimento por classe de
objeto: um controle pequeno pode responder rápido, enquanto um painel ou uma câmera precisa assentar
sem confundir a orientação. A pergunta de revisão é se, depois do movimento, o olhar sabe onde
ficar.

## 6. Construa variantes e gates retomáveis

Uma versão vertical não é um crop automático da horizontal. Reaproveite assets e estados narrativos,
mas ajuste composição, escala de texto, quantidade de elementos e caminho de câmera para cada formato.
Gere contact sheets e revise cada variante separadamente.

Guarde em arquivos o brief, a lista de assets aprovados, a gramática de estilo, a state list, o
contrato de render, os critérios de aceite e os resultados de cada gate. Um run longo deve declarar
quais artefatos vêm em seguida e parar quando faltar uma referência, um asset ou uma decisão de
marca. Nessas situações, peça a informação ou produza um teste pequeno; não gaste um render completo
em cima de uma suposição. Só declare a entrega pronta depois de revisar a evidência, não porque o
comando de exportação terminou.

## O que cada artigo acrescenta

| Tema | Opus 5.5 Motion Lab (`@flxrnc`) | Motion Engineering (`@0xwhrrari`) |
|---|---|---|
| Motion determinístico e state list | Contrato de render, frames-alvo e loop exato | Confirma seekability como requisito de revisão local |
| Iteração | Stills, frame labels, contact sheet, follow-ups pequenos e auditoria numérica | Contact sheet por beat, crítica visual explícita e revisão antes de exportar |
| Diferencial | Experimentos medidos de animação, som e GIF | Verdade do produto, referência autorizada, variantes de formato e continuidade entre sessões |
| Som | Medições de sync e loudness relatadas pelo laboratório | Acrescenta escuta humana e integração da trilha na narrativa |
| Produção recorrente | Mantém os prompts e follow-ups com cada peça | Empacota brief, assets e gates como base para a próxima produção |

## Fontes e limites

- [X Article: Opus 5.5 Motion Lab](https://x.com/i/article/2105052379590578176)
- [Post de Florence que compartilha o artigo](https://x.com/flxrnc/status/2105311836190978392)
- [Post/X Article: Motion Engineering](https://x.com/0xwhrrari/status/2105643919119696297)
- Nota arquivada: `brain/pesquisas/Opus 5.5 Motion Lab - Make Claude Animate Like a Studio.md`
- Nota arquivada: `brain/pesquisas/Motion Engineering - Build a Video Studio Around Opus 5.5.md`

Os exemplos do artigo usam Opus 5.5. O procedimento pode ser aplicado com outros modelos, mas o
resultado depende da capacidade de gerar e inspecionar código/imagens. Números de desempenho,
visualizações, timing e mixagem são relatos dos experimentos do artigo, não garantias.
