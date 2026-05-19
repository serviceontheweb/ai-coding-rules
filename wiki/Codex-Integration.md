# Codex Integration

Codex can use `AGENTS.md` as the project operating contract.

## Recommended Setup

1. Copy `core/AGENTS.md` to the project root as `AGENTS.md`.
2. Add project-specific facts below the core rules.
3. Copy memory templates only when useful.
4. Keep tool configuration separate from project rules.

## Config Example

Use:

```text
adapters/codex/config.example.toml
```

The example keeps network access disabled by default:

```toml
[sandbox_workspace_write]
network_access = false
```

## Related Pages

- [Tool Adapters](Tool-Adapters)
- [Context Discipline](Context-Discipline)
- [Safety Rules](Safety-Rules)
