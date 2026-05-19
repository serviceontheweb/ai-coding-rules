---
name: security-preflight
description: Use before auth, billing, secrets, deployment, filesystem deletion, dependency, or database changes.
---

# Security Preflight

## Purpose

Identify risk before making sensitive changes.

## Triggers

- Auth, billing, permission, deployment, filesystem deletion, dependency, or database work.
- Secret, credential, token, or private data access.
- Any action that may affect production.

## Checklist

- Does this touch secrets, auth, payments, billing, permissions, production, or customer data?
- Could this delete or overwrite files?
- Could this change production behavior?
- Is rollback possible?
- Is user approval required?
- Are there relevant lessons in `LESSONS.md`?

## Execution Pattern

1. Classify risk.
2. Identify approval gates.
3. State validation and rollback notes.
4. Ask for approval when required.
5. Proceed only within approved scope.

## Escalation Conditions

- destructive commands;
- deployment;
- production data changes;
- secret access;
- force-push or history rewrite;
- recursive permission changes.
