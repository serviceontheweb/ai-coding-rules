# Safety Rules

Safety rules define what agents may do without approval and what must stop for
human review.

## Approval Required

Ask before:

- deleting files or directories;
- running destructive commands;
- deploying or changing release state;
- changing live data;
- reading, printing, or transmitting secrets;
- force-pushing or rewriting shared history;
- changing permissions recursively.

## Protected Data

Never print, copy, commit, or summarize secret values. Treat credentials,
tokens, keys, personal data, and sensitive logs as protected.

If a secret is exposed:

1. Stop copying it.
2. Redact it in all summaries.
3. Tell the maintainer where it appeared.
4. Recommend rotation.

## Risk Levels

- Low: documentation, comments, isolated typo fixes.
- Medium: local logic, UI behavior, small refactors.
- High: authentication, payments, databases, deployments, security.
- Critical: destructive actions, credential exposure, live data changes.

## Related Pages

- [Policy System](Policy-System)
- [Workflow Patterns](Workflow-Patterns)
- [AGENTS.md Standards](AGENTS.md-Standards)
