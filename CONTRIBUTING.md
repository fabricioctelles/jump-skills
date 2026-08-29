# Contributing to Jump Skills

Thank you for your interest in contributing to Jump Skills! 🥷

## Ways to Contribute

### 🐛 Bug Reports

If you find a bug, please open an issue with:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Your environment (OS, shell, agent versions)

### 💡 Feature Requests

Have an idea for a new feature? Open an issue with:
- Clear description of the feature
- Use case / problem it solves
- Any implementation ideas

### 📝 Documentation

Help improve documentation:
- Fix typos or unclear explanations
- Add examples
- Improve Ninja SKILL.md files

### ➕ New Ninjas

Want to add support for a new platform (GCP, DigitalOcean, Cloudflare, etc.)?

See the detailed guide below: [Adding a New Ninja](#adding-a-new-ninja-full-guide)

---

## Development Setup

```bash
# Clone the repository
git clone https://github.com/fabriciotelles/jump-skills.git
cd jump-skills

# Make scripts executable
chmod +x sync-repos.sh install-ninjas.sh

# Test sync (use a specific ninja to save bandwidth)
./sync-repos.sh firecrawl-ninja

# Test install
./install-ninjas.sh firecrawl-ninja
./install-ninjas.sh --status
```

---

## Pull Request Process

1. **Fork** the repository
2. **Create a branch**: `git checkout -b feature/my-feature`
3. **Make changes** following the guidelines below
4. **Test** your changes locally
5. **Commit** with clear messages
6. **Push** and open a Pull Request

### Commit Message Format

```
feat(ninja): add gcp-ninja with 50 skills
fix(sync): handle repos with no skills/ directory
docs(readme): add installation troubleshooting
```

### Code Style

- **Shell scripts**: Use `shellcheck` for linting
- **Markdown**: Use proper headers and formatting
- **SKILL.md files**: Follow the existing structure (see examples in `ninjas/`)

---

## Adding a New Ninja (Full Guide)

> **Important**: A PR for a new Ninja should include ALL necessary files. 
> The `repos/` folder and `.skills-map` are **NOT** included in the PR — they are generated locally.

### Step 1: Research Repositories

Before starting, find skill repositories for your platform:

- Look for repositories with `skills/` directories containing `SKILL.md` files
- Verify license compatibility (MIT, Apache 2.0, MIT-0, etc.)
- Prefer official repositories from the platform vendor
- Document what you find in a GitHub issue first (optional but recommended)

**Good signs a repo has usable skills:**
```
repo/
├── skills/
│   ├── skill-name-1/
│   │   └── SKILL.md
│   ├── skill-name-2/
│   │   └── SKILL.md
```

### Step 2: Update `repos.md`

Add a new section for your ninja:

```markdown
---

## [platform-ninja]

Brief description of the platform and what skills are available.

```repos
https://github.com/org/repo1
https://github.com/org/repo2
```

| Repository | Org | Description |
|------------|-----|-------------|
| repo1 | org | What skills it provides |
| repo2 | org | What skills it provides |
```

### Step 3: Update `ninjas.md`

Add your ninja to the `ninjas` block:

```markdown
```ninjas
aws-ninja
azure-ninja
firecrawl-ninja
platform-ninja        # ← Add here (alphabetical order preferred)
```
```

And add a row to the description table:

```markdown
| `platform-ninja` | Orchestrates X skills for Platform (service1, service2, etc.) | X |
```

### Step 4: Clone and Map Skills Locally

Run sync to clone the repositories and generate the skills map:

```bash
./sync-repos.sh platform-ninja
```

This creates:
- `repos/platform-ninja/<repo-name>/` — cloned repositories
- `.skills-map` — updated with discovered skills

**Check the mapped skills:**
```bash
grep "^platform-ninja|" .skills-map
```

### Step 5: Create the Ninja SKILL.md

```bash
mkdir -p ninjas/platform-ninja
```

Create `ninjas/platform-ninja/SKILL.md` following this structure:

```markdown
---
name: platform-ninja
description: >-
  Master orchestrator for X skills from Platform repositories.
  Use when working with ANY Platform service. Triggers: platform,
  service1, service2, keyword1, keyword2...
---

# Platform Ninja

**Jump Skill** — Master orchestrator that routes Platform tasks to X specialized skills.

## Purpose

This skill acts as an intelligent router...

## Skill Catalog

### Category 1

| Skill | Path | Use When |
|-------|------|----------|
| `skill-name` | `{{JUMP_SKILLS_DIR}}/repos/platform-ninja/repo-name/skills/skill-name/` | Description |

### Category 2

| Skill | Path | Use When |
|-------|------|----------|
...

## How to Use

...

## Repositories

| Repository | Skills | Description |
|------------|--------|-------------|
| [org/repo](https://github.com/org/repo) | X | Description |
```

**Important:**
- Use `{{JUMP_SKILLS_DIR}}` as the path prefix — it gets replaced during installation
- Get the correct paths from `.skills-map`
- Organize skills into logical categories

### Step 6: Test Locally

```bash
# Install the ninja
./install-ninjas.sh platform-ninja

# Verify installation
./install-ninjas.sh --status

# Check a skill path was correctly substituted
grep "skill-name" ~/.kiro/skills/platform-ninja/SKILL.md
# Should show absolute path, not {{JUMP_SKILLS_DIR}}
```

### Step 7: Submit PR

Your PR should include **only these files**:

```
repos.md                           # Updated with [platform-ninja] section
ninjas.md                          # Updated with platform-ninja entry
ninjas/platform-ninja/SKILL.md     # The new Ninja skill file
```

**Do NOT include:**
- `repos/` directory (git-ignored, generated locally)
- `.skills-map` (git-ignored, generated locally)

**PR Description should include:**
- Platform/provider name
- Number of skills mapped
- List of source repositories
- Brief description of skill categories
- Any special considerations

---

## PR Checklist for New Ninjas

- [ ] `repos.md` has new `[ninja-name]` section with repo URLs
- [ ] `ninjas.md` has ninja in the `ninjas` block
- [ ] `ninjas.md` has ninja in the description table
- [ ] `ninjas/ninja-name/SKILL.md` exists with proper structure
- [ ] SKILL.md uses `{{JUMP_SKILLS_DIR}}` placeholder in all paths
- [ ] SKILL.md paths match actual skill locations in repos
- [ ] Tested locally with `./sync-repos.sh ninja-name`
- [ ] Tested locally with `./install-ninjas.sh ninja-name`
- [ ] All source repositories have compatible licenses

---

## Questions?

Feel free to open an issue for any questions or discussions.

---

Thank you for contributing! 🙏
