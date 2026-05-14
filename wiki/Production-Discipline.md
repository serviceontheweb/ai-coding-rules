# Production Discipline

Production discipline keeps the repository, running behavior, schema history, and agent status reports aligned. These rules are written for public reuse and avoid environment-specific details.

## Rule packs

- **Deployment Integrity**: keep deployed code, process definitions, and version control aligned before new work builds on a running system.
- **Schema Discipline**: require schema changes to be represented by ordered, committed migrations instead of undocumented startup logic or manual edits.
- **Status Truthfulness**: require completion, validation, deployment, and progress claims to match evidence.
- **No Phantom References**: require referenced routes, data objects, processes, imports, and dependencies to exist or be removed.

## Seeded lesson

`templates/LESSONS-seeded.md` provides a sanitized starter lesson about deployment drift. It can be copied into a project lesson file when teams need a public-safe reminder that deployed code must remain recoverable from version control.

## Applying the packs

1. Copy the relevant rule files into the target repository.
2. Reference them from the target repository's `AGENTS.md`.
3. Add the seeded lesson only when the project needs that durable reminder.
4. Keep all project-specific hostnames, paths, customer names, credentials, and infrastructure details out of shared rule packs.
