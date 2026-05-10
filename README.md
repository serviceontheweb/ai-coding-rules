# AGENTS.md — Master Rules for AI Coding Agents

> A battle-tested, universal AGENTS.md file for guiding AI coding agents. Works with **Codex, Claude Code, Cursor, Copilot, Windsurf, Aider**, and any tool that supports the AGENTS.md standard.

## The Problem

Every time you start a new AI coding session, the agent has **zero memory**. It doesn't know your project structure, coding rules, past bugs, or what was already tried. This wastes tokens, time, and causes the same mistakes to repeat endlessly.

## The Solution

Drop `AGENTS.md` into your project root. The agent reads it automatically before every session. Combined with `LESSONS.md` (persistent mistake log) and `CHANGELOG.md` (track record), your AI coding agent now has **long-term memory**.

## What This Covers

| Section | What It Does |
|---------|-------------|
| **Operating Principles** | Keep changes minimal, follow existing patterns |
| **Context Discipline** | Byte-cap command output, scope searches, protect the context window |
| **Safety Rules** | Never delete files, never commit secrets, always backup first |
| **Code Style** | Language-specific defaults (Python, JS, PHP, SQL, CSS) |
| **Git Practices** | Commit format, branching rules |
| **Validation** | Match validation effort to risk level |
| **Deployment** | Test first, exclude configs, fix permissions |
| **Subagents** | When and how to use sub-agents effectively |
| **Communication** | What to report before, during, and after work |
| **LESSONS.md** | Persistent mistake memory — never repeat a documented failure |
| **CHANGELOG.md** | Track record of all changes by all agents |

## Quick Start

### Option 1: Global (applies to all projects)

```bash
mkdir -p ~/.codex
cp AGENTS.md ~/.codex/AGENTS.md
```

Every Codex session reads this automatically.

### Option 2: Per-project (project-specific rules)

```bash
cp AGENTS.md /path/to/your/project/AGENTS.md
touch /path/to/your/project/LESSONS.md
touch /path/to/your/project/CHANGELOG.md
```

### Option 3: Both (recommended)

Use the global file for universal rules. Add a project-specific `AGENTS.md` in each repo root for stack-specific context, commands, and known issues. Project rules override global rules when they conflict.

```
~/.codex/
├── AGENTS.md          ← Global rules (this file)
└── config.toml        ← Agent config

~/your-project/
├── AGENTS.md          ← Project-specific overrides
├── LESSONS.md         ← Accumulated lessons (grows over time)
├── CHANGELOG.md       ← What was changed, when, by whom
└── README.md          ← For humans
```

## The Three-File System

### AGENTS.md — The Rulebook
What the agent must know before touching any code. Coding standards, safety rules, validation requirements, communication format.

### LESSONS.md — The Mistake Log
Append-only log of things that went wrong and what was learned. The agent reads this before every session and never repeats a documented mistake.

```markdown
### 2026-05-09 — CSS Bundling Broke the UI
**What happened:** Bundled CSS files into a single minified file. Broke the entire dashboard.
**Root cause:** Bundle was built from outdated source files, overwriting recent improvements.
**Lesson:** Never bundle CSS in this project. Use individual files with ?v= cache busting.
**Action:** Added as permanent rule in AGENTS.md.
```

### CHANGELOG.md — The Track Record
Who did what, when. Essential for multi-agent workflows where Codex, Claude, Cursor, and humans all contribute.

```markdown
| Date | Author | Type | Description |
|------|--------|------|-------------|
| 2026-05-09 | Codex | fix | Repaired POS submit button visibility |
| 2026-05-09 | Claude | perf | Added database indexes to sales table |
| 2026-05-10 | Human | chore | Updated SSL certificate |
```

## Key Innovation: Context Discipline

The biggest token waste in AI coding comes from unbounded command output flooding the context window. This AGENTS.md enforces **byte-capped output** on every command:

```bash
# BAD — dumps entire file/output into context
cat large_file.py
rg -n "term" .
git diff
npm test

# GOOD — bounded, focused
head -100 large_file.py
rg -n -m 20 "term" src/ 2>&1 | head -c 4000
git diff -- specific/file.py 2>&1 | head -c 6000
npm test 2>&1 | tail -c 4000
```

This single pattern can **reduce token usage by 50%** across sessions.

## Codex Configuration

```toml
# ~/.codex/config.toml
project_doc_fallback_filenames = ["CLAUDE.md", "AGENTS.md", ".agents.md"]
project_doc_max_bytes = 65536
```

## Project-Specific AGENTS.md Template

For each project, create a repo-level `AGENTS.md` with project-specific context:

```markdown
# [Project Name] — AGENTS.md

## Overview
[What this project is, one paragraph]

## Tech Stack
[Language, framework, database, hosting]

## Directory Structure
[Key directories and what they contain]

## Commands
[Build, test, lint, deploy — exact syntax]

## Known Issues
[Gotchas that will trip you up]

## DO NOT
[Project-specific prohibitions]

## Read LESSONS.md before starting work.
```

## Compatibility

| Tool | Support | How It's Read |
|------|---------|---------------|
| OpenAI Codex | ✅ Native | Auto-reads from repo root and ~/.codex/ |
| Claude Code | ✅ Native | Auto-reads as CLAUDE.md or AGENTS.md |
| GitHub Copilot | ✅ Native | Server-side processing since Aug 2025 |
| Cursor | ✅ Native | Auto-detects at project root |
| Windsurf | ✅ Native | Supports AGENTS.md format |
| Aider | ✅ Compatible | Via conventions file |
| Google Jules/Gemini | ✅ Native | Supports AGENTS.md |
| Any other agent | 📋 Manual | Paste content into system prompt or first message |

## Credits & References

- [AGENTS.md Official Spec](https://github.com/agentsmd/agents.md) — The open standard
- [Austin1serb/agents-md](https://github.com/Austin1serb/agents-md) — Context discipline patterns (byte-capping, token efficiency)
- [Awesome AGENTS.md](https://github.com/Ischca/awesome-agents-md) — Curated list of templates and examples
- [GitHub Blog: Lessons from 2,500 repos](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/) — What works and what doesn't
- [Official Codex Best Practices](https://developers.openai.com/codex/learn/best-practices) — OpenAI's guidance
- [Official AGENTS.md Guide](https://developers.openai.com/codex/guides/agents-md) — Setup and cascading rules

## Contributing

Contributions welcome. This is a living document — if you've learned a lesson the hard way that should be in here, open a PR.

## License

MIT — Use it, fork it, adapt it, share it.
