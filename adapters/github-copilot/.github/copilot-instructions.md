# GitHub Copilot Repository Instructions

Use these instructions for all work in this repository.

## Operating principles

- Follow `AGENTS.md` when performing agentic coding work.
- Make the smallest safe change that solves the task.
- Preserve existing project patterns.
- Do not rewrite unrelated code.
- Do not claim validation passed unless it actually passed.

## Safety

Do not expose secrets, credentials, private keys, `.env` values, production
config, or customer data.

Ask before suggesting or performing:

- destructive commands;
- production deployments;
- production database changes;
- force-pushes or history rewrites;
- dependency changes with runtime impact.

## Context discipline

Prefer bounded inspection:

```bash
rg -n -m 20 "term" src/ 2>&1 | head -c 4000
git diff -- path/to/file 2>&1 | head -c 6000
```

Avoid broad, unbounded output.

## Validation

Recommend targeted validation for medium-risk changes and broader validation for
high-risk changes.

## Documentation

When changing behavior, update docs, `LESSONS.md`, or `CHANGELOG.md` only when
appropriate.
