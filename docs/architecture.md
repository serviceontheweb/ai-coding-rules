# Architecture

This repository is organized as a small governance framework for AI coding
agents.

## Core + Extensions

`core/` contains the shared operating contract:

- `AGENTS.md` - baseline agent rules.
- `SAFETY.md` - approval gates and protected data.
- `CONTEXT.md` - bounded inspection patterns.
- `MEMORY.md` - lessons, changelog, and decision records.
- `WORKFLOWS.md` - common session workflows.

Extensions adapt the core without duplicating it:

- `skills/` - task-specific execution patterns.
- `templates/` - project starter instructions.
- `adapters/` - tool-specific setup notes.
- `policies/` - machine-readable policy examples.
- `memory/` - reusable memory templates.

## Design Rules

- Keep documents short and focused.
- Put shared rules in `core/`.
- Put task behavior in `skills/`.
- Put tool behavior in `adapters/`.
- Put project starter material in `templates/`.
- Use public, generic examples only.
