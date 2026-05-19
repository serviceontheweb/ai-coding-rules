# Cursor Integration

Cursor can point project rules at the same `AGENTS.md` contract used by other
tools.

## Recommended Setup

1. Copy `core/AGENTS.md` to the project root as `AGENTS.md`.
2. Add a Cursor project rule that references `AGENTS.md`.
3. Keep Cursor-specific rules short and operational.

## Suggested Rule

```text
Follow AGENTS.md. Keep changes scoped, protect secrets, ask before destructive
or production-impacting actions, and report validation honestly.
```

## Related Pages

- [Tool Adapters](Tool-Adapters)
- [AGENTS.md Standards](AGENTS.md-Standards)
