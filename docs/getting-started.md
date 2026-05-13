# Getting Started

This guide helps you add `ai-coding-rules` to a project in a few minutes.

## 1. Copy the core files

```bash
cp AGENTS.md /path/to/project/AGENTS.md
cp CLAUDE.md /path/to/project/CLAUDE.md
cp templates/LESSONS-template.md /path/to/project/LESSONS.md
cp templates/CHANGELOG-template.md /path/to/project/CHANGELOG.md
```

## 2. Customize `AGENTS.md`

Fill in the project-specific sections:

- project overview;
- tech stack;
- directory map;
- build, test, lint, and deploy commands;
- known issues;
- files or systems agents must not change without approval.

Keep the top-level rules concise. Put deeper explanations in `rules/` or `docs/`.

## 3. Add Claude Code support

Create `CLAUDE.md` at the project root:

```md
@AGENTS.md

## Claude Code notes

Use AGENTS.md as the project operating contract.
```

This avoids maintaining two separate rule files.

## 4. Add GitHub Copilot support

Copy the Copilot adapter files:

```bash
mkdir -p /path/to/project/.github/instructions
cp adapters/github-copilot/.github/copilot-instructions.md /path/to/project/.github/copilot-instructions.md
cp adapters/github-copilot/.github/instructions/*.instructions.md /path/to/project/.github/instructions/
```

Use repository-wide instructions for universal rules and path-specific instructions for backend, frontend, tests, infrastructure, or docs.

## 5. Add lessons after real mistakes

Only add a `LESSONS.md` entry when the lesson is durable and likely to prevent future mistakes.

Good lesson:

```md
### 2026-05-13 - CSS build output overwrites custom dashboard styles

**Context:** The CSS bundler uses stale generated sources for dashboard files.
**What happened:** Rebuilding CSS overwrote newer manual fixes.
**Lesson:** Do not run the CSS bundler for dashboard styles until the source map is fixed.
**Action:** Edit individual dashboard CSS files and use cache-busting query strings.
```

Bad lesson:

```md
### Today
The bug was hard to find.
```

## 6. Update the changelog after completed work

Use `CHANGELOG.md` for completed changes, not scratch notes.

```md
| Date | Author | Type | Description | Validation | Files |
|---|---|---|---|---|---|
| 2026-05-13 | Codex | docs | Added Claude bridge and compatibility docs | Markdown review | CLAUDE.md, docs/compatibility.md |
```

## 7. Keep context bounded

Use commands that limit output:

```bash
rg -n -m 20 "TODO" src/ 2>&1 | head -c 4000
git diff -- src/file.ts 2>&1 | head -c 6000
npm test 2>&1 | tail -c 6000
```

Do not dump entire logs, diffs, generated files, dependency folders, or build output into the agent context.
