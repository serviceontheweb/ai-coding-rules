# Getting Started

Add the core files to your project:

```bash
cp AGENTS.md /path/to/project/AGENTS.md
cp CLAUDE.md /path/to/project/CLAUDE.md
cp templates/LESSONS-template.md /path/to/project/LESSONS.md
cp templates/CHANGELOG-template.md /path/to/project/CHANGELOG.md
```

Then customize `AGENTS.md` with:

- project overview;
- tech stack;
- important commands;
- known issues;
- deployment constraints;
- files agents must not touch without approval.

## Claude Code

Add `CLAUDE.md`:

```md
@AGENTS.md

## Claude Code notes

Use AGENTS.md as the project operating contract.
```

## GitHub Copilot

Add:

```text
.github/copilot-instructions.md
.github/instructions/backend.instructions.md
.github/instructions/frontend.instructions.md
```

## First agent prompt for a project

```text
Read AGENTS.md, LESSONS.md, and CHANGELOG.md. Inspect only the files needed for this task. Use bounded command output. Before risky changes, propose a short plan and ask for approval.
```
