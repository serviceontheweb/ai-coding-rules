---
name: context-discipline
description: Use before inspecting a large repo, large diff, large log, or broad search result.
---

# Context Discipline

## Goal

Find the necessary information without flooding the context window.

## Steps

1. Search before reading.
2. Use `rg -n -m 20` or equivalent.
3. Read narrow file ranges with `sed -n` or equivalent.
4. Cap large command output with `head -c` or `tail -c`.
5. Summarize findings before reading more.

## Preferred commands

```bash
rg -n -m 20 "term" src/ 2>&1 | head -c 4000
sed -n '1,180p' path/to/file
git diff -- path/to/file 2>&1 | head -c 6000
```

## Do not use unbounded output

Avoid raw `cat`, broad `rg`, full `git diff`, and unbounded test output on large projects.

