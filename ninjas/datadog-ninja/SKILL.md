---
name: datadog-ninja
description: >-
  Master orchestrator for 57 official Datadog agent skills from DataDog/pup and datadog-labs/agent-skills.
  Use when working with ANY Datadog observability task: APM and distributed tracing, log search and pipelines,
  monitors and alerting, live production debugging, audit trail investigations, browser SDK instrumentation,
  Agent Observability (LLM Ops), cloud integrations (AWS/Azure/GCP/OCI), CI/CD visibility, flaky tests,
  Single-Step Instrumentation (SSI), Datadog Apps, or security posture management.
  Routes to the optimal specialized skill based on context.
  Triggers: Datadog, DataDog, dd, pup CLI, APM, distributed tracing, traces, spans, service map,
  flame graph, datadog logs, log pipelines, log archives, log indexes, monitors, alerting,
  mute, downtime, live debugger, dynamic instrumentation, log probes, symbol database, symdb,
  CI Visibility, flaky test, test optimization, unblock PR, ddtrace, DD_API_KEY, DD_SITE,
  audit trail, who changed, compliance, SOC 2, PCI, browser SDK, RUM, session replay,
  Agent Observability, LLM Obs, experiments, evaluators, traces RCA, SSI, Single-Step Instrumentation,
  Kubernetes agent, Linux agent, AWS integration, Azure integration, GCP integration, OCI integration,
  Datadog Apps, App Builder, CSM, cloud security.
---

# Datadog Ninja

**Jump Skill** — Master orchestrator that routes Datadog observability tasks to 57 specialized skills from official Datadog repositories.

## Purpose

This skill acts as an intelligent router to the comprehensive Datadog skills library. Instead of manually searching for the right skill, describe your observability task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level Datadog knowledge

## Prerequisites

Most skills drive the **`pup` CLI** (the official Datadog CLI). Before executing a task:

1. Route to `dd-pup` if `pup` is not installed or not authenticated
2. `pup` uses OAuth2 with token refresh — no long-lived key in the shell for interactive use
3. Some skills use `DD_API_KEY` / `DD_APP_KEY` directly for API access
4. Datadog site matters (`datadoghq.com`, `datadoghq.eu`, `us3`, `us5`, `ap1`) — confirm `DD_SITE` before API calls

> **Read operations** (searching logs, inspecting traces, listing monitors) are safe to run directly.
> **Write operations** (creating monitors, placing probes, deleting pipelines) change production state — confirm with the user first.

---

## Skill Catalog

### CLI & Foundation (from DataDog/pup)

| Skill | Path | Use When |
|-------|------|----------|
| `dd-pup` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-pup/` | Install/authenticate the `pup` CLI, OAuth2 setup, token refresh, org and site selection |
| `dd-docs` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-docs/` | Look up Datadog documentation via `docs.datadoghq.com/llms.txt` |
| `dd-code-generation` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-code-generation/` | Generate application code using Datadog API clients (TypeScript, Python, Java, Go, Rust) |
| `dd-file-issue` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-file-issue/` | File a bug or feature request against the `pup` CLI |

### APM & Tracing

| Skill | Path | Use When |
|-------|------|----------|
| `dd-apm` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-apm/` | Traces, services, dependencies, performance analysis (pup) |
| `dd-apm` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apm/` | Extended APM with SSI onboarding workflows |
| `service-remapping` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apm/service-remapping/` | Remap service names in APM |

#### Single-Step Instrumentation (SSI) — Kubernetes

| Skill | Path | Use When |
|-------|------|----------|
| `k8s-agent-install` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apm/k8s-ssi/agent-install/` | Install Datadog Agent on Kubernetes |
| `k8s-enable-ssi` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apm/k8s-ssi/enable-ssi/` | Enable SSI on K8s cluster |
| `k8s-verify-ssi` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apm/k8s-ssi/verify-ssi/` | Verify SSI is working on K8s |
| `k8s-troubleshoot-ssi` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apm/k8s-ssi/troubleshoot-ssi/` | Troubleshoot SSI issues on K8s |
| `k8s-onboarding-summary` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apm/k8s-ssi/onboarding-summary/` | SSI onboarding summary for K8s |

#### Single-Step Instrumentation (SSI) — Linux

| Skill | Path | Use When |
|-------|------|----------|
| `linux-agent-install` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apm/linux-ssi/agent-install/` | Install Datadog Agent on Linux hosts |
| `linux-enable-ssi` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apm/linux-ssi/enable-ssi/` | Enable SSI on Linux |
| `linux-verify-ssi` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apm/linux-ssi/verify-ssi/` | Verify SSI is working on Linux |
| `linux-troubleshoot-ssi` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apm/linux-ssi/troubleshoot-ssi/` | Troubleshoot SSI issues on Linux |
| `linux-onboarding-summary` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apm/linux-ssi/onboarding-summary/` | SSI onboarding summary for Linux |

### Logs

| Skill | Path | Use When |
|-------|------|----------|
| `dd-logs` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-logs/` | Log search, pipelines, archives, indexes, cost control (pup) |
| `dd-logs` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-logs/` | Extended log management workflows |

### Monitors & Alerting

| Skill | Path | Use When |
|-------|------|----------|
| `dd-monitors` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-monitors/` | Create, update, mute monitors; alerting best practices (pup) |
| `dd-monitors` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-monitors/` | Extended monitor management |

### Live Debugging (from DataDog/pup)

| Skill | Path | Use When |
|-------|------|----------|
| `dd-symdb` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-symdb/` | Search a service's symbols to find probe-able methods |
| `dd-debugger` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-debugger/` | Capture runtime values in production with log probes — no redeploy |

> `dd-symdb` almost always precedes `dd-debugger`: find the method, then probe it.

### CI Visibility & Test Optimization

| Skill | Path | Use When |
|-------|------|----------|
| `dd-unblock-pr` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-unblock-pr/` | PR CI failing — classify as flaky/infra/regression (pup) |
| `dd-triage-flaky-test` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-triage-flaky-test/` | Deep-dive on a specific flaky test (pup) |
| `unblock-pr` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-software-delivery/unblock-pr/` | Extended PR unblock with MCP support |
| `triage-flaky-test` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-software-delivery/triage-flaky-test/` | Extended flaky test triage with MCP support |

### Audit Trail

| Skill | Path | Use When |
|-------|------|----------|
| `dd-audit` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-audit/` | Audit Trail investigations overview |
| `security-investigation` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-audit/security-investigation/` | Who changed what? User activity, deletions, permission changes |
| `key-compromise` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-audit/key-compromise/` | Investigate potentially compromised API keys |
| `cost-spike-investigation` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-audit/cost-spike-investigation/` | Why did my bill go up? Usage spike root cause |
| `compliance-report` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-audit/compliance-report/` | Generate SOC 2 / PCI DSS evidence from audit data |
| `ai-activity-audit` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-audit/ai-activity-audit/` | Audit AI assistant / MCP tool activity |

### Browser SDK & RUM

| Skill | Path | Use When |
|-------|------|----------|
| `dd-browser-sdk` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-browser-sdk/` | Browser SDK overview — RUM, Logs, Session Replay, profiling |
| `upgrade-v5` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-browser-sdk/upgrade-v5/` | Upgrade Browser SDK from v4 to v5 |
| `upgrade-v6` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-browser-sdk/upgrade-v6/` | Upgrade Browser SDK from v5 to v6 |
| `upgrade-v7` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-browser-sdk/upgrade-v7/` | Upgrade Browser SDK from v6 to v7 |
| `dd-instrument-rum` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-instrument-rum/` | Instrument browser apps with RUM (React, Next.js, Angular, Vue, Svelte) |

### Agent Observability (LLM Ops)

| Skill | Path | Use When |
|-------|------|----------|
| `experiment-analyzer` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/agent-observability/agent-observability-experiment-analyzer/` | Analyze and compare offline LLM experiments |
| `experiment-bootstrap` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/agent-observability/agent-observability-experiment-bootstrap/` | Bootstrap reproducible LLM experiments (Python/Node SDK) |
| `trace-rca` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/agent-observability/agent-observability-trace-rca/` | Root-cause production failures using eval judge signal |
| `eval-bootstrap` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/agent-observability/agent-observability-eval-bootstrap/` | Generate evaluator code from production traces |
| `eval-pipeline` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/agent-observability/agent-observability-eval-pipeline/` | End-to-end pipeline: classify → RCA → bootstrap → experiment → analyze |
| `session-classify` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/agent-observability/agent-observability-session-classify/` | Classify if user intent was satisfied in a session |
| `auto-experiment` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/agent-observability/agent-observability-auto-experiment/` | Local hill-climb: baseline-eval a prompt, iterate improvements |
| `replay-trace` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/agent-observability/agent-observability-replay-trace/` | Re-run a trace against local code, diff old vs new output |

### Cloud Integrations

| Skill | Path | Use When |
|-------|------|----------|
| `dd-aws-integration` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-aws-integration/` | Set up AWS integration with Datadog |
| `dd-azure-integration` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-azure-integration/` | Set up Azure integration with Datadog |
| `dd-gcp-integration` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-gcp-integration/` | Set up GCP integration with Datadog |
| `dd-oci-integration` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-oci-integration/` | Set up Oracle Cloud (OCI) integration with Datadog |

### Security & Compliance

| Skill | Path | Use When |
|-------|------|----------|
| `csm-ownership-agent` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-security/csm/ownership-agent/` | Cloud Security Management ownership setup |

### Datadog Apps

| Skill | Path | Use When |
|-------|------|----------|
| `datadog-app` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-apps/datadog-app/` | Build Datadog Apps — scaffold, run locally, upload, publish, DDSQL |

### Account & Setup

| Skill | Path | Use When |
|-------|------|----------|
| `dd-account-setup` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-account-setup/` | Initial Datadog account setup and configuration |
| `dd-product-recommender` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/agent-skills/dd-product-recommender/` | Recommend Datadog products for a codebase/goal |

---

## Routing Logic

When a task arrives:

### CLI & Auth
1. **`pup` not installed or auth failing?** → `dd-pup` first, then the real skill
2. **Datadog documentation question?** → `dd-docs`
3. **Need to generate API client code?** → `dd-code-generation`

### Observability Core
4. **Slow service, latency, traces, spans?** → `dd-apm`
5. **Searching logs, pipelines, cost/retention?** → `dd-logs`
6. **Creating/muting alerts?** → `dd-monitors`
7. **Runtime debugging in production?** → `dd-symdb` then `dd-debugger`

### CI/CD
8. **PR CI red, unclear why?** → `dd-unblock-pr` or `unblock-pr`
9. **One known flaky test?** → `dd-triage-flaky-test` or `triage-flaky-test`

### Audit & Compliance
10. **Who changed what?** → `security-investigation`
11. **API key compromised?** → `key-compromise`
12. **Bill went up unexpectedly?** → `cost-spike-investigation`
13. **Need SOC 2 / PCI evidence?** → `compliance-report`
14. **What did the AI assistant do?** → `ai-activity-audit`

### Browser & Frontend
15. **Instrument browser app with RUM?** → `dd-instrument-rum`
16. **Upgrade Browser SDK?** → `upgrade-v5`, `upgrade-v6`, or `upgrade-v7`

### LLM Ops / Agent Observability
17. **Analyze LLM experiments?** → `experiment-analyzer`
18. **Bootstrap LLM experiment?** → `experiment-bootstrap`
19. **Root-cause LLM failures?** → `trace-rca`
20. **Generate evaluators from traces?** → `eval-bootstrap`
21. **Full eval pipeline?** → `eval-pipeline`

### Agent Installation
22. **Install agent on Kubernetes?** → `k8s-agent-install` → `k8s-enable-ssi`
23. **Install agent on Linux?** → `linux-agent-install` → `linux-enable-ssi`
24. **Verify/troubleshoot SSI?** → `*-verify-ssi` or `*-troubleshoot-ssi`

### Cloud Integrations
25. **Connect AWS to Datadog?** → `dd-aws-integration`
26. **Connect Azure to Datadog?** → `dd-azure-integration`
27. **Connect GCP to Datadog?** → `dd-gcp-integration`
28. **Connect OCI to Datadog?** → `dd-oci-integration`

### Apps & Other
29. **Build a Datadog App?** → `datadog-app`
30. **Cloud security posture?** → `csm-ownership-agent`
31. **Which Datadog products do I need?** → `dd-product-recommender`
32. **Initial account setup?** → `dd-account-setup`

---

## Execution Pattern

```
1. Announce: "Routing to [skill-name]..."
2. Verify: pup installed + authenticated (route to dd-pup if not)
3. Load: Read the SKILL.md from the path in the catalog
4. Execute: Follow the skill's instructions
5. Confirm: For any write operation, confirm with the user before running it
6. Cite: Reference the skill in the response
```

---

## Quick Reference

| Task | Route To |
|------|----------|
| Install / authenticate Datadog CLI | `dd-pup` |
| Why is this endpoint slow? | `dd-apm` |
| Search error logs for a service | `dd-logs` |
| Create an alert | `dd-monitors` |
| What arguments does this function get in prod? | `dd-symdb` → `dd-debugger` |
| My PR's CI is red | `dd-unblock-pr` |
| Is this test flaky? | `dd-triage-flaky-test` |
| Who deleted monitors yesterday? | `security-investigation` |
| Was this API key compromised? | `key-compromise` |
| Why did my bill spike? | `cost-spike-investigation` |
| Generate SOC 2 evidence | `compliance-report` |
| Upgrade Browser SDK to v7 | `upgrade-v7` |
| Instrument React app with RUM | `dd-instrument-rum` |
| Analyze my LLM experiment | `experiment-analyzer` |
| Why is my LLM app failing? | `trace-rca` |
| Install agent on Kubernetes | `k8s-agent-install` |
| Connect AWS account | `dd-aws-integration` |
| Build a Datadog App | `datadog-app` |

---

## Investigation Decision Tree

```
Something is wrong in production

Where does the symptom show up?
├── Requests slow / erroring
│   ├── Which service? → dd-apm (service map, trace search)
│   ├── Which endpoint / span? → dd-apm (trace detail)
│   └── What were the actual runtime values? → dd-symdb → dd-debugger
├── Errors in the logs
│   ├── Find them → dd-logs (search, facets)
│   └── Logs missing or malformed → dd-logs (pipelines, indexes)
├── Alert fired (or should have)
│   └── dd-monitors (create, tune, mute)
├── Need to audit who did what
│   ├── Configuration changes → security-investigation
│   ├── API key activity → key-compromise
│   └── Cost spike → cost-spike-investigation
├── LLM / AI agent issues
│   ├── Experiment results → experiment-analyzer
│   ├── Production failures → trace-rca
│   └── Need evaluators → eval-bootstrap
└── Need the API surface for something else
    └── dd-docs → dd-code-generation

CI is broken (not production)
├── Whole PR pipeline red → dd-unblock-pr
└── One test flapping → dd-triage-flaky-test

Setting up Datadog
├── First time? → dd-account-setup
├── Which products? → dd-product-recommender
├── Agent on K8s? → k8s-agent-install → k8s-enable-ssi
├── Agent on Linux? → linux-agent-install → linux-enable-ssi
├── Connect AWS/Azure/GCP/OCI? → dd-*-integration
└── Browser instrumentation? → dd-instrument-rum
```

---

## Common `pup` Commands

```bash
# Authentication
pup auth login                          # OAuth2 login
pup auth status                         # Verify authentication and org

# Logs
pup logs search 'service:api status:error' --from now-1h

# APM
pup apm services list

# Monitors
pup monitors list --tags team:platform
pup monitors mute <monitor_id> --end <ts>

# Audit
pup audit-logs search --query "@action:deleted" --from 24h
```

> Exact flags vary by `pup` version — route to `dd-pup` and confirm against `pup --help`.

---

## Repositories

| Repository | Skills | License | Description |
|------------|--------|---------|-------------|
| [DataDog/pup](https://github.com/DataDog/pup) | 11 | Apache-2.0 | Official Datadog CLI and bundled agent skills |
| [datadog-labs/agent-skills](https://github.com/datadog-labs/agent-skills) | 46 | MIT | Extended skills: Agent Observability, Audit, Browser SDK, SSI, Cloud Integrations |

## Statistics

- **Total Skills:** 57
- **Repositories:** 2 (official Datadog)
- **Licenses:** Apache-2.0, MIT

---

*Jump Skill maintained at github.com/fabricioctelles/jump-skills*
