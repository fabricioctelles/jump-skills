# Ninjas

Lista de Jump Skills disponíveis. Cada ninja é um roteador inteligente que orquestra múltiplas skills especializadas.

## Ninjas Ativos

```ninjas
aws-ninja
azure-ninja
firecrawl-ninja
datadog-ninja
google-cloud-ninja
google-ai-ninja
google-ads-ninja
google-mobile-ninja
google-firebase-ninja
google-analytics-ninja
```

## Descrições

| Ninja | Descrição | Skills |
|-------|-----------|--------|
| `aws-ninja` | Orquestra 230+ skills AWS oficiais (EKS, Lambda, DynamoDB, CDK, Security, etc.) | 230+ |
| `azure-ninja` | Orquestra 40 skills Azure (AKS, App Service, Entra, Foundry, DevOps, Cost, etc.) | 40 |
| `firecrawl-ninja` | Orquestra skills Firecrawl (scrape, search, crawl, workflows, etc.) | 33 |
| `datadog-ninja` | Orquestra skills Datadog (APM, logs, monitors, incidents, synthetics, CI visibility, security) | 20+ |
| `google-cloud-ninja` | Orquestra 85+ skills Google Cloud (GKE, Cloud Run, BigQuery, IAM, Storage, WAF) | 85+ |
| `google-ai-ninja` | Orquestra 25+ skills Google AI (Gemini API, Agent Platform, Genkit, RAG) | 25+ |
| `google-ads-ninja` | Orquestra 15+ skills Google Ads (Ads API, Mobile Ads SDK, IMA SDK) | 15+ |
| `google-mobile-ninja` | Orquestra 35+ skills Mobile (Android, Flutter, Dart, Jetpack Compose) | 35+ |
| `google-firebase-ninja` | Orquestra 18+ skills Firebase (Firestore, Auth, Hosting, Functions) | 18+ |
| `google-analytics-ninja` | Orquestra skills Google Analytics (Admin API, Data API, Reports) | 3+ |

## Como Adicionar um Novo Ninja

1. Adicione o nome do ninja no bloco `ninjas` acima
2. Adicione a seção correspondente em `repos.md` com os repositórios fonte
3. Execute `./sync-repos.sh` para clonar os repositórios
4. Execute `./install-ninjas.sh` para gerar e instalar a Jump Skill
