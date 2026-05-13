# Compatibility

`ai-coding-rules` is tool-neutral, but each coding assistant loads instructions differently. Use the smallest adapter that matches your workflow.

## Recommended mapping

| Tool | Primary file | Extra files | Notes |
|---|---|---|---|
| OpenAI Codex | `AGENTS.md` | `~/.codex/config.toml` or repo config | Use `AGENTS.md` as the shared project contract. |
| Claude Code | `CLAUDE.md` | `.claude/rules/*.md`, skills, hooks | `CLAUDE.md` should import `AGENTS.md` using `@AGENTS.md`. |
| GitHub Copilot | `.github/copilot-instructions.md` | `.github/instructions/*.instructions.md`, `AGENTS.md` | Combine repository-wide, path-specific, and agent instructions. |
| Cursor | Tool-specific project rules | `AGENTS.md` content copied or imported | Keep rules short and project-specific. |
| Windsurf | Tool-specific project rules | `AGENTS.md` content copied or imported | Keep rules short and project-specific. |
| Aider | Convention file | `AGENTS.md` content copied into conventions | Use context discipline and safety sections. |
| Gemini / Jules | `AGENTS.md` or tool-specific memory | Tool-specific docs | Keep root rules concise. |

## Claude Code

Use `CLAUDE.md` at the project root:

```md
@AGENTS.md

## Claude Code notes

Use AGENTS.md as the project operating contract.
```

For larger projects, use `.claude/rules/` for topic-specific or path-scoped rules.

Example:

```text
.claude/
  rules/
    backend.md
    frontend.md
    security.md
```

## GitHub Copilot

Use all three layers when useful:

```text
.github/
  copilot-instructions.md
  instructions/
    backend.instructions.md
    frontend.instructions.md
AGENTS.md
```

Use repository-wide instructions for universal rules. Use path-specific files for stack-specific guidance. Use `AGENTS.md` for agent behavior and safety expectations.

## Codex

Use `AGENTS.md` as the root instruction file. Keep project-specific facts in the project root and reusable global rules in your personal config area.

Suggested safe defaults:

```toml
approval_policy = "on-request"
sandbox_mode = "workspace-write"

[sandbox_workspace_write]
network_access = false
```

Enable network access only when the task needs it.

## Compatibility policy for this repo

Do not claim universal native support unless the tool documentation confirms it.

Preferred wording:

> Compatible via `AGENTS.md`, `CLAUDE.md`, `.github/copilot-instructions.md`, or tool-specific adapters.

Avoid wording like:

> Every tool auto-reads `AGENTS.md` natively.

That statement is too broad and will become inaccurate as tools change.
