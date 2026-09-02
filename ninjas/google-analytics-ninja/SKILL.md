---
name: google-analytics-ninja
description: >-
  Master orchestrator for Google Analytics agent skills from official Google repositories.
  Use when working with Google Analytics Admin API, Data API, reporting, property
  configuration, data streams, conversion events, or any analytics task. Routes to the optimal
  specialized skill based on context. Triggers: Google Analytics, GA4, Analytics API,
  Admin API, Data API, analytics reports, metrics, dimensions, data streams, conversions,
  Firebase Analytics, Measurement Protocol.
---

# Google Analytics Ninja

**Jump Skill** — Master orchestrator that routes Google Analytics tasks to specialized skills from official Google repositories.

## Purpose

This skill acts as an intelligent router to the Google Analytics skills library. Instead of manually searching for the right skill, describe your analytics task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level Google Analytics knowledge

## Skill Catalog

### Analytics Admin API

| Skill | Path | Use When |
|-------|------|----------|
| `google-analytics-admin-api-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-analytics-ninja/skills/skills/analytics/google-analytics-admin-api-basics/` | Account/property management, data streams, custom dimensions, conversion events, Firebase/Ads links |

**Admin API Capabilities:**
- List and manage accounts and properties
- Configure data streams (web, iOS, Android)
- Manage custom dimensions and metrics
- Configure conversion events
- Set data retention policies
- Manage Measurement Protocol secrets
- Configure Firebase and Google Ads links
- User and access management

### Analytics Data API

| Skill | Path | Use When |
|-------|------|----------|
| `google-analytics-data-api-basics` | `{{JUMP_SKILLS_DIR}}/repos/google-analytics-ninja/skills/skills/analytics/google-analytics-data-api-basics/` | Reports, queries, metrics/dimensions, API enablement |

**Data API Capabilities:**
- Run customized analytics reports
- Query metrics (activeUsers, sessions, screenPageViews, etc.)
- Query dimensions (date, city, deviceCategory, etc.)
- Check metrics and dimensions compatibility
- Batch reporting requests
- Real-time reports
- Funnel reports
- Cohort analysis

## Routing Logic

When a task arrives:

1. **Account/property management?** → `google-analytics-admin-api-basics`
2. **Data streams configuration?** → `google-analytics-admin-api-basics`
3. **Custom dimensions/metrics?** → `google-analytics-admin-api-basics`
4. **Conversion events?** → `google-analytics-admin-api-basics`
5. **Firebase/Ads links?** → `google-analytics-admin-api-basics`
6. **Run reports?** → `google-analytics-data-api-basics`
7. **Query metrics?** → `google-analytics-data-api-basics`
8. **Real-time data?** → `google-analytics-data-api-basics`
9. **API setup/enablement?** → Both skills cover this

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
| List GA4 properties | `google-analytics-admin-api-basics` |
| Create data stream | `google-analytics-admin-api-basics` |
| Configure conversions | `google-analytics-admin-api-basics` |
| Link Firebase | `google-analytics-admin-api-basics` |
| Run analytics report | `google-analytics-data-api-basics` |
| Query active users | `google-analytics-data-api-basics` |
| Real-time report | `google-analytics-data-api-basics` |
| Check dimension compatibility | `google-analytics-data-api-basics` |

## API Decision Tree

```
What do you need?

Configuration & Management
├── Accounts → Admin API
├── Properties → Admin API
├── Data Streams → Admin API
├── Custom Dimensions → Admin API
├── Conversions → Admin API
├── User Access → Admin API
└── Integrations (Firebase/Ads) → Admin API

Reporting & Analysis
├── Standard Reports → Data API
├── Custom Reports → Data API
├── Real-time Data → Data API
├── Funnel Analysis → Data API
├── Cohort Analysis → Data API
└── Metric Queries → Data API
```

## Common Metrics & Dimensions

### Popular Metrics
- `activeUsers` - Active users in date range
- `sessions` - Total sessions
- `screenPageViews` - Page/screen views
- `conversions` - Conversion events
- `totalRevenue` - Total revenue
- `engagementRate` - Engaged sessions ratio
- `bounceRate` - Bounce rate
- `averageSessionDuration` - Avg session length

### Popular Dimensions
- `date` - Date (YYYYMMDD)
- `city` - User city
- `country` - User country
- `deviceCategory` - Device type
- `sessionSource` - Traffic source
- `sessionMedium` - Traffic medium
- `pagePath` - Page URL path
- `eventName` - Event name

## Statistics

- **Total Skills:** 3+
- **Repository:** google/skills (skills/analytics/)
- **Source:** Official Google Analytics

---

*Jump Skill maintained at github.com/fabricioctelles/jump-skills*
