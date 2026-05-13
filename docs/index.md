---
title: ai-coding-rules
---

# ai-coding-rules

`ai-coding-rules` is a lightweight rules and memory starter kit for AI coding agents.

It gives every project a clear operating contract:

- what the agent should read first;
- what it must never do without approval;
- how it should inspect code without flooding context;
- how it should validate work;
- how it should record durable lessons;
- how it should maintain a changelog.

## Why this exists

AI coding sessions often fail for predictable reasons:

- the agent has no project memory;
- the agent repeats known mistakes;
- the context window fills with huge logs or diffs;
- risky commands are run too casually;
- validation is skipped or overstated;
- work is completed without a clear record.

This project solves those problems with a small set of Markdown files that can travel across tools.

## Start here

1. Read [Getting Started](getting-started.md).
2. Review [Compatibility](compatibility.md).
3. Copy `AGENTS.md`, `CLAUDE.md`, `LESSONS.md`, and `CHANGELOG.md` into your project.
4. Customize the project-specific sections.
5. Add adapters for the tools your team actually uses.

## Recommended files

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

## The three-file memory system

| File | Purpose |
|---|---|
| `AGENTS.md` | Rules the agent reads before touching code. |
| `LESSONS.md` | Durable project memory for recurring mistakes and gotchas. |
| `CHANGELOG.md` | Record of completed user-visible changes. |

`CLAUDE.md` acts as a bridge for Claude Code by importing `AGENTS.md`.

## Key docs

- [Context Discipline](context-discipline.md)
- [Safety Rules](safety-rules.md)
- [Lessons System](lessons-system.md)
- [Compatibility](compatibility.md)
- [Migration Guide](migration.md)

## Positioning

Unlike large agent harnesses, this repo is intentionally small. Copy the rules, customize them, and keep your coding agents safer and more consistent.
