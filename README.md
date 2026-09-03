<div align="center">

<img src="assets/ninja-logo.png" alt="Jump Skills Ninjas" width="400"/>

### Multi-Tenant Ninja System for AI Agent Orchestration

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
[![Ninjas](https://img.shields.io/badge/Ninjas-10-blueviolet?style=for-the-badge&logo=github)](#-available-ninjas)
[![Skills](https://img.shields.io/badge/Skills-500+-green?style=for-the-badge&logo=github)](#-available-ninjas)

<br/>

<img src="assets/jump-skills-ninja.gif" alt="Jump Skills Ninja in action" width="640"/>

<br/>

**Intelligent routing skills that orchestrate specialized agent capabilities from multiple cloud providers**

[AWS Ninja](#-aws-ninja) •
[Azure Ninja](#-azure-ninja) •
[Google Cloud Ninja](#-google-cloud-ninja) •
[Google AI Ninja](#-google-ai-ninja) •
[More...](#-available-ninjas) •
[Installation](#-installation)

<br/>

</div>

---

## 🤔 What are Ninjas?

**Ninjas** are intelligent **meta-skills** — master orchestrators that route your requests to the most appropriate specialized skill from a curated library. Instead of manually searching through hundreds of individual skills, you simply describe your task and the Ninja:

1. **🎯 Identifies** the most relevant specialized skill(s)
2. **📖 Loads** the full skill instructions on-demand
3. **⚡ Executes** the task with expert-level knowledge

Think of Ninjas as **expert dispatchers** — they understand the entire landscape of available capabilities and always route you to the right specialist.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           YOUR REQUEST                                  │
│                    "Set up an EKS cluster with                          │
│                     Karpenter for autoscaling"                          │
└─────────────────────────────────────────────────────────────────────────┘
                                   │
                                   ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                          🥷 AWS NINJA                                   │
│                    Analyzes intent & context                            │
│                                                                         │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐                │
│   │ eks-design  │    │eks-karpenter│    │eks-security │                │
│   │   skill     │ ── │   skill     │ ── │   skill     │                │
│   └─────────────┘    └─────────────┘    └─────────────┘                │
│         ▲                  ▲                                            │
│         └────── SELECTED ──┘                                            │
└─────────────────────────────────────────────────────────────────────────┘
                                   │
                                   ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                     EXPERT EXECUTION                                    │
│          Full skill knowledge loaded & task completed                   │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## ⚠️ Important: Installation Notice

> [!CAUTION]
> **This repository cannot be installed via `npx skills`**
> 
> Jump Skills is a **meta-repository** that orchestrates skills from multiple external repositories. The Ninja skills reference paths to cloned repositories that must exist locally.
> 
> **To use Jump Skills, you must:**
> 1. Clone this repository
> 2. Run `./sync-repos.sh` to clone all source repositories
> 3. Run `./install-ninjas.sh` to install Ninjas to your agents

---

## 📦 Installation

### 🤖 Ask Your Agent

Simply copy and paste this prompt to your AI coding agent:

```
Clone https://github.com/fabricioctelles/jump-skills,
then run ./sync-repos.sh to clone all skill repositories,
and ./install-ninjas.sh to install the Ninjas.
```

### Manual Installation

```bash
# 1. Clone the repository
git clone https://github.com/fabricioctelles/jump-skills.git
cd jump-skills

# 2. Sync all source repositories (clones ~20 repos, ~800MB)
./sync-repos.sh

# 3. Install Ninjas to your agents (Claude Code, Kiro, Cursor, etc.)
./install-ninjas.sh
```

### What gets installed?

The installer detects and installs to these AI coding agents:

| Agent | Path |
|-------|------|
| Claude Code | `~/.claude/skills/` |
| Kiro CLI | `~/.kiro/skills/` |
| Cursor | `~/.cursor/skills/` |
| Codex | `~/.codex/skills/` |
| OpenCode | `~/.opencode/skills/` |
| VS Code Copilot | `~/.github/copilot/skills/` |
| And more... | Auto-detected |

---

## 🥷 Available Ninjas

### <img src="https://img.shields.io/badge/AWS-FF9900?style=flat&logo=amazonaws&logoColor=white" height="20"/> AWS Ninja

> **230+ skills** from 10 official AWS repositories

The AWS Ninja is your expert guide for all things Amazon Web Services. It orchestrates skills covering:

| Category | Skills | Examples |
|----------|--------|----------|
| **Compute** | 15+ | EC2, Lambda, ECS, Fargate, Step Functions |
| **Databases** | 12+ | DynamoDB, Aurora, RDS, ElastiCache, Neptune |
| **Containers & K8s** | 40+ | EKS design, Karpenter, GitOps, service mesh |
| **Networking** | 10+ | VPC, CloudFront, Route 53, ALB/NLB, WAF |
| **Security** | 25+ | IAM, Security Hub, threat modeling, pentesting |
| **AI/ML** | 15+ | Bedrock, SageMaker, RAG, Agents |
| **IaC** | 20+ | CDK, CloudFormation, Terraform |
| **DevOps** | 30+ | CI/CD, CodePipeline, monitoring |
| **Cost & Operations** | 20+ | Cost optimization, Well-Architected, compliance |

**Source repositories:**
- [aws/agent-toolkit-for-aws](https://github.com/aws/agent-toolkit-for-aws)
- [aws/tools-for-devops-agent](https://github.com/aws/tools-for-devops-agent)
- [aws-samples/sample-apex-skills](https://github.com/aws-samples/sample-apex-skills)
- [And 7 more...](repos.md#aws-ninja)

---

### <img src="https://img.shields.io/badge/Azure-0078D4?style=flat&logo=microsoftazure&logoColor=white" height="20"/> Azure Ninja

> **40 skills** from Microsoft official + community repositories

The Azure Ninja orchestrates Azure expertise across the full deployment lifecycle:

| Category | Skills | Examples |
|----------|--------|----------|
| **Deployment Workflow** | 7 | azure-prepare → azure-validate → azure-deploy |
| **Kubernetes** | 3 | AKS clusters, AI Runway, Container Registry |
| **AI & ML** | 3 | Azure AI, AI Gateway, Microsoft Foundry |
| **Infrastructure** | 8 | Compute, Storage, Messaging, IoT |
| **Diagnostics** | 5 | App Insights, resource health, troubleshooting |
| **Cost** | 4 | Cost analysis, optimization, pricing API |
| **Security & Identity** | 4 | Entra ID, RBAC, compliance |
| **Well-Architected** | 2 | Reliability, WAF reviews |
| **Migration** | 3 | App onboarding, cross-cloud migration |
| **DevOps** | 1 | Azure DevOps CLI |

**Source repositories:**
- [microsoft/azure-skills](https://github.com/microsoft/azure-skills) — Official Azure plugin
- [github/awesome-copilot](https://github.com/github/awesome-copilot) — Community Azure skills

---

### <img src="https://img.shields.io/badge/Datadog-632CA6?style=flat&logo=datadog&logoColor=white" height="20"/> Datadog Ninja

> **57 skills** from official Datadog repositories

The Datadog Ninja routes observability work to the right Datadog specialist:

| Category | Skills | Examples |
|----------|--------|----------|
| **CLI & Foundation** | 4 | `pup` OAuth2 auth, docs lookup, API client code generation |
| **APM & Tracing** | 12 | Traces, services, dependencies, SSI onboarding (K8s + Linux) |
| **Logs** | 2 | Log search, pipelines, archives, cost control |
| **Monitors** | 2 | Alert creation, updates, muting |
| **Live Debugging** | 2 | Runtime log probes, symbol database lookup |
| **CI & Test Optimization** | 4 | Unblock failing PRs, triage flaky tests (pup + MCP) |
| **Audit Trail** | 6 | Security investigations, key compromise, compliance reports (SOC 2/PCI) |
| **Browser SDK & RUM** | 5 | SDK setup, v5/v6/v7 upgrades, RUM instrumentation |
| **Agent Observability (LLM Ops)** | 8 | Experiments, evaluators, trace RCA, eval pipelines |
| **Cloud Integrations** | 4 | AWS, Azure, GCP, OCI integrations |
| **Apps & Security** | 4 | Datadog Apps, CSM, product recommender, account setup |

**Source repositories:**
- [DataDog/pup](https://github.com/DataDog/pup) — Official Datadog CLI and 11 bundled agent skills
- [datadog-labs/agent-skills](https://github.com/datadog-labs/agent-skills) — 46 extended skills for LLM Ops, Audit, Browser SDK, SSI

---

### <img src="https://img.shields.io/badge/Firecrawl-FF6B35?style=flat&logo=firebase&logoColor=white" height="20"/> Firecrawl Ninja

> **33 skills** for web scraping, research, and data extraction

The Firecrawl Ninja is your specialist for web data operations:

| Category | Skills | Examples |
|----------|--------|----------|
| **Core Scraping** | 10+ | firecrawl-scrape, firecrawl-crawl, batch operations |
| **Research** | 8+ | Deep research, multi-source extraction |
| **Build & Deploy** | 5+ | LLM-ready extraction, structured output |
| **Workflows** | 10+ | Automated pipelines, scheduled jobs |

**Source repository:**
- [firecrawl/skills](https://github.com/firecrawl/skills)

---

### <img src="https://img.shields.io/badge/Google_Cloud-4285F4?style=flat&logo=googlecloud&logoColor=white" height="20"/> Google Cloud Ninja

> **85+ skills** from official Google repositories

The Google Cloud Ninja orchestrates GCP infrastructure, databases, networking, and operations:

| Category | Skills | Examples |
|----------|--------|----------|
| **GKE/Kubernetes** | 25+ | Cluster creation, networking, security, scaling, upgrades |
| **Databases** | 10+ | BigQuery, Spanner, AlloyDB, Cloud SQL, Bigtable |
| **Storage** | 5+ | Cloud Storage, Filestore, GCS FUSE |
| **Observability** | 10+ | Cloud Logging, Monitoring, PromQL, alerting |
| **Security & IAM** | 8+ | IAM policies, PAM, Security Command Center |
| **Serverless** | 3+ | Cloud Run, Cloud Build |
| **Well-Architected** | 6 | All 6 WAF pillars (cost, security, reliability, etc.) |
| **Networking** | 5+ | Global ALB, Cloud Armor, VPC observability |

**Source repository:**
- [google/skills](https://github.com/google/skills) — Official Google Cloud skills

---

### <img src="https://img.shields.io/badge/Google_AI-8E75B2?style=flat&logo=googlegemini&logoColor=white" height="20"/> Google AI Ninja

> **25+ skills** for Gemini API, Agent Platform, and Genkit

The Google AI Ninja is your expert for AI/ML on Google Cloud:

| Category | Skills | Examples |
|----------|--------|----------|
| **Gemini API** | 5+ | Inference, LiveAPI, Interactions API, multimodal |
| **Agent Platform** | 12+ | Deploy, tuning, RAG, eval, endpoints, prompts |
| **Genkit** | 4 | JS, Python, Go, Dart SDKs |
| **Solutions** | 8+ | Multi-agent security, RAG search, AI migrations |
| **ADK** | 4+ | Create, run, deploy, evaluate agents |

**Source repositories:**
- [google/skills](https://github.com/google/skills) — AI/ML skills
- [google/agents-cli](https://github.com/google/agents-cli) — ADK skills

---

### <img src="https://img.shields.io/badge/Google_Ads-4285F4?style=flat&logo=googleads&logoColor=white" height="20"/> Google Ads Ninja

> **15+ skills** for advertising APIs and SDKs

The Google Ads Ninja handles all advertising and monetization tasks:

| Category | Skills | Examples |
|----------|--------|----------|
| **Ads API** | 3 | Quickstart, MCP setup, account diagnostics |
| **Mobile Ads SDK** | 5 | Banner, interstitial, rewarded, migration |
| **IMA SDK** | 2 | Client-side VAST/VMAP, DAI streaming |
| **Data Manager** | 3 | Audience ingestion, event tracking, setup |

**Source repository:**
- [google/skills](https://github.com/google/skills) — Ads skills

---

### <img src="https://img.shields.io/badge/Android-3DDC84?style=flat&logo=android&logoColor=white" height="20"/> Google Mobile Ninja

> **35+ skills** for Android, Flutter, and Dart development

The Google Mobile Ninja covers native and cross-platform mobile development:

| Category | Skills | Examples |
|----------|--------|----------|
| **Android/Jetpack** | 10+ | Compose, Navigation 3, CameraX, Identity |
| **Build & Performance** | 5+ | AGP 9 upgrade, R8 analyzer, profiler |
| **Flutter** | 12+ | Create app, widgets, state, testing, platform channels |
| **Dart** | 6+ | Unit tests, packages, analysis, fixes |
| **Play Services** | 3+ | Play Store, in-app updates |

**Source repositories:**
- [android/skills](https://github.com/android/skills) — Official Android skills
- [flutter/agent-plugins](https://github.com/flutter/agent-plugins) — Official Flutter plugins
- [dart-lang/skills](https://github.com/dart-lang/skills) — Official Dart skills

---

### <img src="https://img.shields.io/badge/Firebase-FFCA28?style=flat&logo=firebase&logoColor=black" height="20"/> Google Firebase Ninja

> **18+ skills** for Firebase backend services

The Google Firebase Ninja orchestrates Firebase BaaS:

| Category | Skills | Examples |
|----------|--------|----------|
| **Core & CLI** | 3 | Setup, init, deploy |
| **Firestore** | 4+ | Queries, security rules, indexes |
| **Auth** | 4+ | Email, social, phone authentication |
| **Hosting & Functions** | 4+ | Static hosting, Cloud Functions, triggers |
| **Storage & Config** | 4+ | File storage, Remote Config, App Check |

**Source repositories:**
- [firebase/agent-skills](https://github.com/firebase/agent-skills) — Official Firebase skills
- [google/skills](https://github.com/google/skills) — Firebase basics

---

### <img src="https://img.shields.io/badge/Google_Analytics-E37400?style=flat&logo=googleanalytics&logoColor=white" height="20"/> Google Analytics Ninja

> **3+ skills** for Analytics APIs and reporting

The Google Analytics Ninja handles GA4 configuration and reporting:

| Category | Skills | Examples |
|----------|--------|----------|
| **Admin API** | 1 | Accounts, properties, data streams, conversions |
| **Data API** | 1 | Reports, metrics, dimensions, real-time |
| **Integration** | 1+ | Firebase links, Ads links, Measurement Protocol |

**Source repository:**
- [google/skills](https://github.com/google/skills) — Analytics skills

---

## 🗂️ Repository Structure

```
jump-skills/
├── ninjas/                           # Ninja definitions
│   ├── aws-ninja/SKILL.md            # AWS orchestrator (230+ skills)
│   ├── azure-ninja/SKILL.md          # Azure orchestrator (40 skills)
│   ├── datadog-ninja/SKILL.md        # Datadog orchestrator (57 skills)
│   ├── firecrawl-ninja/SKILL.md      # Firecrawl orchestrator (33 skills)
│   ├── google-cloud-ninja/SKILL.md   # Google Cloud orchestrator (85+ skills)
│   ├── google-ai-ninja/SKILL.md      # Google AI orchestrator (25+ skills)
│   ├── google-ads-ninja/SKILL.md     # Google Ads orchestrator (15+ skills)
│   ├── google-mobile-ninja/SKILL.md  # Mobile dev orchestrator (35+ skills)
│   ├── google-firebase-ninja/SKILL.md # Firebase orchestrator (18+ skills)
│   └── google-analytics-ninja/SKILL.md # Analytics orchestrator (3+ skills)
├── sync-repos.sh              # Clone/update source repositories
├── install-ninjas.sh          # Install Ninjas to agents
├── repos.md                   # Repository definitions per Ninja
├── ninjas.md                  # Ninja registry
│
│   # Generated after running sync-repos.sh:
├── repos/                     # 📁 Cloned source repositories (git-ignored)
│   ├── aws-ninja/             #    └── 10 AWS repos
│   ├── azure-ninja/           #    └── 2 Azure repos
│   ├── datadog-ninja/         #    └── 2 Datadog repos
│   ├── firecrawl-ninja/       #    └── 1 Firecrawl repo
│   ├── google-cloud-ninja/    #    └── 1 Google repo
│   ├── google-ai-ninja/       #    └── 2 Google repos
│   ├── google-ads-ninja/      #    └── 1 Google repo
│   ├── google-mobile-ninja/   #    └── 3 Google repos
│   ├── google-firebase-ninja/ #    └── 2 Google repos
│   └── google-analytics-ninja/#    └── 1 Google repo
└── .skills-map                # 📄 Auto-generated skill→path mapping
```

---

## 🔧 How It Works

### 1. Repository Sync (`sync-repos.sh`)

Reads `repos.md` and clones all source repositories into `repos/<ninja-name>/`:

```bash
./sync-repos.sh                 # Sync all ninjas
./sync-repos.sh aws-ninja       # Sync only AWS repos
./sync-repos.sh --status        # Show sync status
```

### 2. Skill Mapping

During sync, the script discovers all `SKILL.md` files and creates `.skills-map`:

```
aws-ninja|eks-design|repos/aws-ninja/sample-apex-skills/skills/eks-design/
azure-ninja|azure-prepare|repos/azure-ninja/azure-skills/skills/azure-prepare/
```

### 3. Installation (`install-ninjas.sh`)

Copies Ninja SKILL.md files to detected agents, replacing `{{JUMP_SKILLS_DIR}}` with the absolute path:

```bash
./install-ninjas.sh             # Install all ninjas
./install-ninjas.sh aws-ninja   # Install only AWS ninja
./install-ninjas.sh --status    # Show installation status
```

---

## ➕ Adding a New Ninja

1. **Add repositories** to `repos.md`:
   ```markdown
   ## [my-ninja]
   
   ```repos
   https://github.com/org/repo1
   https://github.com/org/repo2
   ```
   ```

2. **Register in `ninjas.md`**:
   ```markdown
   ```ninjas
   aws-ninja
   azure-ninja
   firecrawl-ninja
   my-ninja          # Add here
   ```
   ```

3. **Sync repositories**:
   ```bash
   ./sync-repos.sh my-ninja
   ```

4. **Create the Ninja SKILL.md**:
   ```bash
   mkdir -p ninjas/my-ninja
   # Create ninjas/my-ninja/SKILL.md with skill catalog
   # Use .skills-map to find available skills and their paths
   ```

5. **Install**:
   ```bash
   ./install-ninjas.sh my-ninja
   ```

---

## 📊 Status Commands

```bash
# Show all sync status
./sync-repos.sh --status

# Show all installation status
./install-ninjas.sh --status

# Count total skills
wc -l .skills-map
```

---

## 🤝 Contributing

Contributions are welcome! You can:

- 🐛 Report issues or suggest improvements
- 📝 Improve Ninja SKILL.md documentation
- ➕ Add new Ninjas for other platforms (GCP, DigitalOcean, etc.)
- 🔧 Improve sync/install scripts

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting PRs.

---

## 📄 License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

The source skill repositories have their own licenses:
- AWS repositories: Apache 2.0 / MIT-0
- Microsoft repositories: MIT
- Google repositories: Apache 2.0
- Firebase repositories: Apache 2.0
- Android/Flutter/Dart repositories: BSD-3-Clause
- Firecrawl repository: MIT

---

## ❓ FAQ

<details>
<summary><strong>Why not install all skills directly?</strong></summary>

**Context window efficiency.** If you installed all 500+ skills directly, your AI agent would load all of them at startup, consuming your entire context window before you even ask a question.

Ninjas are **Jump Skills** — they load only metadata (~500 tokens), then load full skill instructions **on-demand** when needed. This means:

- ✅ 100x less context usage at startup
- ✅ Faster responses (less to process)
- ✅ More room for your actual conversation
- ✅ Always routes to the most specific skill for your task

Think of it like a library index vs. carrying all the books at once.
</details>

<details>
<summary><strong>Which AI agents are supported?</strong></summary>

10+ agents including Claude Code, Kiro CLI, Cursor, Codex, OpenCode, VS Code Copilot, and more. The installer auto-detects available agents on your system.
</details>

<details>
<summary><strong>Where do the skills come from?</strong></summary>

All skills are from official repositories:
- **AWS skills**: `aws/` and `aws-samples/` orgs — written by AWS Solutions Architects
- **Azure skills**: `microsoft/azure-skills` — official Microsoft plugin
- **Google Cloud skills**: `google/skills` — official Google Cloud skills
- **Google AI skills**: `google/skills`, `google/agents-cli` — Gemini, Genkit, ADK
- **Google Mobile skills**: `android/skills`, `flutter/agent-plugins`, `dart-lang/skills`
- **Firebase skills**: `firebase/agent-skills` — official Firebase skills
- **Firecrawl skills**: `firecrawl/skills` — official Firecrawl repository
</details>

<details>
<summary><strong>How often should I update?</strong></summary>

Run `./sync-repos.sh` weekly or before major projects to get the latest best practices and new skills.
</details>

<details>
<summary><strong>Can I add custom Ninjas?</strong></summary>

Yes! See [CONTRIBUTING.md](CONTRIBUTING.md) for the full guide on adding new Ninjas for other platforms.
</details>

<details>
<summary><strong>Does this work offline?</strong></summary>

Yes, after initial `./sync-repos.sh`. All skills are cloned locally to the `repos/` directory.
</details>

<details>
<summary><strong>Why can't I use npx skills to install?</strong></summary>

Jump Skills is a **meta-repository** — it orchestrates skills from multiple external repos. The Ninja SKILL.md files contain paths like `{{JUMP_SKILLS_DIR}}/repos/...` that must be resolved to actual cloned repositories on your machine. This requires the full clone + sync workflow.
</details>

---

## 🙏 Acknowledgments

- **[AWS](https://github.com/aws)** — For open-sourcing comprehensive agent skills
- **[Microsoft](https://github.com/microsoft)** — For the Azure Skills plugin
- **[Google](https://github.com/google)** — For Google Cloud, AI, and Analytics skills
- **[Android](https://github.com/android)** — For Android development skills
- **[Flutter](https://github.com/flutter)** — For Flutter agent plugins
- **[Firebase](https://github.com/firebase)** — For Firebase agent skills
- **[GitHub](https://github.com/github)** — For the awesome-copilot community collection
- **[Firecrawl](https://github.com/firecrawl)** — For web scraping skills
- **[Datadog](https://github.com/DataDog)** — For the `pup` CLI and official Datadog skills
- **[Agent Skills Specification](https://github.com/awslabs/agent-plugins)** — Standard skill format
- **[skills.sh](https://skills.sh)** — Multi-agent installer inspiration
- **[Shields.io](https://shields.io)** — Beautiful badges

---

## 👤 About

<div align="center">

<a href="https://ft.ia.br">
  <img src="assets/ft-ia-br.png" width="120" height="120" style="border-radius: 50%;" alt="Fabricio Telles"/>
</a>

**Fabricio Telles**

[![Website](https://img.shields.io/badge/Website-ft.ia.br-blue?style=flat-square&logo=google-chrome&logoColor=white)](https://ft.ia.br)
[![GitHub](https://img.shields.io/badge/GitHub-fabricioctelles-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/fabricioctelles)

*Building tools for AI-assisted development*

</div>

---

<div align="center">

<img src="assets/ninjas-repairing-robot.gif" alt="Ninjas repairing overwhelmed robot" width="640"/>

*Ninjas to the rescue! 🥷*

</div>

---

<div align="center">

**Made with 🥷 by [Fabricio Telles](https://ft.ia.br)**

</div>
