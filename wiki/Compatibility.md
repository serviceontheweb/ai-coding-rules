# Compatibility

`ai-coding-rules` works best when each tool gets the file format it expects.

| Tool | Recommended file |
|---|---|
| Codex | `AGENTS.md` |
| Claude Code | `CLAUDE.md` importing `AGENTS.md` |
| GitHub Copilot | `.github/copilot-instructions.md`, `.github/instructions/*.instructions.md`, `AGENTS.md` |
| Cursor | Tool-specific project rules using `AGENTS.md` content |
| Windsurf | Tool-specific project rules using `AGENTS.md` content |
| Aider | Convention file using `AGENTS.md` content |
| Gemini / Jules | `AGENTS.md` or tool-specific memory |

## Rule

Do not claim every tool auto-reads `AGENTS.md`. Use precise compatibility wording and adapters.
