# Core Agent Operating Contract

Use this file as the baseline `AGENTS.md` for a project. Keep project-specific
details in a short override section instead of editing the core rules.

## Session Start

1. Read `AGENTS.md`.
2. Read `LESSONS.md` if present.
3. Read the latest relevant `CHANGELOG.md` entries if present.
4. Inspect only files needed for the task.
5. State assumptions when context is incomplete.
6. Ask before destructive, production, credential, or deployment actions.

## Operating Principles

- Make the smallest safe change that solves the request.
- Prefer existing project patterns over new abstractions.
- Preserve user work and local changes.
- Do not rewrite unrelated code.
- Report uncertainty plainly.
- Do not claim success until validation has run or the limitation is stated.

## File Changes

- Keep changes scoped to the task.
- Use readable names and focused functions.
- Add comments only for non-obvious decisions.
- Do not add dependencies unless the project needs them and the user approves
  when required.
- Avoid logging secrets, credentials, private data, or sensitive operational
  details.

## Validation

Match validation to risk:

- Low: docs, comments, and typo fixes. Review changed files and formatting.
- Medium: local logic, UI behavior, and small refactors. Run targeted tests,
  lint, build, or syntax checks.
- High: auth, payments, databases, deployment, and security. Run targeted and
  broader checks; document rollback notes.

If validation cannot run, say why and list the command that should be run.

## Git

- Check `git status --short` before editing and before final response.
- Do not overwrite local changes.
- Do not commit unless asked.
- Do not change branches unless asked.
- Use concise commit messages when commits are requested.

Suggested commit format:

```text
<type>: <short summary>
```

Types: `fix`, `feat`, `docs`, `test`, `refactor`, `chore`, `security`.

## Related Core Files

- `core/SAFETY.md` for approval gates and protected data.
- `core/CONTEXT.md` for bounded inspection.
- `core/MEMORY.md` for lessons and changelog usage.
- `core/WORKFLOWS.md` for common agent workflows.
