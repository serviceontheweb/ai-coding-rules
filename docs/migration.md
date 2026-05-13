# Migration Guide

Use this guide to upgrade the current repository layout without losing existing content.

## Current-to-target migration

Recommended target:

```text
AGENTS.md
CLAUDE.md
SECURITY.md
README.md
docs/
rules/
skills/
adapters/
templates/
wiki/
```

## Step 1: Create a safety branch

```bash
git checkout -b docs/agent-rules-v0.2
```

## Step 2: Move templates into `templates/`

```bash
mkdir -p templates
mv project-agents-template.md templates/project-agents-template.md
mv LESSONS-template.md templates/LESSONS-template.md
mv CHANGELOG-template.md templates/CHANGELOG-template.md
```

Update references from:

```text
project-agents-template.md
```

to:

```text
templates/project-agents-template.md
```

## Step 3: Add Claude bridge

Add `CLAUDE.md`:

```md
@AGENTS.md

## Claude Code notes

Use AGENTS.md as the project operating contract.
```

## Step 4: Split detailed rules

Move long explanations from root files into:

```text
rules/context-discipline.md
rules/safety.md
rules/validation.md
rules/git-workflow.md
rules/deployment.md
rules/memory.md
```

Keep root `AGENTS.md` concise.

## Step 5: Add adapters

Add:

```text
adapters/claude/
adapters/codex/
adapters/github-copilot/
adapters/cursor/
adapters/windsurf/
adapters/aider/
```

## Step 6: Add docs site

Use `docs/index.md` as a GitHub Pages landing page if publishing from `/docs`.

## Step 7: Add wiki pages

Copy the files from `wiki/` into the separate wiki repository.

## Step 8: Validate

Before merging:

```bash
git status --short
git diff --stat
find . -name '*.md' -maxdepth 4 | sort
```

Check:

- no broken template paths;
- no accidental secret text;
- no duplicate contradictory compatibility claims;
- `CLAUDE.md` imports `AGENTS.md`;
- `README.md` points to `docs/` and `wiki/`.
