# Lessons System

`LESSONS.md` is persistent project memory. It prevents agents and humans from repeating the same mistakes.

## What belongs in LESSONS.md

Add a lesson when the information is durable and reusable:

- a repeated bug pattern;
- a non-obvious project constraint;
- a fragile deployment step;
- a test command gotcha;
- a dependency conflict;
- a user preference that should persist;
- a file or workflow that must not be touched casually.

## What does not belong

Do not add:

- temporary debugging notes;
- guesses;
- one-off task summaries;
- private information;
- secrets;
- vague comments like "be careful".

## Entry format

```md
### YYYY-MM-DD - Short lesson title

**Context:** Where this applies.
**What happened:** What went wrong or what was discovered.
**Root cause:** Why it happened.
**Lesson:** The durable rule to remember.
**Action:** What agents should do differently next time.
**Related files:** Optional list of files or directories.
```

## Example

```md
### 2026-05-13 - Do not rebuild dashboard CSS from stale bundle sources

**Context:** Dashboard styles in `public/css/dashboard/`.
**What happened:** Running the CSS bundle command overwrote newer manual fixes.
**Root cause:** The bundle source files were stale and not the current source of truth.
**Lesson:** Do not run the dashboard CSS bundler until the source map is fixed.
**Action:** Edit individual dashboard CSS files and use cache-busting query strings.
**Related files:** `public/css/dashboard/`, `views/dashboard/`.
```

## Read order

Agents should read:

1. `AGENTS.md`;
2. `LESSONS.md`;
3. relevant recent `CHANGELOG.md` entries;
4. task-specific files.

## Maintenance

Review `LESSONS.md` periodically. Remove or archive lessons that are no longer true. Update lessons when the underlying project changes.
