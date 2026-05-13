# Cursor Adapter

Use this adapter when a project uses Cursor.

## Recommended approach

- Keep `AGENTS.md` as the source of truth.
- Copy the concise operating rules into Cursor's project rules format if needed.
- Keep tool-specific Cursor rules short.
- Put long project lessons in `LESSONS.md`, not in always-loaded rules.

## Suggested Cursor rule content

```md
Follow AGENTS.md for repository rules, safety requirements, validation, context discipline, LESSONS.md, and CHANGELOG.md.

Before editing, inspect only relevant files. Use bounded command output. Ask before destructive, production, credential, or deployment actions.
```
