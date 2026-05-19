# AGENTS.md - Repository Instructions

This file is the operating contract for AI coding agents working in this
repository.

This repository is being refactored around `core/` plus focused extensions. Keep
new public material generic, concise, and reusable.

## Start every session

1. Read this file before making changes.
2. Read `LESSONS.md` if it exists.
3. Read the latest relevant entries in `CHANGELOG.md` if it exists.
4. Inspect only the files needed for the task.
5. State assumptions when context is incomplete.
6. Ask for approval before destructive, production, credential, or deployment
   actions.

## Operating principles

- Make the smallest safe change that solves the user request.
- Prefer existing project patterns over new abstractions.
- Do not rewrite unrelated code.
- Do not hide uncertainty.
- Do not claim success until validation has run or the limitation is clearly
  stated.
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

If a command may produce a lot of output, pipe it through `head`, `tail`, or
`head -c`.

## Safety rules

Never do these without explicit approval:

- delete files or directories;
- run `rm -rf`, `git reset --hard`, `git clean -fd`, or similar destructive
  commands;
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

- Low: docs, comments, and typo fixes. Check the affected file and formatting.
- Medium: local logic, UI behavior, and small refactors. Run targeted tests,
  lint, or syntax checks.
- High: auth, payments, databases, deployment, and security. Run targeted and
  broader tests; document rollback path.

If validation cannot run, say exactly why and list the commands that should be
run.

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

Do not add a changelog entry for failed experiments unless the failure changed
the project state or documents an important decision.

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

Add project-specific rules below this section. More specific rules override
general rules only when they do not weaken safety.

### Project overview

`ai-coding-rules` is a public documentation and template pack for AI coding
agent governance. It provides reusable core rules, skills, templates, tool
adapters, memory templates, and machine-readable policy examples.

### Canonical architecture

- `core/` - shared operating contract.
- `skills/` - short modular workflows.
- `templates/` - starter instructions for project types.
- `adapters/` - tool-specific setup notes.
- `policies/` - generic YAML policy examples.
- `memory/` - reusable lessons and decision templates.
- `docs/` - public documentation.

Legacy files may remain as compatibility pointers, but new duplicated long-form
content should not be added.

### Tech stack

Markdown-first documentation repository. No application runtime, database,
package manager, or production service is required for normal edits.

### Important commands

```bash
git status --short
git log --oneline -5
rg -n "term" . 2>&1 | head -c 4000
git diff --check
```

### Do not change

- Do not publish compatibility claims that have not been verified.
- Do not add credentials, private company rules, customer details, or
  machine-specific paths.
- Do not rewrite the public safety rules to weaken secret handling,
  destructive-command approval, or validation requirements.
