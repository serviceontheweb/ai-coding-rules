---
name: security-preflight
description: Use before auth, billing, secrets, deployment, filesystem deletion, dependency, or database changes.
---

# Security Preflight

## Goal

Identify risk before making sensitive changes.

## Checklist

- Does this touch secrets, auth, payments, billing, permissions, production, or customer data?
- Could this delete or overwrite files?
- Could this change production behavior?
- Is rollback possible?
- Is user approval required?
- Are there relevant lessons in `LESSONS.md`?

## Approval required for

- destructive commands;
- deployment;
- production data changes;
- secret access;
- force-push or history rewrite;
- recursive permission changes.

## Output

```text
Risk level: low | medium | high
Approval required: yes | no
Reason: ...
Validation plan: ...
Rollback plan: ...
```

