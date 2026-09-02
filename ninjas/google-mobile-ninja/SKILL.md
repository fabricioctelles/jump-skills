---
name: google-mobile-ninja
description: >-
  Master orchestrator for 35+ mobile development agent skills from official Google repositories.
  Use when working with Android, Flutter, Dart, Jetpack Compose, Navigation, CameraX,
  AGP, Play services, or any mobile app development task. Routes to the optimal
  specialized skill based on context. Triggers: Android, Flutter, Dart, Jetpack,
  Compose, Navigation, CameraX, AGP, Gradle, Play Store, Play services, mobile app,
  iOS (Flutter), widget, state management, testing, R8, ProGuard.
---

# Google Mobile Ninja

**Jump Skill** — Master orchestrator that routes mobile development tasks to 35+ specialized skills from official Google repositories.

## Purpose

This skill acts as an intelligent router to the Android, Flutter, and Dart skills library. Instead of manually searching for the right skill, describe your mobile dev task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level mobile knowledge

## Skill Catalog

### Android - Jetpack Compose

| Skill | Path | Use When |
|-------|------|----------|
| `jetpack-compose` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/android-skills/jetpack-compose/` | Compose UI, layouts, state, theming |
| `compose-navigation` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/android-skills/navigation/navigation-3/` | Navigation 3, type-safe navigation |

### Android - Camera & Media

| Skill | Path | Use When |
|-------|------|----------|
| `camerax` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/android-skills/camera/camerax/` | CameraX implementation |
| `media3-cast-integration` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/android-skills/media/media3-cast-integration/` | Media3 + Cast integration |

### Android - Build & Performance

| Skill | Path | Use When |
|-------|------|----------|
| `agp-9-upgrade` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/android-skills/build-system/agp/agp-9-upgrade/` | AGP 9 upgrade guide |
| `r8-analyzer` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/android-skills/performance/r8-analyzer/` | R8 shrinking, ProGuard analysis |
| `android-profiler` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/android-skills/profilers/android-profiler/` | Android Studio profiler |

### Android - Identity & AI

| Skill | Path | Use When |
|-------|------|----------|
| `identity` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/android-skills/identity/` | Credential Manager, passkeys, Sign-In |
| `appfunctions` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/android-skills/device-ai/appfunctions/` | Device AI, App Functions |

### Android - Play & DevTools

| Skill | Path | Use When |
|-------|------|----------|
| `play` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/android-skills/play/` | Play Store, in-app updates, reviews |
| `android-cli` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/android-skills/devtools/android-cli/` | Android CLI tools |

### Flutter - Core

| Skill | Path | Use When |
|-------|------|----------|
| `flutter-create-app` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/flutter-plugins/skills/flutter-create-app/` | Create new Flutter app |
| `flutter-add-feature` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/flutter-plugins/skills/flutter-add-feature/` | Add features to Flutter app |
| `flutter-widget-guide` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/flutter-plugins/skills/flutter-widget-guide/` | Widget selection, best practices |
| `flutter-state-management` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/flutter-plugins/skills/flutter-state-management/` | State management patterns |

### Flutter - Testing & Quality

| Skill | Path | Use When |
|-------|------|----------|
| `flutter-add-test` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/flutter-plugins/skills/flutter-add-test/` | Widget tests, unit tests |
| `flutter-fix-bug` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/flutter-plugins/skills/flutter-fix-bug/` | Debug and fix Flutter issues |
| `flutter-analyze` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/flutter-plugins/skills/flutter-analyze/` | Static analysis, linting |

### Flutter - Platform & Integration

| Skill | Path | Use When |
|-------|------|----------|
| `flutter-platform-channels` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/flutter-plugins/skills/flutter-platform-channels/` | Native platform integration |
| `flutter-web` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/flutter-plugins/skills/flutter-web/` | Flutter for Web |
| `flutter-desktop` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/flutter-plugins/skills/flutter-desktop/` | Flutter for Desktop |

### Dart - Core

| Skill | Path | Use When |
|-------|------|----------|
| `dart-add-unit-test` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/dart-skills/skills/dart-add-unit-test/` | Dart unit tests |
| `dart-create-package` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/dart-skills/skills/dart-create-package/` | Create Dart package |
| `dart-add-dependency` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/dart-skills/skills/dart-add-dependency/` | Add pub dependencies |
| `dart-analyze-code` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/dart-skills/skills/dart-analyze-code/` | Dart analyzer, lints |
| `dart-fix-code` | `{{JUMP_SKILLS_DIR}}/repos/google-mobile-ninja/dart-skills/skills/dart-fix-code/` | dart fix, code cleanup |

## Routing Logic

When a task arrives:

1. **Jetpack Compose?** → `jetpack-compose`
2. **Android Navigation?** → `compose-navigation`
3. **Camera/CameraX?** → `camerax`
4. **AGP/Gradle upgrade?** → `agp-9-upgrade`
5. **App size/R8?** → `r8-analyzer`
6. **Android profiling?** → `android-profiler`
7. **Sign-in/Identity?** → `identity`
8. **Play Store?** → `play`
9. **Flutter new app?** → `flutter-create-app`
10. **Flutter widget?** → `flutter-widget-guide`
11. **Flutter state?** → `flutter-state-management`
12. **Flutter test?** → `flutter-add-test`
13. **Flutter debug?** → `flutter-fix-bug`
14. **Dart package?** → `dart-create-package`
15. **Dart test?** → `dart-add-unit-test`

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
| Build Compose UI | `jetpack-compose` |
| Setup navigation | `compose-navigation` |
| Add camera feature | `camerax` |
| Upgrade AGP | `agp-9-upgrade` |
| Reduce APK size | `r8-analyzer` |
| Create Flutter app | `flutter-create-app` |
| Add Flutter feature | `flutter-add-feature` |
| Flutter state management | `flutter-state-management` |
| Write Flutter tests | `flutter-add-test` |
| Create Dart package | `dart-create-package` |

## Platform Decision Tree

```
Native Android?
├── UI → jetpack-compose
├── Navigation → compose-navigation
├── Camera → camerax
├── Build → agp-9-upgrade, r8-analyzer
└── Identity → identity

Cross-Platform (Flutter)?
├── New project → flutter-create-app
├── Features → flutter-add-feature
├── State → flutter-state-management
├── Testing → flutter-add-test
└── Platform integration → flutter-platform-channels

Dart Library?
├── Create → dart-create-package
├── Test → dart-add-unit-test
└── Analyze → dart-analyze-code
```

## Statistics

- **Total Skills:** 35+
- **Repositories:** android/skills, flutter/agent-plugins, dart-lang/skills
- **Source:** Official Google Mobile

---

*Jump Skill maintained at github.com/fabricioctelles/jump-skills*
