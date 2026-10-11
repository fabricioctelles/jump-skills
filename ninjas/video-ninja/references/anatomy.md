# Anatomy como fonte visual opcional

**Estado:** avaliada; não instalada no ambiente.  
**Decisão:** incluir no roteamento do Video Ninja como especialista opcional em figuras isométricas
para explainers técnicos. Não contar como skill instalada, engine ou repositório sincronizado.

## O que oferece

[`wheresryan22/anatomy`](https://github.com/wheresryan22/anatomy) é uma Agent Skill que explica um
conceito técnico construindo uma máquina ou objeto isométrico com peças e comportamento coerentes.
O output pode ser HTML independente, SVG isolado ou componentes React/Next. Também oferece uma
camada WebGL opcional para efeitos como água, luz, fogo e vapor. O repositório declara licença MIT.

O diferencial útil para vídeo é uma **cena/asset com mecanismo visual**, em vez de apenas cards,
gráficos ou diagramas de caixas e setas. A figura pode servir de cena explicativa ou asset dentro
de uma composição HyperFrames.

## Quando usar

- Explainers de sistemas, hardware, ciência ou processos em que partes e relações físicas ajudam
  a explicar o conceito.
- Demonstrações em que uma transformação ou mecanismo é o centro da narrativa.
- Quando uma figura isométrica detalhada vale o tempo maior de construção e revisão.

## Limites e integração

- Não é biblioteca de charts: não fornece eixos, séries nem visualizações de dados.
- Não é timeline, editor ou renderizador de vídeo. HyperFrames continua responsável pela
  composição e pelo vídeo final.
- Seu domínio é máquinas, instrumentos, ferramentas e móveis; conceitos sem mecanismo físico
  tendem a render menos.
- A auditoria geométrica e as capturas em Chrome ajudam a revisar encaixes, linhas e estados.
- O modo 3D está em beta; WebGL depende de suporte do navegador. A versão SVG continua sendo a
  base legível.
- O projeto é escrito para Claude Code e a instalação documentada instala em
  `~/.claude/skills/anatomy`. **Não foi instalado** nem validado como disponível no Codex/homelab;
  o roteador deve verificar a presença da skill antes de invocá-la.

### Fluxo sugerido quando estiver instalada

1. Definir o conceito, números e mecanismo que precisam ser verdadeiros.
2. Pedir à Anatomy a figura e especificar HTML independente ou SVG conforme o destino.
3. Executar a auditoria/capturas previstas pela skill e revisar o resultado visual.
4. Incorporar o asset no `/hyperframes`; usar `/motion-doctrine` para movimento e continuidade.
5. Renderizar e verificar com o fluxo de vídeo normal.

Se Anatomy não estiver instalada, compor a cena com os recursos disponíveis do HyperFrames ou
escolher outra representação. Não descrever a skill como capacidade disponível.

## Origem da avaliação

- Tweet de Meng To: <https://x.com/MengTo/status/2109182449179836579?s=20>. O exemplo citado usa
  `/anatomy` para explicar como Seedream separa uma imagem em camadas, como um único HTML, e pede
  uma aproximação de câmera/zoom nas cenas 1 a 5.
- Repositório e documentação: <https://github.com/wheresryan22/anatomy> e
  <https://github.com/wheresryan22/anatomy/blob/main/SKILL.md>.
- Avaliação consultada em 2026-10-11. Revalidar escopo, compatibilidade e estado antes de instalar.
