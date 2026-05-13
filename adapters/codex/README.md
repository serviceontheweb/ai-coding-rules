# Codex Adapter

Use `AGENTS.md` as the root project instruction file.

## Safe default config

Suggested default:

```toml
approval_policy = "on-request"
sandbox_mode = "workspace-write"

[sandbox_workspace_write]
network_access = false
```

Turn on network access only for tasks that need package downloads, external research, or remote APIs.

## Session rules

- Read `AGENTS.md` first.
- Read `LESSONS.md` before changes.
- Use bounded command output.
- Ask before destructive or production actions.
- Run validation before completion.
