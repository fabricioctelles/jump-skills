---
name: azure-ninja
description: >-
  Master orchestrator for 40 Azure agent skills from Microsoft official and community repositories.
  Use when working with ANY Azure service, architecture, deployment, operations, security,
  cost optimization, diagnostics, or development task. Routes to the optimal
  specialized skill based on context. Triggers: Azure, Microsoft, AKS, Kubernetes,
  App Service, Functions, Cosmos DB, Entra, Bicep, ARM, azd, DevOps, Container Apps,
  Static Web Apps, Storage, Event Hubs, Service Bus, AI, OpenAI, Foundry, cost,
  migration, compliance, reliability, or any Azure service name.
---

# Azure Ninja

**Jump Skill** — Master orchestrator that routes Azure tasks to 40 specialized skills from Microsoft official + community repositories.

## Purpose

This skill acts as an intelligent router to the comprehensive Azure skills library. Instead of manually searching for the right skill, describe your Azure task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level Azure knowledge

## Skill Catalog

### Deployment & Preparation (Core Workflow)

| Skill | Path | Use When |
|-------|------|----------|
| `azure-prepare` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-prepare/` | Prepare azd-based projects: azure.yaml, Bicep/Terraform, Dockerfile |
| `azure-validate` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-validate/` | Pre-deployment validation: config, infrastructure, Docker, dependencies |
| `azure-deploy` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-deploy/` | Execute deployments for prepared applications with deployment-plan.md |
| `azure-upgrade` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-upgrade/` | Upgrade tiers, SKUs, or modernize SDK dependencies |
| `azure-deployment-preflight` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/awesome-copilot/skills/azure-deployment-preflight/` | Comprehensive Bicep preflight validation: syntax, what-if, policy |
| `azure-developer-cli` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/awesome-copilot/skills/azure-developer-cli/` | Design, create, review, migrate azd projects |
| `python-appservice-deploy` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/python-appservice-deploy/` | Deploy Flask/Django/FastAPI to App Service Linux |

### Kubernetes & Containers

| Skill | Path | Use When |
|-------|------|----------|
| `azure-kubernetes` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-kubernetes/` | Plan, create, configure production AKS clusters (Day-0 to Day-2) |
| `airunway-aks-setup` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/airunway-aks-setup/` | Set up AI Runway on AKS: cluster to running model |
| `azure-container-registry-cli` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/awesome-copilot/skills/azure-container-registry-cli/` | Manage ACR: registries, images, cloud builds, tasks |

### AI & Machine Learning

| Skill | Path | Use When |
|-------|------|----------|
| `azure-ai` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-ai/` | Azure AI Search, Speech, OpenAI, Document Intelligence |
| `azure-aigateway` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-aigateway/` | Configure APIM as AI Gateway for models, MCP tools, agents |
| `microsoft-foundry` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/microsoft-foundry/` | Build, deploy, evaluate Foundry agents, models, resources |

### Infrastructure & Architecture

| Skill | Path | Use When |
|-------|------|----------|
| `azure-compute` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-compute/` | VMs, VMSS: create, provision, size recommendations |
| `azure-storage` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-storage/` | Blob, File Shares, Queue, Table, Data Lake, access tiers |
| `azure-messaging` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-messaging/` | Event Hubs, Service Bus SDK troubleshooting |
| `azure-kusto` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-kusto/` | Query Azure Data Explorer with KQL for logs, telemetry |
| `azure-enterprise-infra-planner` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-enterprise-infra-planner/` | Architect enterprise infrastructure from workload descriptions |
| `azure-architecture-autopilot` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/awesome-copilot/skills/azure-architecture-autopilot/` | Automated architecture design and recommendations |
| `azure-static-web-apps` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/awesome-copilot/skills/azure-static-web-apps/` | Create, configure, deploy Static Web Apps with SWA CLI |
| `azure-smart-city-iot-solution-builder` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/awesome-copilot/skills/azure-smart-city-iot-solution-builder/` | Design Azure IoT and Smart City solutions end-to-end |

### Diagnostics & Troubleshooting

| Skill | Path | Use When |
|-------|------|----------|
| `azure-diagnostics` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-diagnostics/` | Debug production issues: AppLens, Monitor, resource health |
| `azure-resource-health-diagnose` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/awesome-copilot/skills/azure-resource-health-diagnose/` | Analyze resource health, diagnose from logs, create remediation plans |
| `appinsights-instrumentation` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/appinsights-instrumentation/` | Instrument apps with Application Insights: telemetry, SDK patterns |
| `azure-resource-lookup` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-resource-lookup/` | List, find, show resources across subscriptions/RGs |
| `azure-resource-visualizer` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-resource-visualizer/` | Generate Mermaid architecture diagrams from resource groups |

### Cost & Optimization

| Skill | Path | Use When |
|-------|------|----------|
| `azure-cost` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-cost/` | Query costs, forecast spending, optimize to reduce waste |
| `az-cost-optimize` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/awesome-copilot/skills/az-cost-optimize/` | Analyze IaC/resources and optimize costs |
| `azure-pricing` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/awesome-copilot/skills/azure-pricing/` | Fetch real-time Azure retail pricing via prices.azure.com |
| `azure-quotas` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-quotas/` | Check/manage quotas and usage across providers |

### Security, Identity & Compliance

| Skill | Path | Use When |
|-------|------|----------|
| `entra-app-registration` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/entra-app-registration/` | Entra ID app registration, OAuth 2.0, MSAL integration |
| `entra-agent-id` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/entra-agent-id/` | Provision Entra Agent Identity Blueprints, BlueprintPrincipals |
| `azure-role-selector` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/awesome-copilot/skills/azure-role-selector/` | Guide which role to assign for desired permissions |
| `azure-compliance` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-compliance/` | Security audits with azqr, Key Vault expiration checks |

### Reliability & Well-Architected

| Skill | Path | Use When |
|-------|------|----------|
| `azure-reliability` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-reliability/` | Assess reliability for PaaS apps (Functions, App Service) |
| `azure-well-architected-review` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/awesome-copilot/skills/azure-well-architected-review/` | WAF review: IaC, architecture, generate recommendations |

### Migration & Onboarding

| Skill | Path | Use When |
|-------|------|----------|
| `azure-app-onboard` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-app-onboard/` | End-to-end: from idea/app to running Azure deployment |
| `azure-app-onboard-prereq` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-app-onboard-prereq/` | Assess if source code is ready for Azure deployment |
| `azure-cloud-migrate` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/azure-skills/skills/azure-cloud-migrate/` | Cross-cloud migration: Lambda to Functions, etc. |

### DevOps & CLI

| Skill | Path | Use When |
|-------|------|----------|
| `azure-devops-cli` | `{{JUMP_SKILLS_DIR}}/repos/azure-ninja/awesome-copilot/skills/azure-devops-cli/` | Manage Azure DevOps: projects, repos, pipelines, builds, PRs |

## How to Use

### Direct Invocation
Ask about any Azure task naturally:
- "Set up an AKS cluster for production"
- "Deploy my Python app to Azure"
- "Review my architecture for Well-Architected compliance"
- "Find cost savings in my subscription"
- "Diagnose why my App Service is slow"

### Skill Loading
When a specific skill is needed, the ninja will:
1. Identify the best skill from the catalog above
2. Load the full SKILL.md from the specified path
3. Execute with the specialized knowledge

## Repositories

This ninja aggregates skills from:

| Repository | Skills | Description |
|------------|--------|-------------|
| [microsoft/azure-skills](https://github.com/microsoft/azure-skills) | 28 | Official Azure plugin: prepare → validate → deploy workflow |
| [github/awesome-copilot](https://github.com/github/awesome-copilot) | 12 | Community Azure skills: DevOps, pricing, WAF review |

## Routing Logic

The ninja routes based on task context:

1. **Deployment workflow**: azure-prepare → azure-validate → azure-deploy
2. **Kubernetes tasks**: azure-kubernetes, airunway-aks-setup
3. **AI/ML tasks**: azure-ai, azure-aigateway, microsoft-foundry
4. **Cost questions**: azure-cost, az-cost-optimize, azure-pricing
5. **Diagnostics**: azure-diagnostics, azure-resource-health-diagnose
6. **Security/Identity**: entra-*, azure-compliance, azure-role-selector
7. **Architecture**: azure-enterprise-infra-planner, azure-architecture-autopilot, azure-well-architected-review
