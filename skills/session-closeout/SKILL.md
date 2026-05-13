---
name: session-closeout
description: Use when finishing a coding session to summarize changes, validation, risks, lessons, and changelog entries.
---

# Session Closeout

## Goal

Finish work with a clear, honest record.

## Steps

1. Check `git status --short`.
2. Review changed files with bounded diff output.
3. Confirm validation status.
4. Update `LESSONS.md` only for durable reusable lessons.
5. Update `CHANGELOG.md` only for completed user-visible changes.
6. Summarize unresolved risks.

## Output format

```text
Changed:
- ...
Validation:
- ...
Lessons updated:
- yes/no
Changelog updated:
- yes/no
Risks:
- ...
Files:
- ...
```

