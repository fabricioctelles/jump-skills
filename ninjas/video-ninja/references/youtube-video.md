# YouTube Video — talking-head com motion graphics

Steer de pipeline. Não é skill instalada e não entra no bloco `repos`.

Use quando o pedido for editar um talking-head bruto até um vídeo de YouTube com motion graphics
explicativos. Neste entregável o motor da composição é **Remotion**. Não comece por HyperFrames.

Skills que continuam valendo ao lado deste steer:

| Peça | Skill |
|---|---|
| Composição Remotion, frame determinístico, render | `/remotion-best-practices`, `/remotion-markup`, `/remotion-render` |
| Probe, encode final, contact sheet, loudness | `ffmpeg-skill` |
| Fonte de música e SFX royalty-free | `/media-use` |

`/talking-head-recut` e `/embedded-captions` continuam para cards de podcast e para legenda sem este
pacote. Este steer é o procedimento quando o entregável é o vídeo de YouTube inteiro.

---

## Entradas do brief

Substitua os placeholders. Não invente duração, handle ou caminho.

| Campo | Exemplo | Regra |
|---|---|---|
| Vídeo bruto | `path/to/raw.mp4` | Arquivo local autorizado |
| Idioma da fala | português | Não traduzir |
| Teto de duração | `6:30` | No máximo o valor do brief |
| Estilo | premium, limpo, editorial | Referência de acabamento Anthropic/Apple |
| End card | inscrever-se + seguir no X + “comment what you want to see next” | URL do X vem do brief (`https://x.com/handle`) |

## Regras que não se negociam

- Nunca cobrir o rosto.
- Nunca mostrar onde a pessoa mora. Setas e recortes de objetos da sala não podem revelar endereço,
  fachada, vista da rua ou qualquer marca identificável do lugar.
- Números e afirmações entram na tela exatamente como foram ditos.
- Conferir nomes e grafias na web antes de irem para a tela.
- Sem estatística, depoimento ou UI inventados.
- Copy de tela curta e concreta, sem clichê de IA.
- Não publicar nada sem o OK de quem pediu o vídeo.

---

## Stack

| Camada | Ferramenta |
|---|---|
| Composição | [Remotion](https://www.remotion.dev) — uma composition, 1920×1080, 30 fps |
| Cortes e encode | ffmpeg |
| Análise | Python (transcrição indexada, envelope RMS, cortes de áudio em numpy) |
| Transcrição | ElevenLabs Scribe, com timestamps por palavra. Marca fillers como "hã" e "é" |
| Fallback de ASR | Whisper, só se Scribe não estiver disponível |

Credenciais do Scribe ficam fora deste repositório. Não gravar chave em arquivo do projeto.

Se usar Whisper: o fim de cada palavra se estica sobre a pausa. Refinar todo ponto de corte com a
energia do áudio antes de cortar.

A licença do Remotion é source-available. Conferir se o uso cabe na licença gratuita antes de
render de produção. Não descrevê-la como MIT.

---

## 1. Planejar o corte

1. Transcrever o bruto com índice de palavra: índice → texto, `start`, `end`.
2. Escolher os trechos que ficam por índice de palavra. Tirar fillers, falsos começos, frases
   repetidas e tangentes fracas até caber no teto.
3. Abrir com a frase mais forte (2–4 s) como cold open, antes do resto.

Guardar a lista de keep-ranges e o texto pretendido. O QA do corte compara contra esse texto.

## 2. Cortar com quadro inteiro e A/V em sincronia

Pontos de corte:

- Cortar no silêncio entre palavras, nunca no meio de uma palavra.
- Manter cerca de 50 ms antes da primeira palavra e cerca de 60 ms depois da última.
- Se o trecho termina uma frase, manter cerca de 160 ms depois da última palavra.

Silêncios dentro dos trechos mantidos:

- Detectar com envelope RMS de 10 ms.
- Medir o piso de ruído deste take antes de fixar o limiar. Um limiar em torno de −38 dBFS funcionou
  num take de referência; não reutilizar esse número sem medir.
- Encurtar qualquer pausa acima de 0,32 s para 0,22 s.
- Depois do fim de uma frase, o teto da pausa encurtada é 0,36 s.

Arredondar toda fronteira para quadro inteiro a 30 fps e fundir segmentos que se tocam.

Vídeo:

```text
ffmpeg split → trim(start_frame, end_frame) → concat
→ grade leve (hqdn3d, eq, colorbalance, unsharp)
→ intermediário CRF 14
```

Áudio: cortar as mesmas fronteiras em numpy, fades de 8 ms, sem overlap. O A/V permanece em
sincronia porque vídeo e voz usam as mesmas fronteiras.

QA do corte: transcrever de novo o cortado e fazer diff contra o texto pretendido. Corrigir
fragmento que vazou e começo de palavra clipado. Repetir até limpar.

## 3. Rastrear o rosto

- Detectar o rosto a cada 0,2 s (Apple Vision ou MediaPipe).
- Suavizar com média móvel dentro de cada segmento de corte. Nunca atravessar um jump cut.
- Usar a caixa medida para enquadrar a câmera e para colocar o gráfico no lado oposto ao rosto.
- Coordenada de gráfico sai dessa medição. Não estimar posição “no olho”.

## 4. Design system

Paleta única:

| Papel | Cor |
|---|---|
| Palco | `#14120F` |
| Papel | `#F1ECE2` |
| Acento | `#D97A4E` |

Fontes: Fraunces (serif de display), Inter Tight (UI), JetBrains Mono (rótulos). Grão sutil e glow
suave. Sem texto em degradê e sem neon.

Modos de câmera, com morph de cerca de 0,7 s em cubic in-out:

| Modo | Layout |
|---|---|
| Full frame | Câmera ocupa o quadro |
| Split esquerda/direita | Card de câmera com cantos arredondados, 856×936, rosto a 42% da altura do card; gráficos na outra metade |
| PIP | Círculo de 256 px sobre uma folha de papel em tela cheia, nos momentos de capítulo |

O card de câmera fica do lado que deixa o rosto descoberto. O gráfico fica no outro lado.

## 5. Beat sheet em JSON

Cada grupo de frases ganha um visual, disparado no `start` da palavra na timeline já cortada:

- lower third (nome e função);
- números grandes com count-up;
- listas que revelam item a item, no ritmo da fala;
- diagramas SVG que se desenham;
- timeline, antes→depois, cards de comparação, citações;
- setas anotando objetos da sala, sem revelar o lugar.

Estrutura do filme:

1. Cold open com legendas cinéticas.
2. Title card de 1,5 s.
3. Conteúdo.
4. End card: os CTAs do brief e um still de retrato.

## 6. Montar no Remotion

Uma composition, 1920×1080, 30 fps.

- `<OffthreadVideo>` mudo, dentro de um container cujo retângulo e transform vêm dos keyframes de
  layout mais o rastreio do rosto. A voz não entra neste componente. Ela segue o áudio cortado em
  numpy e só é muxada no encode final.
- Cada gráfico é um componente em `<Sequence>`.
- Revelações com `useCurrentFrame` + `interpolate` / `spring` (opacity, translateY, blur).
- SVG draw-on: animar `strokeDashoffset` com o comprimento real do path.
- Jump cut: alternar zoom 1,0 ↔ 1,075 em torno do rosto quando a imagem salta.
- No resto, um zoom lento de respiração de 1–2%, e um punch-in nas punchlines.
- Só determinístico. Sem `Math.random`.

Checar quadros-chave com `npx remotion still`: rosto descoberto, texto sem corte, nada aparecendo
antes do cue.

## 7. Som

Voz, nesta ordem:

- highpass 80 Hz;
- denoise leve;
- −2,5 dB em 280 Hz;
- +2 dB em 3,6 kHz;
- de-ess;
- compressor 3:1.

Música: lo-fi royalty-free (Mixkit é um exemplo, não uma obrigação). Trocar a faixa por seção com
crossfade de 4 s. Registrar a licença da faixa escolhida.

- Duck de 9–12 dB sob a voz na banda da fala, preservando os graves.
- Mais alto só no title card e no end card.

SFX bem sutis: whoosh na troca de layout, pop na revelação, tick no contador.

Master: `loudnorm` em dois passes para −14 LUFS, true peak −1,5 dBTP.

## 8. Render, verificação e entrega

Encode: H.264 CRF 16, AAC 320k, BT.709, `+faststart`. Muxar o vídeo do Remotion com o master de
áudio. Não reencodar a voz por um caminho diferente do que foi medido.

Verificar:

- duração dentro do teto;
- −14 LUFS;
- nenhum trecho congelado acima de 0,3 s;
- contact sheet de 40 quadros;
- transcrever de novo o mix final: pelo menos 95% das palavras batem com o texto pretendido, para
  garantir que a música não mascara a voz.

Entregar:

- o MP4;
- um `.srt` a partir dos timings de palavra da timeline cortada (no máximo 42 caracteres por linha,
  2 linhas);
- capítulos do YouTube (o primeiro em 0:00, cada um com pelo menos 10 s).

Parar antes de publicar. Esperar o OK.
