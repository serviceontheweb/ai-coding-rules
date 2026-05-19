# Cursor Adapter

Cursor can reference the same project contract used by other agents.

## Setup

1. Copy `core/AGENTS.md` to the project root as `AGENTS.md`.
2. Add a Cursor project rule that points to `AGENTS.md`.
3. Keep tool-specific notes short.

## Suggested Rule

```md
Follow AGENTS.md. Keep changes scoped, inspect context with bounded output,
protect secrets, ask before destructive or production actions, and report
validation honestly.
```

## Reference

- [AGENTS.md Standards](https://github.com/serviceontheweb/ai-coding-rules/wiki/AGENTS.md-Standards)
- [Cursor Integration](https://github.com/serviceontheweb/ai-coding-rules/wiki/Cursor-Integration)
