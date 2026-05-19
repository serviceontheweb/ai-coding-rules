# GitHub Copilot Adapter

GitHub Copilot can use repository-wide and path-specific instruction files alongside `AGENTS.md`.

## Setup

1. Copy `core/AGENTS.md` to the project root as `AGENTS.md`.
2. Add `.github/copilot-instructions.md` with a short pointer to `AGENTS.md`.
3. Add `.github/instructions/*.instructions.md` only for path-specific rules.

## Suggested Repository Instruction

```md
Follow the repository's `AGENTS.md` instructions. Keep changes scoped, protect secrets, ask before destructive or production actions, and report validation honestly.
```
