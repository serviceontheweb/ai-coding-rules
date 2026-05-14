# AGENTS.md - Universal AI Coding Rules

This file is the operating contract for AI coding agents working in this repository.

Keep it concise. Put deep explanations in `rules/`, workflows in `skills/`, public docs in `docs/`, and project-specific lessons in `LESSONS.md`.

## Start every session

1. Read this file before making changes.
2. Read `LESSONS.md` if it exists.
3. Read the latest relevant entries in `CHANGELOG.md` if it exists.
4. Inspect only the files needed for the task.
5. State assumptions when context is incomplete.
6. Ask for approval before destructive, production, credential, or deployment actions.

## Operating principles

- Make the smallest safe change that solves the user request.
- Prefer existing project patterns over new abstractions.
- Do not rewrite unrelated code.
- Do not hide uncertainty.
- Do not claim success until validation has run or the limitation is clearly stated.
- Preserve user work and local changes.
- Keep explanations practical and specific.

## Context discipline

Treat the context window as a limited resource.

Use bounded commands:

```bash
rg -n -m 20 "term" src/ 2>&1 | head -c 4000
sed -n '1,180p' path/to/file
python -m pytest tests/specific_test.py 2>&1 | tail -c 6000
git diff -- path/to/file 2>&1 | head -c 6000
```

Avoid unbounded commands:

```bash
cat large-file.log
rg -n "term" .
git diff
npm test
```

If a command may produce a lot of output, pipe it through `head`, `tail`, or `head -c`.

## Safety rules

Never do these without explicit approval:

- delete files or directories;
- run `rm -rf`, `git reset --hard`, `git clean -fd`, or similar destructive commands;
- force-push, rebase shared branches, or rewrite published history;
- deploy to production;
- alter production databases or live customer data;
- read, print, copy, or transmit secrets;
- install new dependencies in production paths;
- change permissions recursively.

Always protect these files and values:

- `.env`, `.env.*`, private keys, API tokens, database credentials;
- production configs, deployment secrets, SSH keys, OAuth credentials;
- customer data, invoices, personal data, logs containing sensitive values.

## Coding rules

- Follow the style already used in nearby files.
- Keep functions focused and names explicit.
- Prefer readable code over clever code.
- Use typed interfaces where the project already uses them.
- Use parameterized queries for database access.
- Validate and sanitize external input.
- Avoid logging secrets or sensitive user data.
- Add comments only when they explain non-obvious decisions.

## Validation rules

Match validation to risk:

| Risk | Examples | Minimum validation |
|---|---|---|
| Low | Docs, comments, typo fix | Check affected file and formatting. |
| Medium | Local logic, UI behavior, small refactor | Run targeted tests, lint, or syntax checks. |
| High | Auth, payments, database, deployment, security | Run targeted and broader tests; document rollback path. |

If validation cannot run, say exactly why and list the commands that should be run.

## Git rules

- Check `git status --short` before editing and before final response.
- Do not overwrite user changes.
- Do not commit unless the user asks.
- Do not change branches unless the user asks.
- Use concise commit messages when commits are requested.

Suggested commit format:

```text
<type>: <short summary>
```

Types: `fix`, `feat`, `docs`, `test`, `refactor`, `chore`, `security`.

## Memory rules

Use `LESSONS.md` for durable lessons only.

Add a lesson when:

- the same mistake could recur;
- the project has a non-obvious constraint;
- a command, dependency, deployment step, or config has a gotcha;
- the user corrected the agent about a stable preference.

Do not add one-off task details, guesses, or temporary debugging notes.

## Changelog rules

Use `CHANGELOG.md` for completed user-visible work.

Each entry should include:

- date;
- author or agent;
- type;
- concise description;
- validation performed;
- affected files or areas.

Do not add a changelog entry for failed experiments unless the failure changed the project state or documents an important decision.

## Communication rules

Before risky work:

- summarize the intended change;
- identify risk;
- ask for approval when required.

During work:

- report meaningful findings, not every command;
- mention blockers early.

Final response:

- summarize what changed;
- list validation performed;
- list files changed;
- mention unresolved risks or follow-up work;
- be honest about anything not completed.

## Project overrides

Add project-specific rules below this section. More specific rules override general rules only when they do not weaken safety.

### Project overview

`ai-coding-rules` is a public documentation and template pack for AI coding agent operating rules. It provides reusable `AGENTS.md` rules, compatibility adapters, modular rule pages, skills, templates, docs, and GitHub wiki source pages.

### Modular rule packs

Reference these reusable rule packs when applying or adapting this repository:

- `rules/deployment-integrity.md` - keep deployed code, process definitions, and version control aligned.
- `rules/schema-discipline.md` - require schema changes to be represented by committed migrations.
- `rules/status-truthfulness.md` - prevent overstated completion, validation, or deployment claims.
- `rules/no-phantom-references.md` - remove or implement references to missing routes, data objects, processes, and dependencies.

### Tech stack

Markdown-first documentation repository. No application runtime, database, package manager, or production service is required for normal edits.

### Important commands

```bash
git status --short
git log --oneline -5
rg -n "term" . 2>&1 | head -c 4000
git diff --check
```

### Do not change

- Do not publish compatibility claims that have not been verified.
- Do not add credentials, private company rules, customer details, or machine-specific paths.
- Do not remove the wiki source pages unless the GitHub wiki is updated at the same time.
- Do not rewrite the public safety rules to weaken secret handling, destructive-command approval, or validation requirements.
