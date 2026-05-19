# Quickstart

## 1. Add the Core Contract

Copy `core/AGENTS.md` into your project root:

```bash
cp core/AGENTS.md /path/to/project/AGENTS.md
```

Add a short project-specific section with stack, commands, and constraints.

## 2. Add Memory Files

Use the templates when useful:

```bash
cp memory/lessons-template.md /path/to/project/LESSONS.md
cp templates/CHANGELOG-template.md /path/to/project/CHANGELOG.md
```

## 3. Pick Adapters

Use only the adapters for tools your project actually uses:

- `adapters/codex/`
- `adapters/claude-code/`
- `adapters/cursor/`
- `adapters/copilot/`
- `adapters/aider/`

## 4. Add Skills Selectively

Copy skills only when they match recurring work. Keep them short and
project-neutral.

## 5. Validate

Check that final project instructions:

- do not include secrets or private operational details;
- name real commands only;
- preserve approval gates for destructive and production work;
- explain how validation should be reported.
