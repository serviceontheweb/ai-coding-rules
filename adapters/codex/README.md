# Codex Adapter

Codex reads `AGENTS.md` as the project operating contract.

## Setup

1. Copy `core/AGENTS.md` to the project root as `AGENTS.md`.
2. Add project-specific facts below the core rules.
3. Add `LESSONS.md` and `CHANGELOG.md` from `memory/` templates when useful.
4. Add skills only when the project benefits from reusable workflows.

## Safe Default Config

Example local configuration lives at `adapters/codex/config.example.toml`:

```toml
approval_policy = "on-request"
sandbox_mode = "workspace-write"

[sandbox_workspace_write]
network_access = false
```

Turn on network access only for tasks that need package downloads, external
research, or remote APIs.

## Notes

- Keep root instructions concise.
- Use `core/CONTEXT.md` for bounded inspection patterns.
- Use `policies/*.yaml` as examples for future machine-readable checks.
- See the wiki pages for
  [AGENTS.md Standards](https://github.com/serviceontheweb/ai-coding-rules/wiki/AGENTS.md-Standards)
  and
  [Codex Integration](https://github.com/serviceontheweb/ai-coding-rules/wiki/Codex-Integration).
