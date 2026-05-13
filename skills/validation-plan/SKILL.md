---
name: validation-plan
description: Use before reporting completion, especially for medium or high risk code changes.
---

# Validation Plan

## Goal

Match validation to the risk of the change.

## Steps

1. Classify risk as low, medium, or high.
2. Choose targeted validation first.
3. Add broader validation for high-risk changes.
4. Run commands with bounded output.
5. Report exact commands and results.

## Risk guide

| Risk | Examples | Validation |
|---|---|---|
| Low | Docs, comments, typo | Review changed file. |
| Medium | Local logic, UI, small refactor | Targeted test/lint/build/syntax check. |
| High | Auth, payments, DB, deployment | Targeted and broader tests plus rollback notes. |

## Final report

```text
Validation performed:
- ...
Validation not run:
- ... because ...
```

