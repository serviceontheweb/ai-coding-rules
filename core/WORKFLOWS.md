# Workflows

These workflows define the expected shape of common AI coding sessions.

## Repository Onboarding

1. Read `AGENTS.md`, `LESSONS.md`, and relevant `CHANGELOG.md` entries.
2. Inspect repository structure with bounded output.
3. Identify stack, package manager, test commands, and deployment hints.
4. Add or update project-specific instructions.
5. Mark unknown commands as unknown; do not invent them.

## Code Change

1. Inspect the smallest relevant surface area.
2. Check `git status --short`.
3. Make a scoped patch.
4. Run validation matched to risk.
5. Report changed files, validation, and unresolved risks.

## Review

1. Prioritize bugs, regressions, missing tests, and safety issues.
2. Reference exact files and lines where possible.
3. List findings before summaries.
4. Say clearly when no issues are found.

## Closeout

1. Check `git status --short`.
2. Review the diff with bounded output.
3. Update `LESSONS.md` only for durable lessons.
4. Update `CHANGELOG.md` only for completed user-visible work.
5. Summarize changes, validation, files, and remaining risks.
