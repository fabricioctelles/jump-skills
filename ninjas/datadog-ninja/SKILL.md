---
name: datadog-ninja
description: >-
  Master orchestrator for 20+ Datadog agent skills from the official DataDog/pup repository
  and community Datadog skill collections. Use when working with ANY Datadog observability
  task: APM and distributed tracing, log search and pipelines, metrics, monitors and alerting,
  incidents, synthetics, CI visibility and flaky tests, live debugging, security signals, or
  AI/LLM observability. Routes to the optimal specialized skill based on context.
  Triggers: Datadog, DataDog, dd, pup CLI, APM, distributed tracing, traces, spans, service map,
  flame graph, datadog logs, log pipelines, log archives, custom metrics, SLO, SLI, monitors,
  alerting, mute, downtime, incident, postmortem, synthetics, browser test, CI Visibility,
  flaky test, test optimization, live debugger, dynamic instrumentation, probes, symbol database,
  Cloud SIEM, CSPM, security signals, LLM observability, dashboards, datadog-ci, DD_API_KEY.
---

# Datadog Ninja

**Jump Skill** — Master orchestrator that routes Datadog observability tasks to specialized skills from the official `DataDog/pup` repository and community Datadog skill collections.

## Purpose

This skill acts as an intelligent router to the Datadog skills library. Instead of manually searching for the right skill, describe your observability task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level Datadog knowledge

## Prerequisites

Nearly every skill in this catalog drives the **`pup` CLI** (the official Datadog CLI). Before executing a task:

1. Route to `dd-pup` if `pup` is not installed or not authenticated
2. `pup` uses OAuth2 with token refresh — no long-lived key in the shell for interactive use
3. Application-side code generation and CI tooling use `DD_API_KEY` / `DD_APP_KEY` instead
4. Datadog site matters (`datadoghq.com`, `datadoghq.eu`, `us3`, `us5`, `ap1`) — confirm `DD_SITE` before API calls

> Read operations (searching logs, querying metrics, listing monitors) are safe to run directly.
> Write operations (creating/muting monitors, declaring incidents, deleting pipelines) change
> production state — confirm intent with the user before executing them.

## Skill Catalog

### CLI & Foundation

| Skill | Path | Use When |
|-------|------|----------|
| `dd-pup` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-pup/` | Install/authenticate the `pup` CLI, OAuth2 setup, token refresh, org and site selection |
| `dd-docs` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-docs/` | Look up Datadog documentation via `docs.datadoghq.com/llms.txt` |
| `dd-code-generation` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-code-generation/` | Generate application code using Datadog API clients (TypeScript, Python, Java, Go, Rust) instead of ad-hoc CLI calls |
| `dd-file-issue` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-file-issue/` | File a bug or feature request against the `pup` CLI or its plugins |

### APM & Tracing

| Skill | Path | Use When |
|-------|------|----------|
| `dd-apm` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-apm/` | Traces, services, dependencies, performance analysis (official) |
| `datadog-apm` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/DataDogAdditions/skills/datadog-apm/` | Service maps, latency percentiles, continuous profiler, deeper APM API workflows |

**APM Capabilities:**
- Search and inspect distributed traces and spans
- Map service dependencies and detect topology changes
- Latency analysis (p50/p95/p99), error rates, throughput
- Identify slow endpoints and downstream bottlenecks
- Continuous profiling for CPU and memory hotspots

### Logs

| Skill | Path | Use When |
|-------|------|----------|
| `dd-logs` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-logs/` | Log search, pipelines, archives, indexes, cost control (official) |
| `datadog-logs` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/DataDogAdditions/skills/datadog-logs/` | Incident-time log investigation, error pattern analysis via `pup` |

**Log Capabilities:**
- Search logs with Datadog query syntax and facets
- Build and debug processing pipelines (grok, remapper, category)
- Configure indexes, exclusion filters, and retention for cost control
- Set up and query log archives (S3/GCS/Azure) and rehydration

### Metrics & SLOs

| Skill | Path | Use When |
|-------|------|----------|
| `datadog-metrics` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/DataDogAdditions/skills/datadog-metrics/` | Query/submit metrics, custom metrics, SLIs, performance baselines, metric cardinality |

### Monitors & Alerting

| Skill | Path | Use When |
|-------|------|----------|
| `dd-monitors` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-monitors/` | Create/update/mute monitors, alerting best practices (official) |
| `datadog-monitors` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/DataDogAdditions/skills/datadog-monitors/` | Notification routing, deploy-window muting, SLO-based alerts |

### Incidents

| Skill | Path | Use When |
|-------|------|----------|
| `datadog-incidents` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/DataDogAdditions/skills/datadog-incidents/` | Declare/manage/resolve incidents, timeline updates, responder coordination, postmortems |

### CI Visibility & Test Optimization

| Skill | Path | Use When |
|-------|------|----------|
| `dd-unblock-pr` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-unblock-pr/` | A PR's CI is failing — attribute each failure as flaky, infra, or regression; report coverage |
| `dd-triage-flaky-test` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-triage-flaky-test/` | Investigating one specific flaky test — history, failure pattern, fix vs quarantine vs escalate |
| `datadog-ci-visibility` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/DataDogAdditions/skills/datadog-ci-visibility/` | Upload test results, track deployments, quality gates, pipeline monitoring via `datadog-ci` |

### Live Debugging

| Skill | Path | Use When |
|-------|------|----------|
| `dd-debugger` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-debugger/` | Capture runtime argument/variable values in production with log probes — no redeploy |
| `dd-symdb` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-symdb/` | Search a service's symbols to find probe-able methods before placing a probe |

> `dd-symdb` almost always precedes `dd-debugger`: find the method, then probe it.

### Synthetics

| Skill | Path | Use When |
|-------|------|----------|
| `datadog-synthetics` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/DataDogAdditions/skills/datadog-synthetics/` | Synthetic API tests, browser tests, multi-step monitors via `datadog-ci` |

### Security

| Skill | Path | Use When |
|-------|------|----------|
| `datadog-security` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/DataDogAdditions/skills/datadog-security/` | Cloud SIEM security signals, CSPM findings, compliance posture, vulnerability triage |

### AI / LLM Observability

| Skill | Path | Use When |
|-------|------|----------|
| `datadog-ai-observability` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/DataDogAdditions/skills/datadog-ai-observability/` | Monitor LLM apps, trace agent chains, token usage, LLM evaluations |

### Sales Engineering (non-technical)

| Skill | Path | Use When |
|-------|------|----------|
| `datadog-demo` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/DataDogAdditions/skills/datadog-demo/` | Run a pre-built demo scenario of a Datadog investigation end-to-end |
| `datadog-se-demo` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/DataDogAdditions/skills/datadog-se-demo/` | Structure an SE demo round or customer presentation |
| `datadog-competitive` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/DataDogAdditions/skills/datadog-competitive/` | Datadog vs Splunk / New Relic / Dynatrace / Grafana / Elastic comparisons, battlecards |

> These three are sales-oriented, not operational. Do not route engineering tasks to them.

## Routing Logic

When a task arrives:

1. **`pup` not installed or auth failing?** → `dd-pup` first, then the real skill
2. **Slow service, latency, traces, spans, service map?** → `dd-apm` (add `datadog-apm` for profiling)
3. **Searching logs, log pipelines, log cost/retention?** → `dd-logs` (`datadog-logs` for incident-time search)
4. **Metrics, custom metrics, SLIs, baselines?** → `datadog-metrics`
5. **Creating/muting alerts, notification routing?** → `dd-monitors` (`datadog-monitors` for SLO alerts)
6. **Production incident, postmortem, responders?** → `datadog-incidents`
7. **PR CI red, unclear if flaky?** → `dd-unblock-pr`
8. **One known flaky test?** → `dd-triage-flaky-test`
9. **Uploading test results, quality gates, deploy tracking?** → `datadog-ci-visibility`
10. **"What value does this variable have in prod?"** → `dd-symdb` then `dd-debugger`
11. **Uptime checks, browser tests, API monitoring?** → `datadog-synthetics`
12. **Security signals, CSPM, compliance, vulns?** → `datadog-security`
13. **LLM/agent tracing, token spend, evals?** → `datadog-ai-observability`
14. **Instrumenting an app in code, API client?** → `dd-code-generation`
15. **Datadog docs question?** → `dd-docs`
16. **Demo, presentation, competitor comparison?** → `datadog-demo` / `datadog-se-demo` / `datadog-competitive`

## Execution Pattern

```
1. Announce: "Routing to [skill-name]..."
2. Verify: pup installed + authenticated (route to dd-pup if not)
3. Load: Read the SKILL.md from the path in the catalog
4. Execute: Follow the skill's instructions
5. Confirm: For any write operation, confirm with the user before running it
6. Cite: Reference the skill in the response
```

## Quick Reference

| Task | Route To |
|------|----------|
| Install / authenticate Datadog CLI | `dd-pup` |
| Why is this endpoint slow? | `dd-apm` |
| Profile CPU/memory in production | `datadog-apm` |
| Search error logs for a service | `dd-logs` |
| Cut log ingestion cost | `dd-logs` |
| Build a log processing pipeline | `dd-logs` |
| Query a custom metric | `datadog-metrics` |
| Define an SLI / SLO | `datadog-metrics` |
| Create an alert | `dd-monitors` |
| Mute alerts during a deploy | `datadog-monitors` |
| Declare an incident | `datadog-incidents` |
| Write a postmortem | `datadog-incidents` |
| My PR's CI is red | `dd-unblock-pr` |
| Is this test flaky? | `dd-triage-flaky-test` |
| Add quality gates to CI | `datadog-ci-visibility` |
| What arguments does this function get in prod? | `dd-symdb` → `dd-debugger` |
| Add an uptime / browser check | `datadog-synthetics` |
| Triage a security signal | `datadog-security` |
| Trace an LLM agent chain | `datadog-ai-observability` |
| Instrument my app with the Datadog SDK | `dd-code-generation` |
| How does feature X work in Datadog? | `dd-docs` |
| Report a `pup` bug | `dd-file-issue` |

## Investigation Decision Tree

```
Something is wrong in production

Where does the symptom show up?
├── Requests slow / erroring
│   ├── Which service? → dd-apm (service map, trace search)
│   ├── Which line of code? → dd-apm (flame graph) → dd-debugger (live values)
│   └── Resource-bound? → datadog-apm (continuous profiler)
├── Errors in the logs
│   ├── Find them → dd-logs / datadog-logs
│   └── Logs missing or malformed → dd-logs (pipelines, indexes)
├── Host / infra symptom
│   └── datadog-metrics (infra metrics, baselines)
├── Alert fired (or should have)
│   ├── Tune / create → dd-monitors
│   └── Routing / muting → datadog-monitors
├── Users report it before you do
│   └── datadog-synthetics (uptime & browser checks)
├── It's an incident
│   └── datadog-incidents (declare, coordinate, postmortem)
└── It's suspicious, not just broken
    └── datadog-security (signals, CSPM findings)

CI is broken (not production)
├── Whole PR pipeline red → dd-unblock-pr
├── One test flapping → dd-triage-flaky-test
└── Coverage / gates / uploads → datadog-ci-visibility
```

## Common `pup` Commands

```bash
pup auth login                          # OAuth2 login
pup auth status                         # Verify authentication and org
pup logs search 'service:api status:error' --from now-1h
pup metrics query 'avg:system.cpu.user{*}' --from now-4h
pup monitors list --tags team:platform
pup monitors mute <monitor_id> --end <ts>
pup apm services list
pup incidents list --state active
```

> Exact flags vary by `pup` version — route to `dd-pup` and confirm against `pup --help`
> rather than assuming the syntax above.

## Statistics

- **Total Skills:** 20+ operational (23 including sales-engineering skills)
- **Repositories:** `DataDog/pup` (official), `Kirneill/DataDogAdditions` (community)
- **Source:** Official Datadog CLI skills + community Datadog skill collection

---

*Jump Skill maintained at github.com/fabricioctelles/jump-skills*
