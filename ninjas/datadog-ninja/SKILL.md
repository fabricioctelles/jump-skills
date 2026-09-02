---
name: datadog-ninja
description: >-
  Master orchestrator for 11 official Datadog agent skills from the DataDog/pup repository.
  Use when working with ANY Datadog observability task: APM and distributed tracing, log
  search and pipelines, monitors and alerting, live production debugging, symbol lookup,
  CI test optimization and flaky tests, or generating Datadog API client code.
  Routes to the optimal specialized skill based on context.
  Triggers: Datadog, DataDog, dd, pup CLI, APM, distributed tracing, traces, spans, service map,
  flame graph, datadog logs, log pipelines, log archives, log indexes, monitors, alerting,
  mute, downtime, live debugger, dynamic instrumentation, log probes, symbol database, symdb,
  CI Visibility, flaky test, test optimization, unblock PR, ddtrace, DD_API_KEY, DD_SITE.
---

# Datadog Ninja

**Jump Skill** — Master orchestrator that routes Datadog observability tasks to the official skills shipped with the `DataDog/pup` CLI.

## Purpose

This skill acts as an intelligent router to the Datadog skills library. Instead of manually searching for the right skill, describe your observability task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level Datadog knowledge

## Prerequisites

Every skill in this catalog drives the **`pup` CLI** (the official Datadog CLI). Before executing a task:

1. Route to `dd-pup` if `pup` is not installed or not authenticated
2. `pup` uses OAuth2 with token refresh — no long-lived key in the shell for interactive use
3. Application-side code generation uses `DD_API_KEY` / `DD_APP_KEY` instead
4. Datadog site matters (`datadoghq.com`, `datadoghq.eu`, `us3`, `us5`, `ap1`) — confirm `DD_SITE` before API calls

> Read operations (searching logs, inspecting traces, listing monitors) are safe to run directly.
> Write operations (creating or muting monitors, placing live probes, deleting pipelines) change
> production state — confirm intent with the user before executing them.

## Skill Catalog

### CLI & Foundation

| Skill | Path | Use When |
|-------|------|----------|
| `dd-pup` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-pup/` | Install/authenticate the `pup` CLI, OAuth2 setup, token refresh, org and site selection |
| `dd-docs` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-docs/` | Look up Datadog documentation via `docs.datadoghq.com/llms.txt` and linked Markdown pages |
| `dd-code-generation` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-code-generation/` | Generate application code using Datadog API clients (TypeScript, Python, Java, Go, Rust) instead of ad-hoc CLI calls |
| `dd-file-issue` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-file-issue/` | File a bug or feature request against the `pup` CLI or its plugins |

### APM & Tracing

| Skill | Path | Use When |
|-------|------|----------|
| `dd-apm` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-apm/` | Traces, services, dependencies, performance analysis |

**APM Capabilities:**
- Search and inspect distributed traces and spans
- Map service dependencies and detect topology changes
- Latency analysis (p50/p95/p99), error rates, throughput
- Identify slow endpoints and downstream bottlenecks

### Logs

| Skill | Path | Use When |
|-------|------|----------|
| `dd-logs` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-logs/` | Log search, pipelines, archives, indexes, cost control |

**Log Capabilities:**
- Search logs with Datadog query syntax and facets
- Build and debug processing pipelines (grok, remapper, category)
- Configure indexes, exclusion filters, and retention for cost control
- Set up and query log archives (S3/GCS/Azure) and rehydration

### Monitors & Alerting

| Skill | Path | Use When |
|-------|------|----------|
| `dd-monitors` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-monitors/` | Create, update, and mute monitors; alerting best practices |

### Live Debugging

| Skill | Path | Use When |
|-------|------|----------|
| `dd-symdb` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-symdb/` | Search a service's symbols to find probe-able methods |
| `dd-debugger` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-debugger/` | Capture runtime argument/variable values in production with log probes — no redeploy |

> `dd-symdb` almost always precedes `dd-debugger`: find the method, then probe it.

### CI Visibility & Test Optimization

| Skill | Path | Use When |
|-------|------|----------|
| `dd-unblock-pr` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-unblock-pr/` | A PR's CI is failing — attribute each failure as flaky, infra, or regression; report coverage |
| `dd-triage-flaky-test` | `{{JUMP_SKILLS_DIR}}/repos/datadog-ninja/pup/skills/dd-triage-flaky-test/` | Investigating one specific flaky test — history, failure pattern, fix vs quarantine vs escalate |

## Routing Logic

When a task arrives:

1. **`pup` not installed or auth failing?** → `dd-pup` first, then the real skill
2. **Slow service, latency, traces, spans, service map?** → `dd-apm`
3. **Searching logs, log pipelines, log cost/retention?** → `dd-logs`
4. **Creating/muting alerts, alerting strategy?** → `dd-monitors`
5. **"What value does this variable have in prod?"** → `dd-symdb` then `dd-debugger`
6. **PR CI red, unclear if flaky?** → `dd-unblock-pr`
7. **One known flaky test?** → `dd-triage-flaky-test`
8. **Instrumenting an app in code, API client?** → `dd-code-generation`
9. **Datadog product/feature question?** → `dd-docs`
10. **`pup` itself is broken?** → `dd-file-issue`

**Not covered by a dedicated skill.** Metrics queries, SLOs, incidents, synthetics, security signals,
and dashboards have no dedicated skill in this catalog yet. For those, route to `dd-docs` for the
correct API surface, then to `dd-code-generation` or plain `pup` commands to execute.

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
| Which service is causing the errors? | `dd-apm` |
| Search error logs for a service | `dd-logs` |
| Cut log ingestion cost | `dd-logs` |
| Build a log processing pipeline | `dd-logs` |
| Create an alert | `dd-monitors` |
| Mute alerts during a deploy | `dd-monitors` |
| What arguments does this function get in prod? | `dd-symdb` → `dd-debugger` |
| Which methods can I probe on this service? | `dd-symdb` |
| My PR's CI is red | `dd-unblock-pr` |
| Is this test flaky? | `dd-triage-flaky-test` |
| Instrument my app with the Datadog SDK | `dd-code-generation` |
| How does feature X work in Datadog? | `dd-docs` |
| Report a `pup` bug | `dd-file-issue` |

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
└── Need the API surface for something uncovered
    └── dd-docs → dd-code-generation

CI is broken (not production)
├── Whole PR pipeline red → dd-unblock-pr
└── One test flapping → dd-triage-flaky-test
```

## Common `pup` Commands

```bash
pup auth login                          # OAuth2 login
pup auth status                         # Verify authentication and org
pup logs search 'service:api status:error' --from now-1h
pup apm services list
pup monitors list --tags team:platform
pup monitors mute <monitor_id> --end <ts>
```

> Exact flags vary by `pup` version — route to `dd-pup` and confirm against `pup --help`
> rather than assuming the syntax above.

## Repositories

| Repository | Skills | Description |
|------------|--------|-------------|
| [DataDog/pup](https://github.com/DataDog/pup) | 11 | Official Datadog CLI and its bundled agent skills (Apache-2.0) |

## Statistics

- **Total Skills:** 11
- **Repository:** `DataDog/pup` (official)
- **License:** Apache-2.0

---

*Jump Skill maintained at github.com/fabricioctelles/jump-skills*
