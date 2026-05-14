# ai-coding-rules

Lightweight, tool-neutral rules for AI coding agents.

This repository gives projects a portable `AGENTS.md`, safety guardrails, context-discipline patterns, persistent lessons, changelog hygiene, and optional adapters for Codex, Claude Code, GitHub Copilot, Cursor, Windsurf, Aider, Gemini, and other coding agents.

The goal is not to create a large agent harness. The goal is to give every repo a small operating contract that keeps AI coding sessions safe, concise, reviewable, and consistent.

## What this repo gives you

- `AGENTS.md` - universal project operating rules for coding agents.
- `CLAUDE.md` - Claude Code bridge that imports `AGENTS.md`.
- `LESSONS.md` template - persistent log of reusable mistakes and fixes.
- `CHANGELOG.md` template - human-readable record of work completed by humans and agents.
- `rules/` - modular rule packs for safety, validation, memory, git workflow, deployment, context discipline, and production discipline.
- `skills/` - reusable workflows for onboarding, security checks, validation, closeout, and context-safe inspection.
- `adapters/` - tool-specific notes for Codex, Claude Code, GitHub Copilot, Cursor, Windsurf, and Aider.
- `docs/` - public documentation suitable for GitHub Pages.
- `wiki/` - pages that can be copied into the GitHub wiki repo.

## Quick start

Copy the core files into a project:

```bash
cp AGENTS.md /path/to/project/AGENTS.md
cp CLAUDE.md /path/to/project/CLAUDE.md
cp templates/LESSONS-template.md /path/to/project/LESSONS.md
cp templates/CHANGELOG-template.md /path/to/project/CHANGELOG.md
```

Then customize the project-specific sections in `AGENTS.md`.

## Recommended structure

```text
your-project/
  AGENTS.md
  CLAUDE.md
  LESSONS.md
  CHANGELOG.md
  .github/
    copilot-instructions.md
    instructions/
      backend.instructions.md
      frontend.instructions.md
```

For this source repo, keep the reusable material organized like this:

```text
ai-coding-rules/
  AGENTS.md
  CLAUDE.md
  SECURITY.md
  docs/
  rules/
  skills/
  adapters/
  templates/
  wiki/
```

## Compatibility snapshot

| Tool | Recommended file | Notes |
|---|---|---|
| OpenAI Codex | `AGENTS.md` | Use `AGENTS.md` as the project operating contract. |
| Claude Code | `CLAUDE.md` | `CLAUDE.md` should import `AGENTS.md` with `@AGENTS.md`. |
| GitHub Copilot | `.github/copilot-instructions.md`, `.github/instructions/*.instructions.md`, `AGENTS.md` | Use repository-wide, path-specific, and agent instructions together. |
| Cursor | Project rules file or imported `AGENTS.md` | Use the adapter notes as a starting point. |
| Windsurf | Project rules file or imported `AGENTS.md` | Use the adapter notes as a starting point. |
| Aider | Convention file plus copied rules | Use the adapter notes as a starting point. |
| Gemini / Jules | `AGENTS.md` or tool-specific memory file | Keep the root rules concise. |

## Core principle: context discipline

AI coding agents often fail because they flood the context window with unbounded output. This repo treats context as a limited engineering resource.

Prefer scoped, bounded commands:

```bash
rg -n -m 20 "search term" src/ 2>&1 | head -c 4000
git diff -- path/to/file 2>&1 | head -c 6000
npm test 2>&1 | tail -c 6000
```

Avoid unbounded commands:

```bash
cat large-file.log
rg -n "search term" .
git diff
npm test
```

## Safety baseline

Agents must not:

- delete files without explicit user approval;
- expose secrets, tokens, private keys, `.env` values, or credentials;
- deploy, force-push, reset hard, or change production data without explicit approval;
- claim validation passed unless it actually ran and passed;
- rewrite large areas of code when a narrow patch will solve the task.

## Production Discipline Rule Packs

The production discipline rule packs help agents keep running systems, documentation, and repository history aligned without exposing private operational details.

- **Deployment Integrity** (`rules/deployment-integrity.md`) keeps deployed code, process definitions, and version control aligned. It treats the repository as the source of truth and requires drift to be reconciled before new work builds on it.
- **Schema Discipline** (`rules/schema-discipline.md`) requires database schema changes to live in ordered, committed migrations rather than hidden application startup logic or undocumented manual changes.
- **Status Truthfulness** (`rules/status-truthfulness.md`) requires completion, validation, deployment, and progress claims to match evidence from commands, code, commits, or documented limitations.
- **No Phantom References** (`rules/no-phantom-references.md`) requires routes, tables, columns, processes, imports, and dependencies referenced by code or docs to either exist or be removed.
- **Sanitized seeded lesson** (`templates/LESSONS-seeded.md`) provides a public-safe starter lesson about deployment drift and source-of-truth discipline.

## Docs and wiki

Use `docs/index.md` as the GitHub Pages landing page if you publish from the `/docs` folder.

Use the files in `wiki/` for GitHub Wiki. The wiki is a separate git repository ending in `.wiki.git`; after creating the first wiki page on GitHub, clone it, copy the `wiki/*.md` files, commit, and push.

## Suggested GitHub repo metadata

Description:

```text
Lightweight AGENTS.md rules, safety guardrails, context discipline, and memory templates for AI coding agents.
```

Topics:

```text
agents-md ai-coding codex claude-code github-copilot cursor windsurf aider prompt-engineering developer-tools coding-agents ai-agent-rules
```

## License

MIT. Use, fork, adapt, and share.
