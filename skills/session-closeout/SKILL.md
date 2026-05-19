---
name: session-closeout
description: Use when finishing a coding session to summarize changes, validation, risks, lessons, and changelog entries.
---

# Session Closeout

## Purpose

Finish work with a clear, honest record.

## Triggers

- User request is complete.
- Work is paused with partial changes.
- Before committing, handing off, or final response.

## Checklist

- Check repository status.
- Review changed files.
- Confirm validation status.
- Update lessons only for durable knowledge.
- Update changelog only for completed user-visible work.
- Report unresolved risks.

## Execution Pattern

1. Check `git status --short`.
2. Review changed files with bounded diff output.
3. Confirm validation status.
4. Update `LESSONS.md` only for durable reusable lessons.
5. Update `CHANGELOG.md` only for completed user-visible changes.
6. Summarize unresolved risks.

## Escalation Conditions

- The working tree includes unrelated user changes that conflict with the task.
- Validation cannot run for a high-risk change.
- A status file would claim work is complete without evidence.
