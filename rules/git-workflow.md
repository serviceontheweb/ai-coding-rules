# Rule: Git Workflow

## Before editing

Run:

```bash
git status --short
```

Preserve user changes. Do not overwrite uncommitted work.

## During work

Use focused diffs:

```bash
git diff --stat
git diff -- path/to/file 2>&1 | head -c 6000
```

## Commits

Do not commit unless asked.

When asked to commit, use:

```text
<type>: <summary>
```

Types: `fix`, `feat`, `docs`, `test`, `refactor`, `chore`, `security`.

## Never without approval

- `git reset --hard`
- `git clean -fd`
- `git push --force`
- rebasing shared branches
- deleting branches
