# WhisperX — backend opcional de transcrição e alinhamento

**Estado no Video Ninja:** avaliado, não instalado e sem integração automática.  
**Fonte:** [`m-bain/whisperX`](https://github.com/m-bain/whisperX), licença BSD-2-Clause.

## Quando considerar

Use WhisperX em material falado quando o trabalho exigir timestamps por palavra, segmentação para
legendas ou diarização. O projeto combina reconhecimento de fala com alinhamento forçado para
marcar palavras e pode atribuir IDs de falantes.

É uma fonte de timing/texto para os workflows de talking-head, não editor nem renderizador. O Ninja
deve verificar se `whisperx` está disponível no ambiente; esta referência, por si só, não instala a
dependência.

## Limite em relação à “fita”

WhisperX trabalha com **timing por palavra** e diarização. Não oferece a saída letra-a-letra a cada
20 ms usada pela “fita” do My-Little-Studio para localizar início de sílaba e preservar tentativas
repetidas. Para cortes finos, não substituir a fita por WhisperX. As duas ferramentas podem servir a
etapas diferentes: WhisperX para transcript/timing por palavra; fita para decisão de corte que exige
microtiming e retomadas.

Transcrição e diarização são hipóteses a conferir no áudio original. Um timestamp alinhado não prova
que a palavra foi reconhecida corretamente nem identifica por si só o nome real de uma pessoa.

## Fluxo de uso

1. Usar só em áudio/vídeo local autorizado para processamento.
2. Verificar disponibilidade, versão, modelo, idioma e capacidade (CPU ou GPU/CUDA) antes da etapa.
3. Produzir transcrição e, apenas quando necessário, diarização.
4. Escutar e corrigir erros, nomes próprios, pontuação, falas sobrepostas e cortes de frase.
5. Converter os dados revisados para o formato de cues usado pelo workflow de legendas/corte.
6. Continuar com `/embedded-captions` e `/captions-overlay`; validar sincronismo em frames e no áudio.

## Requisitos e credenciais

- Instalação documentada com `pip install whisperx`; mantenha-a isolada em ambiente Python do
  projeto/pipeline e pinne versão/modelos antes de produção.
- GPU/CUDA é opcional; CPU pode ser usada, com desempenho menor. O README atual recomenda CUDA 12.8
  para aceleração GPU.
- A diarização depende do modelo `speaker-diarization-community-1`: requer token Hugging Face e
  aceite dos termos daquele modelo. Solicite o token só se a diarização for necessária e não
  imprima/registre seu valor.
- Registre os idiomas e modelos usados junto aos artefatos gerados para tornar a revisão repetível.

Não tornar WhisperX default nem afirmar que está instalado. Se falhar ou exigir configuração ausente,
voltar para o backend de áudio disponível e deixar a limitação explícita.
