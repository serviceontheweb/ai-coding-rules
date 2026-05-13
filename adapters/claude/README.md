# Claude Code Adapter

Use this adapter when a project uses Claude Code.

## Required file

Create `CLAUDE.md` at the project root:

```md
@AGENTS.md

## Claude Code notes

Use AGENTS.md as the project operating contract.
```

Claude-specific guidance can be added below the import.

## Modular rules

For larger projects, add `.claude/rules/`:

```text
.claude/
  rules/
    backend.md
    frontend.md
    security.md
    testing.md
```

Use path-scoped rules when only part of the repo needs extra instructions.

## Memory discipline

Keep `CLAUDE.md` concise. Put long workflows in skills and durable project gotchas in `LESSONS.md`.
