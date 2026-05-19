---
name: validation-plan
description:
  Use before reporting completion, especially for medium or high risk code
  changes.
---

# Validation Plan

## Purpose

Match validation to the risk of the change.

## Triggers

- Before reporting completion.
- Before merging or committing a non-trivial change.
- After changes to logic, UI, dependencies, databases, auth, or deployment.

## Checklist

- Classify risk.
- Prefer targeted validation first.
- Use broader validation for shared or high-risk behavior.
- Bound command output.
- Report exact commands and results.

## Execution Pattern

1. Classify risk as low, medium, or high.
2. Choose targeted validation first.
3. Add broader validation for high-risk changes.
4. Run commands with bounded output.
5. Report exact commands and results.

## Escalation Conditions

- Validation requires network, external services, production data, or new
  dependencies.
- Required validation command is unknown.
- Validation fails and the result affects release safety.
