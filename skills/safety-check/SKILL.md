---
name: safety-check
description:
  Use before destructive, production, credential, dependency, database, auth,
  payment, or permission changes.
---

# Safety Check

## Purpose

Classify risk and identify approval requirements before sensitive work begins.

## Triggers

- File or directory deletion.
- Production deployment or infrastructure change.
- Database schema or live data change.
- Secret, token, key, or credential access.
- Auth, billing, payment, permission, or security change.
- Dependency installation or upgrade.

## Checklist

- Does the task touch protected data?
- Could it delete, overwrite, or expose files?
- Could it affect production behavior?
- Is human approval required by policy?
- Is rollback or recovery clear?
- Are relevant lessons documented?

## Execution Pattern

1. State the intended action.
2. Classify risk as low, medium, high, or critical.
3. Identify required approvals.
4. Define validation and rollback notes.
5. Proceed only when approval requirements are satisfied.

## Escalation Conditions

- Any protected data may be read or printed.
- Any destructive command is needed.
- Production systems or live data may change.
- The blast radius is unclear.
