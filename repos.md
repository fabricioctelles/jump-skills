# Repositórios por Ninja

Cada seção `[ninja-name]` contém os repositórios fonte das skills daquele ninja.

---

## [aws-ninja]

Repositórios oficiais AWS com skills para agentes IA.

```repos
https://github.com/aws/agent-toolkit-for-aws
https://github.com/aws/tools-for-devops-agent
https://github.com/aws-samples/sample-apex-skills
https://github.com/aws-samples/sample-agent-skills-for-builders
https://github.com/aws-samples/sample-well-architected-skills-and-steering
https://github.com/aws-samples/sample-corgiro-aws-ops-skills
https://github.com/aws-samples/sample-strands-agents-agentskills
https://github.com/aws-samples/sample-agentcore-websearch-agent-skill
https://github.com/aws-samples/sample-eks-to-agentcore-mcpserver-skills
https://github.com/aws-samples/sample-devops-agent-custom-mcp-skills
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| agent-toolkit-for-aws | aws | MCP servers, skills e plugins oficiais AWS |
| tools-for-devops-agent | aws | Skills operacionais do DevOps Agent |
| sample-apex-skills | aws-samples | Platform engineering (EKS/ECS) |
| sample-agent-skills-for-builders | aws-samples | CDK, security, testing workflows |
| sample-well-architected-skills-and-steering | aws-samples | Well-Architected Framework |
| sample-corgiro-aws-ops-skills | aws-samples | Multi-account cloud operations |
| sample-strands-agents-agentskills | aws-samples | Strands Agents SDK skills |
| sample-agentcore-websearch-agent-skill | aws-samples | AgentCore web search |
| sample-eks-to-agentcore-mcpserver-skills | aws-samples | EKS to AgentCore migration |
| sample-devops-agent-custom-mcp-skills | aws-samples | Custom DevOps Agent skills |

---

## [azure-ninja]

Skills Azure combinando o plugin oficial Microsoft + skills Azure da comunidade awesome-copilot.

```repos
https://github.com/microsoft/azure-skills
https://github.com/github/awesome-copilot
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| azure-skills | microsoft | Plugin oficial Azure: prepare, validate, deploy, diagnostics, cost, AI, RBAC, Foundry |
| awesome-copilot | github | Coleção comunitária - usamos apenas skills azure-* |

---

## [datadog-ninja]

Skills Datadog oficiais - observabilidade completa via CLI `pup`: APM, logs, monitors, live debugger, CI/test optimization, audit trail, browser SDK, cloud integrations e Agent Observability (LLM Ops).

```repos
https://github.com/DataDog/pup
https://github.com/datadog-labs/agent-skills
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| pup | DataDog | CLI oficial Datadog (`pup`) + 11 skills bundled: APM, logs, monitors, live debugger, symbol database, docs, code generation, CI/flaky tests |
| agent-skills | datadog-labs | 46 skills adicionais: Agent Observability (LLM Ops), audit trail, browser SDK, cloud integrations (AWS/Azure/GCP/OCI), SSI onboarding, Datadog Apps |

**Skills incluídas (57 total):**
- **CLI & Core (pup):** dd-pup, dd-docs, dd-code-generation, dd-file-issue, dd-apm, dd-logs, dd-monitors, dd-debugger, dd-symdb, dd-triage-flaky-test, dd-unblock-pr
- **Agent Observability (LLM Ops):** experiment-analyzer, experiment-bootstrap, trace-rca, eval-bootstrap, eval-pipeline, session-classify, auto-experiment, replay-trace
- **Audit Trail:** security-investigation, key-compromise, cost-spike-investigation, compliance-report, ai-activity-audit
- **Browser SDK:** dd-browser-sdk, upgrade-v5, upgrade-v6, upgrade-v7, dd-instrument-rum
- **APM SSI (K8s + Linux):** agent-install, enable-ssi, verify-ssi, troubleshoot-ssi, onboarding-summary, service-remapping
- **Cloud Integrations:** dd-aws-integration, dd-azure-integration, dd-gcp-integration, dd-oci-integration
- **Software Delivery:** unblock-pr, triage-flaky-test
- **Other:** dd-apps (Datadog App Builder), dd-security/csm, dd-product-recommender, dd-account-setup

---

## [firecrawl-ninja]

Repositório oficial Firecrawl com skills para web scraping e research.

```repos
https://github.com/firecrawl/skills
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| skills | firecrawl | Skills core, build e workflows do Firecrawl CLI |

---

## [google-cloud-ninja]

Skills Google Cloud Platform - infraestrutura, databases, networking, observability, segurança e Well-Architected Framework.

```repos
https://github.com/google/skills
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| skills | google | Repo principal - usamos skills/cloud/ (GKE, Cloud Run, BigQuery, Spanner, IAM, Monitoring, Storage, WAF) |

**Skills incluídas:** GKE (basics, networking, security, scaling, cost), Cloud Run, BigQuery, AlloyDB, Spanner, Cloud SQL, Bigtable, Cloud Storage, Cloud Logging, Cloud Monitoring, IAM, Well-Architected Framework, gcloud CLI, Cloud Build, Workload Manager.

---

## [google-ai-ninja]

Skills Google AI/ML - Gemini API, Agent Platform, Genkit, RAG e soluções de IA.

```repos
https://github.com/google/skills
https://github.com/google/agents-cli
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| skills | google | Repo principal - usamos skills AI/ML (Gemini API, Agent Platform, Genkit, LiveAPI) |
| agents-cli | google | ADK (Agent Development Kit) skills para build/deploy de agentes |

**Skills incluídas:** Gemini API, Agent Platform (deploy, eval, inference, tuning, RAG), Genkit (JS, Python, Go, Dart), LiveAPI, solution-architecture para AI workloads.

---

## [google-ads-ninja]

Skills Google Ads - APIs de advertising, Mobile Ads SDK e IMA SDK.

```repos
https://github.com/google/skills
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| skills | google | Repo principal - usamos skills/ads/ (Google Ads API, Mobile Ads, IMA SDK, Data Manager) |

**Skills incluídas:** Google Ads API (quickstart, MCP setup, diagnostics), Mobile Ads SDK (banner, interstitial, rewarded, migration), IMA SDK (client-side, DAI), Data Manager API.

---

## [google-mobile-ninja]

Skills desenvolvimento mobile - Android, Flutter e Dart.

```repos
https://github.com/android/skills
https://github.com/flutter/agent-plugins
https://github.com/dart-lang/skills
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| skills | android | Android skills oficiais (Jetpack Compose, Navigation, CameraX, AGP, Play) |
| agent-plugins | flutter | Flutter plugins oficiais (widgets, testing, state management) |
| skills | dart-lang | Dart language skills (testing, packages, analysis) |

**Skills incluídas:** Jetpack Compose, Navigation 3, CameraX, AGP 9 upgrade, R8 analyzer, Play services, Flutter widgets, Flutter testing, Dart unit tests, Dart packages.

---

## [google-firebase-ninja]

Skills Firebase - backend-as-a-service, Firestore, Auth, Hosting e integrações.

```repos
https://github.com/firebase/agent-skills
https://github.com/google/skills
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| agent-skills | firebase | Skills Firebase oficiais (Firestore, Auth, Hosting, Functions) |
| skills | google | Repo principal - usamos firebase-basics |

**Skills incluídas:** Firebase CLI setup, Firestore (queries, security rules, indexes), Firebase Auth, Firebase Hosting, Cloud Functions, Firebase Extensions.

---

## [google-analytics-ninja]

Skills Google Analytics - Admin API e Data API para reporting e configuração.

```repos
https://github.com/google/skills
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| skills | google | Repo principal - usamos skills/analytics/ |

**Skills incluídas:** Google Analytics Admin API (accounts, properties, data streams, conversions), Google Analytics Data API (reports, metrics, dimensions).

---

## [yylo-ninja]

Skills YYLO oficiais para orquestração de agentes de código: gestão de tarefas Kanban no YYLO Ledger, planejamento (PDR + tasks), wiki/workflow/artifact Records duráveis e execução autônoma single-task (Ralph loop).

```repos
https://github.com/yylo-dev/yylo-skills
```

| Repositório | Org | Descrição |
|-------------|-----|-----------|
| yylo-skills | yylo-dev | Fonte canônica das skills oficiais YYLO CLI / YYLO Ledger: ledger-tasks, wiki, workflow, artifact Records, planejamento, Ralph loop |

**Skills incluídas:** ledger-tasks-yylo (board Kanban), plan-ledger-tasks-yylo (PDR + tasks), understand-project-yylo (inspeção do projeto), wiki-yylo (conhecimento durável), workflow-yylo (workflows validados), artifact-yylo (evidência com provenance), ralph-loop-yylo (execução single-task).

---

## [video-ninja]

<!-- no-sync: as 42 skills dos 5 repositórios já estão instaladas globalmente como agent skills.
     Clonar aqui adicionaria ~506 MB (489 MB só do hyperframes) sem ganho funcional.
     sync-repos.sh detecta este marcador e pula a seção. -->

Cinco repositórios de vídeo que se complementam: um motor de render, uma doutrina de qualidade,
uma framework alternativa e dois nichos (captura de tela e anti-repetição).

```repos
https://github.com/heygen-com/hyperframes
https://github.com/echris6/motion-video-kit
https://github.com/remotion-dev/skills
https://github.com/Rieranthony/product-film-skill
https://github.com/tugrawork-creator/saas-motion-kit
```

| Repositório | Org | Skills | Descrição |
|-------------|-----|--------|-----------|
| hyperframes | heygen-com | 27 | Motor: HTML → vídeo via Chrome headless + FFmpeg. 21 skills publicadas (roteador + 8 domínios + 10 workflows + CLI) + 6 de doutrina interna. 173 blocos no registry. Apache-2.0 |
| motion-video-kit | echris6 | 1 | Doutrina: loop de crítico separado, princípios de 28 filmes de launch, quality bar, sound design. MIT |
| skills | remotion-dev | 12 | Remotion oficial (4.0.529) — 2ª framework, port e projetos existentes |
| product-film-skill | Rieranthony | 1 | Captura de tela → product film com AVFoundation, sem ffmpeg. MIT |
| saas-motion-kit | tugrawork-creator | 1 | Promo SaaS: tone matrix, variety audit, 24 transições, 100 temas de storyboard |

**Skills incluídas:** 42 no total — `hyperframes` (roteador), `hyperframes-core`, `-animation`,
`-keyframes`, `-creative`, `-audio`, `-cli`, `-registry`, `-studio`, `media-use`,
`motion-doctrine`, `cut-the-curve`, `seam-craft`, `oversized-cursor`, `captions-overlay`,
`changelog-video`, `general-video`, `product-launch-video`, `talking-head-recut`,
`embedded-captions`, `faceless-explainer`, `pr-to-video`, `music-to-video`, `motion-graphics`,
`slideshow`, `figma`, `remotion-to-hyperframes`, `business-motion-film`, `saas-motion-video`,
`product-film`, `remotion-*` (12).

> ⚠️ **Este ninja não usa `sync-repos.sh`.** As 42 skills dos 5 repositórios já estão instaladas
> globalmente (`~/.agents/skills/`, espelhadas em `~/.claude/` e por symlink em `~/.codex`,
> `~/.gemini`, `~/.cursor`). Clonar aqui adicionaria ~506 MB sem ganho funcional — o `hyperframes`
> sozinho tem 489 MB.
>
> As 6 skills de doutrina interna (`motion-doctrine`, `cut-the-curve`, `seam-craft`,
> `oversized-cursor`, `captions-overlay`, `changelog-video`) são `metadata: internal: true` no
> upstream: a CLI não as instala e `npx hyperframes skills` faz prune das não-publicadas.
> Estão registradas no lockfile como `internal-doctrine`; se sumirem, reinstalar copiando de
> `.agents/skills/<nome>/` do repo.

Detalhe completo: `ninjas/video-ninja/references/repos.md`.

---

## Formato

Cada seção segue o formato:

```
## [ninja-name]

Descrição opcional.

\`\`\`repos
https://github.com/org/repo1
https://github.com/org/repo2
\`\`\`
```

O script `sync-repos.sh` parseia os blocos `repos` de cada seção.

### Opt-out de clonagem (`no-sync`)

Se as skills de um ninja já são consumidas como **agent skills instaladas globalmente**, a
clonagem é peso morto. Adicione `no-sync` em qualquer lugar da seção (um comentário HTML basta) e
o `sync-repos.sh` pula o ninja — tanto no sync quanto no `--status`:

```markdown
## [meu-ninja]

<!-- no-sync: skills já instaladas globalmente; clonar não agrega -->
```

Único uso hoje: `video-ninja` (489 MB de repo para skills que já estão em `~/.agents/skills/`).

#### A garantia tem duas camadas

O marcador `no-sync` é um **comentário** — fácil de apagar numa edição inocente (reordenar seções,
reformatar, um gerador reescrever o arquivo). Por isso ele **não** é a única proteção:

1. **`NEVER_CLONE_NINJAS`** em `sync-repos.sh` — lista hardcoded. Não some por editar conteúdo,
   só por editar código.
2. **Marcador `no-sync`** em `repos.md` — secundário, permite que um ninja **novo** faça opt-out
   sem tocar em código.

O teste `tests/test-no-sync.sh` cobre os dois cenários (com e sem o marcador) e roda no CI
(`.github/workflows/no-sync-guard.yml`). Rode local: `./tests/test-no-sync.sh`.
