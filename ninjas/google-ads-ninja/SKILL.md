---
name: google-ads-ninja
description: >-
  Master orchestrator for 15+ Google Ads agent skills from official Google repositories.
  Use when working with Google Ads API, Mobile Ads SDK (AdMob/Ad Manager), IMA SDK,
  Data Manager API, or any advertising/monetization task. Routes to the optimal
  specialized skill based on context. Triggers: Google Ads, AdMob, Ad Manager,
  Mobile Ads, banner ads, interstitial, rewarded ads, IMA SDK, DAI, VAST, VMAP,
  Data Manager, conversion tracking, audience ingestion, advertising API.
---

# Google Ads Ninja

**Jump Skill** — Master orchestrator that routes Google Ads tasks to 15+ specialized skills from official Google repositories.

## Purpose

This skill acts as an intelligent router to the Google Ads skills library. Instead of manually searching for the right skill, describe your advertising task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level Google Ads knowledge

## Skill Catalog

### Google Ads API

| Skill | Path | Use When |
|-------|------|----------|
| `google-ads-api-quickstart` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/google-ads-api-quickstart/` | API setup, credentials, developer tokens, first script |
| `google-ads-api-mcp-setup` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/google-ads-api-mcp-setup/` | MCP server setup for AI assistants |
| `google-ads-api-account-diagnostics` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/google-ads-api-account-diagnostics/` | Performance issues, conversion loss, impression share |

### Google Mobile Ads SDK

| Skill | Path | Use When |
|-------|------|----------|
| `google-mobile-ads-get-started` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/google-mobile-ads-get-started/` | SDK installation, AdMob/Ad Manager setup |
| `google-mobile-ads-banner` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/google-mobile-ads-banner/` | Banner ads (Android, iOS, Unity) |
| `google-mobile-ads-interstitial` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/google-mobile-ads-interstitial/` | Interstitial ads (Android, iOS, Unity) |
| `google-mobile-ads-rewarded` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/google-mobile-ads-rewarded/` | Rewarded ads (Android, iOS, Unity) |
| `google-mobile-ads-android-migrate-to-next-gen` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/google-mobile-ads-android-migrate-to-next-gen/` | Migration to GMA Next-Gen SDK |

### IMA SDK (Interactive Media Ads)

| Skill | Path | Use When |
|-------|------|----------|
| `ima-sdk-client-side` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/ima-sdk-client-side/` | VAST/VMAP client-side ad insertion |
| `ima-dai-sdk` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/ima-dai-sdk/` | Dynamic Ad Insertion (DAI), HLS/DASH streams |

### Data Manager API

| Skill | Path | Use When |
|-------|------|----------|
| `data-manager-api-setup` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/data-manager-api-setup/` | Client library installation, authentication |
| `data-manager-api-audience-ingestion` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/data-manager-api-audience-ingestion/` | Upload audience members, Customer Match |
| `data-manager-api-event-ingestion` | `{{JUMP_SKILLS_DIR}}/repos/google-ads-ninja/skills/skills/ads/data-manager-api-event-ingestion/` | Offline conversions, enhanced conversions |

## Routing Logic

When a task arrives:

1. **Google Ads API setup?** → `google-ads-api-quickstart`
2. **Ads API + AI assistant?** → `google-ads-api-mcp-setup`
3. **Campaign performance issues?** → `google-ads-api-account-diagnostics`
4. **Mobile SDK install?** → `google-mobile-ads-get-started`
5. **Banner ads?** → `google-mobile-ads-banner`
6. **Interstitial ads?** → `google-mobile-ads-interstitial`
7. **Rewarded ads?** → `google-mobile-ads-rewarded`
8. **SDK migration?** → `google-mobile-ads-android-migrate-to-next-gen`
9. **Video ads (VAST/VMAP)?** → `ima-sdk-client-side`
10. **DAI streaming?** → `ima-dai-sdk`
11. **Audience upload?** → `data-manager-api-audience-ingestion`
12. **Conversion tracking?** → `data-manager-api-event-ingestion`

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
| Setup Ads API | `google-ads-api-quickstart` |
| Debug campaign performance | `google-ads-api-account-diagnostics` |
| Add banner ads to app | `google-mobile-ads-banner` |
| Add rewarded ads | `google-mobile-ads-rewarded` |
| Video ads in player | `ima-sdk-client-side` |
| DAI live streaming | `ima-dai-sdk` |
| Upload Customer Match | `data-manager-api-audience-ingestion` |
| Track offline conversions | `data-manager-api-event-ingestion` |
| Migrate to new SDK | `google-mobile-ads-android-migrate-to-next-gen` |

## Ad Format Decision Tree

```
Mobile App Monetization?
├── Display ads → google-mobile-ads-banner
├── Full-screen → google-mobile-ads-interstitial
└── User reward → google-mobile-ads-rewarded

Video Player?
├── Client-side (VAST/VMAP) → ima-sdk-client-side
└── Server-side (DAI) → ima-dai-sdk

First-party Data?
├── Audience lists → data-manager-api-audience-ingestion
└── Conversions → data-manager-api-event-ingestion
```

## Statistics

- **Total Skills:** 15+
- **Repository:** google/skills (skills/ads/)
- **Source:** Official Google Ads

---

*Jump Skill maintained at github.com/fabricioctelles/jump-skills*
