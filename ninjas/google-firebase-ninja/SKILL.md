---
name: google-firebase-ninja
description: >-
  Master orchestrator for 18+ Firebase agent skills from official Google repositories.
  Use when working with Firebase, Firestore, Firebase Auth, Firebase Hosting,
  Cloud Functions, Firebase Extensions, or any Firebase backend task. Routes to the optimal
  specialized skill based on context. Triggers: Firebase, Firestore, Firebase Auth,
  Firebase Hosting, Cloud Functions, Firebase CLI, Firebase Extensions, Realtime Database,
  Firebase Storage, Firebase App Check, Remote Config, firebase-tools.
---

# Google Firebase Ninja

**Jump Skill** — Master orchestrator that routes Firebase tasks to 18+ specialized skills from official Google repositories.

## Purpose

This skill acts as an intelligent router to the Firebase skills library. Instead of manually searching for the right skill, describe your Firebase task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level Firebase knowledge

## Skill Catalog

### Firebase Core & CLI

| Skill | Path | Use When |
|-------|------|----------|
| `firebase-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/skills/skills/cloud/firebase-basics/` | CLI setup, login, project creation, app config |
| `firebase-init` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-init/` | Initialize Firebase in project |
| `firebase-deploy` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-deploy/` | Deploy Firebase resources |

### Firestore

| Skill | Path | Use When |
|-------|------|----------|
| `firebase-firestore` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-firestore/` | Firestore queries, data modeling |
| `firebase-firestore-rules` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-firestore-rules/` | Security rules, access control |
| `firebase-firestore-indexes` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-firestore-indexes/` | Composite indexes, query optimization |

### Firebase Auth

| Skill | Path | Use When |
|-------|------|----------|
| `firebase-auth` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-auth/` | Authentication setup, providers |
| `firebase-auth-email` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-auth-email/` | Email/password authentication |
| `firebase-auth-social` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-auth-social/` | Google, Facebook, Apple Sign-In |
| `firebase-auth-phone` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-auth-phone/` | Phone number authentication |

### Firebase Hosting & Functions

| Skill | Path | Use When |
|-------|------|----------|
| `firebase-hosting` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-hosting/` | Static hosting, rewrites, redirects |
| `firebase-functions` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-functions/` | Cloud Functions for Firebase |
| `firebase-functions-triggers` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-functions-triggers/` | Firestore, Auth, Storage triggers |

### Firebase Storage & Realtime DB

| Skill | Path | Use When |
|-------|------|----------|
| `firebase-storage` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-storage/` | File uploads, storage rules |
| `firebase-realtime-database` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-realtime-database/` | Realtime Database operations |

### Firebase Extensions & Config

| Skill | Path | Use When |
|-------|------|----------|
| `firebase-extensions` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-extensions/` | Install and configure extensions |
| `firebase-remote-config` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-remote-config/` | Remote Config, A/B testing |
| `firebase-app-check` | `{{JUMP_SKILLS_DIR}}/repos/google-firebase-ninja/firebase-skills/skills/firebase-app-check/` | App attestation, abuse prevention |

## Routing Logic

When a task arrives:

1. **Firebase CLI/setup?** → `firebase-basics`, `firebase-init`
2. **Firestore data?** → `firebase-firestore`
3. **Firestore security?** → `firebase-firestore-rules`
4. **Firestore indexes?** → `firebase-firestore-indexes`
5. **Authentication?** → `firebase-auth`, `firebase-auth-*`
6. **Static hosting?** → `firebase-hosting`
7. **Backend functions?** → `firebase-functions`
8. **Function triggers?** → `firebase-functions-triggers`
9. **File storage?** → `firebase-storage`
10. **Realtime sync?** → `firebase-realtime-database`
11. **Extensions?** → `firebase-extensions`
12. **Remote config?** → `firebase-remote-config`
13. **Deploy?** → `firebase-deploy`

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
| Setup Firebase CLI | `firebase-basics` |
| Initialize project | `firebase-init` |
| Firestore queries | `firebase-firestore` |
| Write security rules | `firebase-firestore-rules` |
| Add authentication | `firebase-auth` |
| Deploy static site | `firebase-hosting` |
| Create Cloud Function | `firebase-functions` |
| Upload files | `firebase-storage` |
| Deploy everything | `firebase-deploy` |

## Firebase Stack Decision Tree

```
Backend?
├── Database
│   ├── Document-based → firebase-firestore
│   └── Realtime sync → firebase-realtime-database
├── Functions → firebase-functions
└── Storage → firebase-storage

Frontend Integration?
├── Auth
│   ├── Email/Password → firebase-auth-email
│   ├── Social login → firebase-auth-social
│   └── Phone → firebase-auth-phone
├── Hosting → firebase-hosting
└── Config → firebase-remote-config

Security?
├── Firestore rules → firebase-firestore-rules
├── Storage rules → firebase-storage
└── App Check → firebase-app-check
```

## Statistics

- **Total Skills:** 18+
- **Repositories:** firebase/agent-skills, google/skills
- **Source:** Official Firebase

---

*Jump Skill maintained at github.com/fabricioctelles/jump-skills*
