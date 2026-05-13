---
name: repo-onboarding
description: Use when first adding ai-coding-rules to a repository or when refreshing project-specific instructions.
---

# Repo Onboarding

## Goal

Create or refresh the minimum files that help coding agents work safely in this repository.

## Steps

1. Inspect the repository structure with bounded output.
2. Identify languages, frameworks, package managers, test commands, and deployment hints.
3. Create or update `AGENTS.md` with project-specific facts.
4. Add `CLAUDE.md` that imports `AGENTS.md`.
5. Add `LESSONS.md` and `CHANGELOG.md` if missing.
6. Add `.github/copilot-instructions.md` if GitHub Copilot is used.
7. Do not invent commands. Mark unknown commands as TODO.

## Output

```text
Created/updated:
- ...
Project facts found:
- ...
Unknowns:
- ...
Validation:
- ...
```

