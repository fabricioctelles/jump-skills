---
name: firecrawl-ninja
description: >-
  Master orchestrator for 33 Firecrawl skills. Routes to the optimal
  specialized skill based on task context. Use for any web scraping, research,
  extraction, or Firecrawl-related task.
---

# firecrawl-ninja

**Jump Skill** — Intelligent router for 33 specialized Firecrawl skills.

## Purpose

This skill routes Firecrawl tasks to the most relevant specialized skill:

1. Analyze the task context
2. Route to the best matching skill
3. Load full instructions on-demand
4. Execute with specialized knowledge

## Skill Catalog

### Core

| Skill | Path | Description |
|-------|------|-------------|
| `firecrawl` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/core/firecrawl/` | Main entry point — search, scrape, and interact with the web. |
| `firecrawl-agent` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/core/firecrawl-agent/` | Autonomous multi-page extraction into structured JSON. |
| `firecrawl-crawl` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/core/firecrawl-crawl/` | Bulk-extract many pages from one site or section. |
| `firecrawl-developer-index` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/core/firecrawl-developer-index/` | Search issues, PRs, READMEs, and documentation. |
| `firecrawl-download` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/core/firecrawl-download/` | Save a site or section as local files. |
| `firecrawl-interact` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/core/firecrawl-interact/` | Drive a live browser: click, fill forms, log in, paginate. |
| `firecrawl-map` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/core/firecrawl-map/` | Discover and list a site's URLs with search filtering. |
| `firecrawl-monitor` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/core/firecrawl-monitor/` | Alert on web changes via webhook or email. |
| `firecrawl-parse` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/core/firecrawl-parse/` | Convert local files (PDF, DOCX, XLSX) to markdown. |
| `firecrawl-research-index` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/core/firecrawl-research-index/` | Search Firecrawl's research paper index. |
| `firecrawl-scrape` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/core/firecrawl-scrape/` | Extract a URL's content as clean markdown. |
| `firecrawl-search` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/core/firecrawl-search/` | Web search with full page content. |

### Build

| Skill | Path | Description |
|-------|------|-------------|
| `firecrawl-build` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/build/firecrawl-build/` | Integrate Firecrawl into application code. |
| `firecrawl-build-interact` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/build/firecrawl-build-interact/` | Integrate `/interact` for dynamic pages. |
| `firecrawl-build-onboarding` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/build/firecrawl-build-onboarding/` | Get Firecrawl credentials and SDK setup. |
| `firecrawl-build-scrape` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/build/firecrawl-build-scrape/` | Integrate `/scrape` for single-page extraction. |
| `firecrawl-build-search` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/build/firecrawl-build-search/` | Integrate `/search` into product code. |

### Workflows

| Skill | Path | Description |
|-------|------|-------------|
| `firecrawl-company-directories` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-company-directories/` | Extract company lists from directories. |
| `firecrawl-competitive-intel` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-competitive-intel/` | Monitor competitor pricing and changes. |
| `firecrawl-dashboard-reporting` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-dashboard-reporting/` | Pull metrics from analytics dashboards. |
| `firecrawl-deep-research` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-deep-research/` | Produce intensive, cited analytical reports. |
| `firecrawl-demo-walkthrough` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-demo-walkthrough/` | Walk through product flows with browser. |
| `firecrawl-knowledge-base` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-knowledge-base/` | Build knowledge base from web content. |
| `firecrawl-knowledge-ingest` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-knowledge-ingest/` | Ingest docs portals with browser. |
| `firecrawl-lead-gen` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-lead-gen/` | Generate lead lists from directories. |
| `firecrawl-lead-research` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-lead-research/` | Produce pre-meeting intelligence briefs. |
| `firecrawl-market-research` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-market-research/` | Extract market and financial metrics. |
| `firecrawl-qa` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-qa/` | QA test websites with browser evidence. |
| `firecrawl-research-papers` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-research-papers/` | Find and synthesize research papers. |
| `firecrawl-seo-audit` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-seo-audit/` | Audit website SEO. |
| `firecrawl-shop` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-shop/` | Research products and produce recommendations. |
| `firecrawl-website-design-clone` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-website-design-clone/` | Extract design system into DESIGN.md. |
| `firecrawl-workflows` | `{{JUMP_SKILLS_DIR}}/repos/firecrawl-ninja/skills/skills/workflows/firecrawl-workflows/` | Run outcome-focused workflow deliverables. |

## Routing Logic

When a task arrives:

1. **Parse the task** — Identify keywords, services, and intent
2. **Match skill** — Find the most specific skill for the task
3. **Load SKILL.md** — Read the full instructions from the path above
4. **Execute** — Follow the skill's procedures

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
| Search the web | `firecrawl-search` |
| Scrape a URL | `firecrawl-scrape` |
| Scrape multiple pages from a site | `firecrawl-crawl` |
| Find URLs on a site | `firecrawl-map` |
| Click/login/paginate | `firecrawl-interact` |
| Parse local PDF/DOCX | `firecrawl-parse` |
| Monitor for changes | `firecrawl-monitor` |
| Deep research report | `firecrawl-deep-research` |
| SEO audit | `firecrawl-seo-audit` |
| Lead generation | `firecrawl-lead-gen` |
| Integrate into app code | `firecrawl-build-*` |

---

*Jump Skill maintained at github.com/fabricioctelles/jump-skills*
