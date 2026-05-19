# Claude Code Adapter

Claude Code commonly uses `CLAUDE.md`, while this framework uses `AGENTS.md` as
the portable source of truth.

## Setup

1. Copy `core/AGENTS.md` to the project root as `AGENTS.md`.
2. Add a short `CLAUDE.md` that imports or points to `AGENTS.md`.
3. Put project-specific facts in `AGENTS.md`, not in multiple tool files.

## Example `CLAUDE.md`

```md
# Claude Code Instructions

Follow the repository instructions in `AGENTS.md`.
```

## Reference

- [AGENTS.md Standards](https://github.com/serviceontheweb/ai-coding-rules/wiki/AGENTS.md-Standards)
- [Claude Code Integration](https://github.com/serviceontheweb/ai-coding-rules/wiki/Claude-Code-Integration)
