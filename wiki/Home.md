# ai-coding-rules Wiki

Welcome to the `ai-coding-rules` wiki.

This project provides lightweight, tool-neutral rules for AI coding agents. It helps repositories define:

- safe agent behavior;
- context-discipline patterns;
- validation expectations;
- persistent lessons;
- changelog hygiene;
- tool-specific adapters.

## Start here

- [Getting Started](Getting-Started)
- [Compatibility](Compatibility)
- [Context Discipline](Context-Discipline)
- [Safety Rules](Safety-Rules)
- [Lessons System](Lessons-System)
- [Publishing Guide](Publishing-Guide)

## Core files

| File | Purpose |
|---|---|
| `AGENTS.md` | Universal operating contract for coding agents. |
| `CLAUDE.md` | Claude Code bridge that imports `AGENTS.md`. |
| `LESSONS.md` | Durable project memory. |
| `CHANGELOG.md` | Completed work record. |

## Recommended setup

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
