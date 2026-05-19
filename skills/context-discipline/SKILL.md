---
name: context-discipline
description:
  Use before inspecting a large repository, broad search result, large diff, or
  long command output.
---

# Context Discipline

## Purpose

Find enough evidence to act without flooding the context window.

## Triggers

- New or unfamiliar repository.
- Broad search request.
- Large logs, diffs, generated files, or test output.
- Any command likely to produce more than a few screens of text.

## Checklist

- Search before opening files.
- Limit search matches.
- Read narrow line ranges.
- Cap command output.
- Summarize findings before expanding scope.
- Stop when the evidence is sufficient.

## Execution Pattern

```bash
rg -n -m 20 "term" src/ 2>&1 | head -c 4000
sed -n '1,180p' path/to/file
git diff -- path/to/file 2>&1 | head -c 6000
```

Avoid raw `cat`, broad `rg`, full `git diff`, and unbounded test output on large
projects.

## Escalation Conditions

- The needed evidence appears to be in secrets, credentials, production logs, or
  private data.
- The user asks for broad extraction or export of sensitive material.
- The task requires destructive cleanup to reduce output.
