---
name: code-review
description: Use when reviewing code, pull requests, diffs, architecture changes, or implementation quality.
---

# Code Review

## Purpose

Find concrete defects and risks before summarizing style or preferences.

## Triggers

- User asks for a review.
- Diff, pull request, or patch assessment.
- Regression investigation.
- Architecture or security-sensitive change review.

## Checklist

- Prioritize bugs, regressions, missing tests, security, and data risks.
- Reference files and lines when possible.
- Verify whether called routes, imports, columns, and dependencies exist.
- Distinguish confirmed findings from questions.
- Keep summary secondary to findings.

## Execution Pattern

1. Inspect changed files and nearby context.
2. Check relevant tests or validation signals.
3. List findings by severity.
4. Add open questions or assumptions.
5. Summarize only after findings.

## Escalation Conditions

- Review requires reading secrets or private data.
- The diff affects production deployment, database migrations, auth, billing, or permissions.
- Validation cannot run and the residual risk is high.
