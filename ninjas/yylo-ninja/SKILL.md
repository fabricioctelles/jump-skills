---
name: yylo-ninja
description: >-
  Master orchestrator for the 7 canonical agent skills from the official yylo-dev/yylo-skills
  repository. Use when working with ANY YYLO workflow: Kanban-style task management on the
  YYLO Ledger board, planning Product Development Requirements and implementation-sized tasks,
  wiki Records as durable project knowledge, validated workflow Records, artifact Records for
  evidence capture, project understanding before planning, or single-task autonomous execution
  through the Ralph loop. Routes to the optimal specialized skill based on context.
  Triggers: YYLO, yylo, yy CLI, @yylo/cli, yy task, yy merge, yy ledger, yylo-ledger,
  YYLO Ledger, kanban, task board, task management, task ledger, plan work, PDR,
  product development requirement, register work, wiki record, durable knowledge,
  workflow record, validated workflow, artifact record, capture evidence, receipts,
  understand the project, project inspection, ralph loop, autonomous execution,
  worktree, merge queue, merge status, agent workflow orchestration.
---

# YYLO Ninja

**Jump Skill** — Master orchestrator that routes YYLO workflow tasks to 7 specialized skills from the official YYLO repository.

## Purpose

This skill acts as an intelligent router to the canonical YYLO skills library. Instead of manually searching for the right skill, describe your workflow task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level YYLO knowledge

## Prerequisites

The skills drive the **`yy` CLI** (npm package `@yylo/cli`, Node.js 20.10+ and Git). Before executing a task:

1. Verify `yy --help` works; if not, install with `npm install --global '@yylo/cli@latest'`
2. `yy ledger` and `yy benchmark` delegate to the separately installed `yylo-ledger` / `yylo-benchmark` CLIs — Record namespaces must appear in the installed `yy ledger --help` before an agent uses them
3. The four Ledger Record skills (wiki, workflow, artifact, ledger-tasks) are usable with standalone Ledger; the planning and execution skills rely on YYLO orchestration
4. Inspect `COMMAND --help` before acting; if a namespace is absent, the installed version does not expose it — do not fall back to editing Ledger storage directly

> **Read operations** (listing tasks, searching wiki Records, inspecting artifacts) are safe to run directly.
> **Mutating operations** (finishing tasks, landing merges, creating Records) change repository state — confirm with the user first, and never push, deploy, or mutate production without separate authority.

---

## Skill Catalog

### Task Management

| Skill | Path | Use When |
|-------|------|----------|
| `ledger-tasks-yylo` | `{{JUMP_SKILLS_DIR}}/repos/yylo-ninja/yylo-skills/skills/ledger-tasks-yylo/` | Operate the YYLO Ledger board: create, list, search, mark, update, archive tasks, manage dependencies and ordering |
| `plan-ledger-tasks-yylo` | `{{JUMP_SKILLS_DIR}}/repos/yylo-ninja/yylo-skills/skills/plan-ledger-tasks-yylo/` | User explicitly asks to plan or register work: draft one concise PDR and create implementation-sized Ledger tasks |
| `understand-project-yylo` | `{{JUMP_SKILLS_DIR}}/repos/yylo-ninja/yylo-skills/skills/understand-project-yylo/` | Inspect product architecture, dependencies, and validation loops BEFORE planning or implementing a change |

### Durable Records (YYLO Ledger)

| Skill | Path | Use When |
|-------|------|----------|
| `wiki-yylo` | `{{JUMP_SKILLS_DIR}}/repos/yylo-ninja/yylo-skills/skills/wiki-yylo/` | Durable project knowledge as wiki Records: search before creating, classify correctly, make revision-safe updates |
| `workflow-yylo` | `{{JUMP_SKILLS_DIR}}/repos/yylo-ninja/yylo-skills/skills/workflow-yylo/` | Create and maintain validated workflow Records, keeping storage, execution, and run evidence as separate boundaries |
| `artifact-yylo` | `{{JUMP_SKILLS_DIR}}/repos/yylo-ninja/yylo-skills/skills/artifact-yylo/` | Capture and retrieve durable artifact Records: intentional profiles, payload modes, provenance, retention, secret-safe evidence |

### Autonomous Execution

| Skill | Path | Use When |
|-------|------|----------|
| `ralph-loop-yylo` | `{{JUMP_SKILLS_DIR}}/repos/yylo-ninja/yylo-skills/skills/ralph-loop-yylo/` | Execute exactly ONE explicitly assigned task through the Ralph loop to a validated queued commit — only on explicit user request |

---

## Routing Logic

### Intent

1. **Create / move / archive a task?** → `ledger-tasks-yylo`
2. **Plan or register new work?** → `plan-ledger-tasks-yylo` (PDR first, then tasks)
3. **"Understand this project first"?** → `understand-project-yylo`
4. **Find or update project knowledge / docs?** → `wiki-yylo`
5. **Define a repeatable validated workflow?** → `workflow-yylo`
6. **Capture evidence / receipts / provenance?** → `artifact-yylo`
7. **"Run the ralph loop on TASK_ID"?** → `ralph-loop-yylo` (explicit request only)

### Task state

- Task not started / needs implementation → `understand-project-yylo` → `plan-ledger-tasks-yylo` → `ralph-loop-yylo`
- Task in flight, validation evidence needed → `artifact-yylo` (report Records) + `ledger-tasks-yylo` (checkpoints)
- Knowledge should outlive the session → `wiki-yylo`
- Merge-time → `ledger-tasks-yylo` board state + YYLO CLI `yy merge status` (the merge queue owns review)

---

## Execution Pattern

```
1. Announce: "Routing to [skill-name]..."
2. Verify: yy CLI available (install @yylo/cli if not); Ledger namespaces present in yy ledger --help
3. Load: Read the SKILL.md from the path in the catalog
4. Execute: Follow the skill's instructions
5. Confirm: For any mutating operation (task finish, merge land, Record writes), confirm with the user before running it
6. Cite: Reference the skill in the response
```

---

## Quick Reference

| Task | Route To |
|------|----------|
| Create / list / search / archive Kanban tasks | `ledger-tasks-yylo` |
| Plan a feature (PDR + tasks) | `plan-ledger-tasks-yylo` |
| Inspect the codebase before changing it | `understand-project-yylo` |
| Find / update durable project docs | `wiki-yylo` |
| Define a validated workflow Record | `workflow-yylo` |
| Capture run evidence with provenance | `artifact-yylo` |
| Execute one assigned task autonomously | `ralph-loop-yylo` |

---

## Workflow Decision Tree

```
What does the user want?
├── Manage the board (tasks, deps, ordering)
│   └── ledger-tasks-yylo
├── Plan / register new work
│   ├── Understand the project first? → understand-project-yylo
│   └── Then → plan-ledger-tasks-yylo (PDR + implementation-sized tasks)
├── Knowledge that must outlive this session
│   └── wiki-yylo (search first, then create; never edit Ledger storage directly)
├── Repeatable, validated process
│   └── workflow-yylo (storage ≠ execution ≠ run evidence)
├── Evidence / receipts / audit trail
│   └── artifact-yylo (immutable report Records with provenance)
└── "Do this one task end-to-end"
    └── ralph-loop-yylo (exactly one assigned task; never widen scope)
```

---

## Common `yy` Commands

```bash
# Install / skills
npm install --global '@yylo/cli@latest'
yy skills install                     # install the agent skills explicitly

# Task lifecycle (typed task and merge flow)
yy task start TASK_ID                 # manual path: prints the feature worktree
yy task preflight TASK_ID             # read-only closure validation
yy task finish TASK_ID
yy merge status TASK_ID
yy merge land TASK_ID                 # composes and lands exactly that task

# Observable local commands
yy watch exec npm test                # bounded execution evidence
yy watch status RUN_ID

# Delegates (separately installed CLIs)
yy ledger --help                      # YYLO Ledger records/tasks/wiki/workflow/artifact
yy benchmark --help                   # evaluation/evidence package
```

> Exact commands vary by installed version — run `yy --help` and the command's `-h` before acting.

---

## Repositories

| Repository | Skills | License | Description |
|------------|--------|---------|-------------|
| [yylo-dev/yylo-skills](https://github.com/yylo-dev/yylo-skills) | 7 | MIT | Canonical, independently versioned source for skills used by YYLO CLI and YYLO Ledger |

## Statistics

- **Total Skills:** 7
- **Repositories:** 1 (official YYLO)
- **Licenses:** MIT

---

*Jump Skill maintained at github.com/fabricioctelles/jump-skills*
