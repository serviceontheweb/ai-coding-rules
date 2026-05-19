# Safety

Safety rules protect the repository, users, production systems, and sensitive data.

## Approval Required

Ask for explicit human approval before:

- deleting files or directories;
- running destructive commands such as `rm -rf`, `git reset --hard`, or `git clean -fd`;
- force-pushing, rebasing shared branches, or rewriting published history;
- deploying or changing production infrastructure;
- altering production databases or live customer data;
- reading, printing, copying, or transmitting secrets;
- installing dependencies in production paths;
- changing permissions recursively.

## Protected Data

Do not expose or copy:

- `.env`, `.env.*`, private keys, tokens, database credentials, OAuth secrets;
- production configs or deployment secrets;
- customer data, invoices, personal data, or sensitive logs.

## High-Risk Work

For auth, payments, permissions, databases, deployments, or security-sensitive changes:

1. State the intended change.
2. Identify the risk.
3. Confirm approval when required.
4. Plan validation before editing.
5. Report rollback or recovery notes when relevant.

## Public Repository Rule

Keep examples generic. Do not include private organization names, non-public operational details, credentials, or proprietary workflows.
