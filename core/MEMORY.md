# Memory

Use memory files to preserve durable project knowledge without turning them into
session logs.

## `LESSONS.md`

Record reusable lessons only.

Add a lesson when:

- the same mistake could recur;
- the project has a non-obvious constraint;
- a command, dependency, deployment step, or config has a gotcha;
- a user corrects a stable preference.

Do not add one-off debugging notes, guesses, temporary plans, or private
details.

## `CHANGELOG.md`

Record completed user-visible work.

Each entry should include:

- date;
- author or agent;
- type;
- concise description;
- validation performed;
- affected files or areas.

Do not claim work is done unless the repository contains evidence and validation
status is clear.

## Architecture Decisions

Use a short architecture decision record when a decision changes long-term
project structure, interfaces, storage, deployment, or workflow.
