# GitHub Copilot Adapter

Use this adapter for GitHub Copilot Chat, Copilot coding agent, and Copilot code review workflows.

## Files

```text
.github/
  copilot-instructions.md
  instructions/
    backend.instructions.md
    frontend.instructions.md
AGENTS.md
```

## Repository-wide instructions

Use `.github/copilot-instructions.md` for universal repository guidance.

## Path-specific instructions

Use `.github/instructions/*.instructions.md` for stack-specific rules.

## Agent instructions

Use `AGENTS.md` for agent behavior, safety, validation, and memory rules.
