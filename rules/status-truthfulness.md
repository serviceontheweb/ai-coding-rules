# Rule Pack: Status Truthfulness

Purpose: ensure that any claim about the state of the work — "done", "passing",
"implemented", "deployed" — is backed by evidence. Optimistic or assumed status
is worse than no status, because it gets trusted and built upon.

## Rules

1. **"Done" requires committed proof.** Do not mark a task, endpoint, feature,
   or migration as done in a todo list, progress log, changelog, or commit
   message unless committed code demonstrates it. A plan to do something, or a
   half-finished attempt, is not "done".

2. **Never claim validation passed unless it actually ran and passed.** Do not
   report tests, builds, linters, or type checks as passing on assumption. Run
   them, observe the result, and report what actually happened — including
   failures.

3. **Distinguish "implemented" from "intended".** If an endpoint, function, or
   integration is described anywhere as existing, the corresponding code must
   exist in the repository. Documentation, todos, and specs describe intent;
   only committed code establishes reality. Keep the two clearly separated.

4. **Progress entries are tied to evidence.** Every meaningful change should be
   recorded with a dated entry stating what changed, why, and what it affects —
   and tied to a commit, command output, or other concrete evidence. A progress
   log of unverified prose recreates the problem it was meant to solve.

5. **Report uncertainty as uncertainty.** If the agent cannot verify something —
   no access, ran out of context, could not reproduce — it says so plainly. It
   does not fill the gap with a confident guess.

6. **Stale "done" claims are bugs.** If a todo or status file claims something
   is complete and the code does not support that claim, the discrepancy is a
   defect to be flagged and reconciled, not ignored.

## Verification

Before claiming any work complete, the agent should be able to answer, with
evidence:

- For every "done" in the status/todo/progress files touched: does committed
  code prove it?
- For every "passing" claim: was the check actually run, and what was its exact
  output?
- Is anything described as existing that does not exist in the repository?

If any answer is wrong, the status is false and must be corrected.
