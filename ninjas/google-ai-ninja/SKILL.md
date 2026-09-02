---
name: google-ai-ninja
description: >-
  Master orchestrator for 25+ Google AI/ML agent skills from official Google repositories.
  Use when working with Gemini API, Agent Platform, Genkit, RAG, model deployment,
  fine-tuning, inference, or building AI agents on Google Cloud. Routes to the optimal
  specialized skill based on context. Triggers: Gemini, Agent Platform, Vertex AI,
  Genkit, LiveAPI, RAG, model tuning, model deployment, AI agents, GenAI, LLM,
  embeddings, multimodal, agent development, ADK, agents-cli.
---

# Google AI Ninja

**Jump Skill** — Master orchestrator that routes Google AI/ML tasks to 25+ specialized skills from official Google repositories.

## Purpose

This skill acts as an intelligent router to the Google AI/ML skills library. Instead of manually searching for the right skill, describe your AI task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level Google AI knowledge

## Skill Catalog

### Gemini API & Inference

| Skill | Path | Use When |
|-------|------|----------|
| `gemini-api` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/gemini-api/` | Gemini API on Agent Platform, SDK usage, multimodal |
| `agent-platform-inference` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-inference/` | GenAI inference, Gemini + OpenMaaS models |
| `gemini-live-api` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/gemini-live-api/` | LiveAPI websocket, bidirectional streaming |
| `gemini-interactions-api` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/gemini-interactions-api/` | Stateful multi-turn conversations |
| `gemini-agents-api` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/gemini-agents-api/` | Custom Agent resources, tools, skills |

### Agent Platform Management

| Skill | Path | Use When |
|-------|------|----------|
| `agent-platform-deploy` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-deploy/` | Model deployment, Model Garden, endpoints |
| `agent-platform-endpoint-management` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-endpoint-management/` | Serving endpoints CRUD |
| `agent-platform-model-registry` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-model-registry/` | Model Registry management |
| `agent-platform-tuning` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-tuning/` | Model fine-tuning |
| `agent-platform-tuning-management` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-tuning-management/` | Tuning jobs management |
| `agent-platform-prompt-management` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-prompt-management/` | Managed prompts versioning |
| `agent-platform-rag-engine-management` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-rag-engine-management/` | RAG Engine corpora, retrieval |
| `agent-platform-skill-registry` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-skill-registry/` | Skill Registry for agents |
| `agent-platform-troubleshooting` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-troubleshooting/` | Agent Gateway, IAP, policy errors |
| `agent-platform-migrate-from-ai-studio` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-migrate-from-ai-studio/` | Migration from AI Studio |

### Evaluation & Quality

| Skill | Path | Use When |
|-------|------|----------|
| `agent-platform-eval-flywheel` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-eval-flywheel/` | Model/agent evaluation, datasets, metrics |
| `agent-platform-alert-configuration` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/agent-platform-alert-configuration/` | AI agent alerting with OTel metrics |

### Genkit (Multi-language)

| Skill | Path | Use When |
|-------|------|----------|
| `developing-genkit-js` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/genkit-js/` | Genkit Node.js/TypeScript |
| `developing-genkit-python` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/genkit-python/` | Genkit Python |
| `developing-genkit-go` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/genkit-go/` | Genkit Go |
| `developing-genkit-dart` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/genkit-dart/` | Genkit Dart/Flutter |

### Solution Architectures

| Skill | Path | Use When |
|-------|------|----------|
| `google-cloud-solution-build-deploy-agents` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/google-cloud-solution-build-deploy-agents/` | Design & deploy AI agents on GCP |
| `google-cloud-solution-multi-agent-security` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/google-cloud-solution-multi-agent-security/` | Agent Gateway, Model Armor, multi-agent security |
| `google-cloud-solution-agentic-ai-bidirectional-streaming` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/google-cloud-solution-agentic-ai-bidirectional-streaming/` | Live multimodal streaming systems |
| `google-cloud-solution-agentic-ai-borderless-data-lakehouse` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/google-cloud-solution-agentic-ai-borderless-data-lakehouse/` | Agentic AI with data lakehouse |
| `google-cloud-solution-agentic-ai-data-science-workflow` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/google-cloud-solution-agentic-ai-data-science-workflow/` | Agent-based data science |
| `google-cloud-solution-agentic-analytics-spark-knowledge-catalog` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/google-cloud-solution-agentic-analytics-spark-knowledge-catalog/` | Agentic analytics across clouds |
| `google-cloud-solution-rag-enterprise-search-gke-sqldb` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/google-cloud-solution-rag-enterprise-search-gke-sqldb/` | RAG enterprise search on GKE |
| `google-cloud-solution-hybrid-search-alloydb` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/google-cloud-solution-hybrid-search-alloydb/` | Hybrid search with AlloyDB |
| `google-cloud-solution-guided-gke-ai-migration` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/google-cloud-solution-guided-gke-ai-migration/` | Migrate AI workloads to GKE |

### ADK (Agent Development Kit)

| Skill | Path | Use When |
|-------|------|----------|
| `google-agents-cli-onboarding` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/cloud/google-agents-cli-onboarding/` | agents-cli setup, ADK workflows |
| `adk-create-agent` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/agents-cli/skills/adk-create-agent/` | Create new ADK agent |
| `adk-run-agent` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/agents-cli/skills/adk-run-agent/` | Run agent locally |
| `adk-deploy-agent` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/agents-cli/skills/adk-deploy-agent/` | Deploy agent to Cloud Run |
| `adk-eval-agent` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/agents-cli/skills/adk-eval-agent/` | Evaluate agent quality |

### Developer Knowledge

| Skill | Path | Use When |
|-------|------|----------|
| `finding-google-skills` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/developers/finding-google-skills/` | Discover Google skills from catalog |
| `retrieving-developer-knowledge` | `{{JUMP_SKILLS_DIR}}/repos/google-ai-ninja/skills/skills/developers/retrieving-developer-knowledge/` | Search Google developer documentation |

## Routing Logic

When a task arrives:

1. **Gemini API usage?** → `gemini-api`
2. **Model inference?** → `agent-platform-inference`
3. **Live/streaming?** → `gemini-live-api`, `gemini-interactions-api`
4. **Deploy model?** → `agent-platform-deploy`
5. **Fine-tune model?** → `agent-platform-tuning`
6. **RAG/retrieval?** → `agent-platform-rag-engine-management`
7. **Evaluate model/agent?** → `agent-platform-eval-flywheel`
8. **Build with Genkit?** → `developing-genkit-*` (language specific)
9. **Build/deploy agent?** → `google-cloud-solution-build-deploy-agents`, `adk-*`
10. **Agent security?** → `google-cloud-solution-multi-agent-security`
11. **ADK/agents-cli?** → `google-agents-cli-onboarding`, `adk-*`

## Execution Pattern

```
1. Announce: "Routing to [skill-name]..."
2. Load: Read the SKILL.md from the path in the catalog
3. Execute: Follow the skill's instructions
4. Cite: Reference the skill in the response
```

## Quick Reference

| Task | Route To |
|------|----------|
| Use Gemini API | `gemini-api` |
| Deploy model to endpoint | `agent-platform-deploy` |
| Fine-tune Gemini | `agent-platform-tuning` |
| Build RAG system | `agent-platform-rag-engine-management` |
| Genkit in Python | `developing-genkit-python` |
| Create ADK agent | `adk-create-agent` |
| Evaluate agent quality | `agent-platform-eval-flywheel` |
| Multi-agent architecture | `google-cloud-solution-multi-agent-security` |
| Migrate from AI Studio | `agent-platform-migrate-from-ai-studio` |

## Statistics

- **Total Skills:** 25+
- **Repositories:** google/skills, google/agents-cli
- **Source:** Official Google AI

---

*Jump Skill maintained at github.com/fabricioctelles/jump-skills*
