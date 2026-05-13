# Safety Rules

These rules keep AI coding work reversible, reviewable, and safe.

## Approval required

Ask for explicit approval before:

- deleting files or directories;
- running destructive shell commands;
- deploying to production;
- changing production data;
- force-pushing or rewriting shared git history;
- reading or printing secrets;
- changing credentials, auth, payments, billing, or permissions;
- installing new dependencies in production paths;
- modifying generated assets when the source-of-truth is unclear.

## Destructive commands

Treat these as high risk:

```bash
rm -rf
git reset --hard
git clean -fd
git push --force
chmod -R
chown -R
DROP DATABASE
TRUNCATE TABLE
```

## Secret rules

Never print or copy:

- API keys;
- access tokens;
- private keys;
- `.env` values;
- database credentials;
- OAuth secrets;
- production config values;
- customer data.

If a secret is exposed, redact it and recommend rotation.

## Production rules

Before production-impacting work, require:

1. explicit approval;
2. backup or rollback plan;
3. validation plan;
4. clear affected systems;
5. post-change verification.

## Dependency rules

Before adding a dependency:

- check whether existing dependencies can solve the problem;
- prefer small, maintained packages;
- avoid unnecessary runtime dependencies;
- document why the dependency is needed;
- run security and lockfile checks when available.

## Data rules

Never alter live data casually. For migrations:

- create a reversible migration when possible;
- test on local or staging data;
- include rollback notes;
- validate affected queries;
- avoid broad updates without a `WHERE` clause.

## Final safety report

For medium and high risk work, final response should include:

```text
Changed: ...
Validation: ...
Risk: ...
Rollback: ...
Files: ...
```
