# ai-coding-rules

Lightweight, tool-neutral governance files for AI coding agents.

This repository provides a small Core + Extensions framework for keeping AI-assisted engineering work safe, scoped, reviewable, and reusable across tools.

It is not an agent runtime or a deployment system. It is a set of concise Markdown and YAML files you can copy into a project and adapt.

## Structure

```text
core/       Shared operating contract
skills/     Small task-specific workflows
templates/  Starter instructions for common project types
adapters/   Tool-specific setup notes
policies/   Machine-readable policy examples
memory/     Lessons and decision templates
docs/       Public documentation
```

Legacy root files and older docs remain as compatibility entry points where useful.

## Quick start

Copy the core contract into a project:

```bash
cp core/AGENTS.md /path/to/project/AGENTS.md
cp memory/lessons-template.md /path/to/project/LESSONS.md
cp templates/CHANGELOG-template.md /path/to/project/CHANGELOG.md
```

Then add only the project-specific facts the agent needs: stack, commands, validation, deployment constraints, and local safety notes.

## Core

- `core/AGENTS.md` - baseline operating contract.
- `core/SAFETY.md` - approval gates and protected data.
- `core/CONTEXT.md` - bounded inspection patterns.
- `core/MEMORY.md` - lessons, changelog, and decision record usage.
- `core/WORKFLOWS.md` - common session workflows.

## Extensions

- `skills/` contains modular workflows such as safety checks, context discipline, brainstorming, TDD, and code review.
- `templates/` contains starter `AGENTS.md` notes for common project types.
- `adapters/` contains setup notes for Codex, Claude Code, Cursor, GitHub Copilot, and Aider.
- `policies/` contains generic YAML examples for approval gates, safety, and deployment integrity.
- `memory/` contains reusable templates for lessons, decisions, and anti-patterns.

## Compatibility

| Tool | Recommended file | Notes |
|---|---|---|
| Codex | `AGENTS.md` | Use `adapters/codex/`. |
| Claude Code | `CLAUDE.md` plus `AGENTS.md` | Use `adapters/claude-code/`. |
| GitHub Copilot | `.github/copilot-instructions.md` plus `AGENTS.md` | Use `adapters/copilot/`. |
| Cursor | Project rule plus `AGENTS.md` | Use `adapters/cursor/`. |
| Aider | Project convention plus `AGENTS.md` | Use `adapters/aider/`. |

## Public Repo Standard

Keep examples generic and reusable. Do not include private organization names, proprietary flows, credentials, environment details, or non-public delivery details.

## Docs

Start with `docs/quickstart.md` and `docs/architecture.md`.

## License

MIT. Use, fork, adapt, and share.
