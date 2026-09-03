# Ninjas

List of available Jump Skills. Each ninja is an intelligent router that orchestrates multiple specialized skills.

## Active Ninjas

```ninjas
aws-ninja
azure-ninja
datadog-ninja
firecrawl-ninja
google-cloud-ninja
google-ai-ninja
google-ads-ninja
google-mobile-ninja
google-firebase-ninja
google-analytics-ninja
```

## Descriptions

| Ninja | Description | Skills |
|-------|-------------|--------|
| `aws-ninja` | Orchestrates 230+ official AWS skills (EKS, Lambda, DynamoDB, CDK, Security, etc.) | 230+ |
| `azure-ninja` | Orchestrates 40 Azure skills (AKS, App Service, Entra, Foundry, DevOps, Cost, etc.) | 40 |
| `datadog-ninja` | Orchestrates 57 official Datadog skills (APM, logs, monitors, audit trail, browser SDK, Agent Observability/LLM Ops, cloud integrations) | 57 |
| `firecrawl-ninja` | Orchestrates Firecrawl skills (scrape, search, crawl, workflows, etc.) | 33 |
| `google-cloud-ninja` | Orchestrates 85+ Google Cloud skills (GKE, Cloud Run, BigQuery, IAM, Storage, WAF) | 85+ |
| `google-ai-ninja` | Orchestrates 25+ Google AI skills (Gemini API, Agent Platform, Genkit, RAG) | 25+ |
| `google-ads-ninja` | Orchestrates 15+ Google Ads skills (Ads API, Mobile Ads SDK, IMA SDK) | 15+ |
| `google-mobile-ninja` | Orchestrates 35+ Mobile skills (Android, Flutter, Dart, Jetpack Compose) | 35+ |
| `google-firebase-ninja` | Orchestrates 18+ Firebase skills (Firestore, Auth, Hosting, Functions) | 18+ |
| `google-analytics-ninja` | Orchestrates Google Analytics skills (Admin API, Data API, Reports) | 3+ |

## How to Add a New Ninja

1. Add the ninja name to the `ninjas` block above
2. Add the corresponding section in `repos.md` with source repositories
3. Run `./sync-repos.sh` to clone the repositories
4. Run `./install-ninjas.sh` to generate and install the Jump Skill
