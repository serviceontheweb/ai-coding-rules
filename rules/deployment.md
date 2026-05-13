# Rule: Deployment

Deployment is high risk.

## Approval required

Agents must ask before deploying or changing deployment configuration.

## Pre-deployment checklist

- Confirm target environment.
- Confirm branch and commit.
- Confirm backup or rollback path.
- Run relevant validation.
- Check for secrets or config drift.
- Confirm no unrelated files are included.

## Post-deployment checklist

- Verify health checks.
- Verify key user flow.
- Record what changed.
- Record validation and rollback notes.
- Update `CHANGELOG.md` when appropriate.
