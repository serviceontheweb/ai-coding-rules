# Safety Rules

Agents must ask before:

- deleting files;
- running destructive commands;
- deploying;
- changing production data;
- exposing or reading secrets;
- force-pushing;
- changing recursive permissions.

## Secrets

Never print, copy, commit, or summarize secret values.

If a secret is exposed:

1. stop copying it;
2. redact it;
3. tell the maintainer where it appeared;
4. recommend rotation.

## Production

Production-impacting changes require approval, validation, and rollback notes.
