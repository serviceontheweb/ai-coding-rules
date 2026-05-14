# LESSONS

A persistent log of reusable mistakes and the rules that came from them. Each
lesson is written so a future agent — or a future you — can recognise the
pattern early and avoid repeating it.

Format for each lesson:
- **Condition** — the situation in which the mistake happens.
- **What went wrong** — the failure, factually.
- **Root cause** — why it happened, not just what.
- **Rule learned** — the durable rule, stated so it can be followed directly.
- **Cost** — what the mistake actually cost, to make the rule feel earned.

---

## Lesson 1 — Deployed code drifted from version control

> Note: this is a public, sanitised operational lesson. Identifying details such
> as hosts, usernames, IP addresses, private paths, client names, project names,
> and infrastructure specifics are deliberately omitted. The transferable pattern
> is preserved; private details stay private.

**Condition.** A deployed codebase had been worked on across many sessions. The
repository was believed to be in one state, the deployed environment was
believed to match it, and the database was believed to have a known schema.

**What went wrong.** Those assumptions did not hold. The repository, deployed
filesystem, and live database had drifted apart. Features described as "done"
had no committed code behind them. Client-side code referenced API routes with
no committed server handler. Database objects used by the code existed outside
committed migrations. The deployment directory was not a git checkout. Several
inspection passes were needed before the actual state could be established.

**Root cause.** Code had been changed outside the normal repository-first
workflow. Database structure had been created outside committed migrations.
Status had been recorded without committed evidence to back it. No single place
told the whole truth because the truth had been allowed to spread across
multiple uncontrolled surfaces.

**Rule learned.**
- The repository is the single source of truth. (See `rules/deployment-integrity.md`.)
- Never edit code directly on a server; deployed directories are git checkouts;
  deployment is `git pull` or an equivalent committed pipeline, never a hand-copy.
- Database schema is defined only by committed migration files — never by
  statements in application startup. (See `rules/schema-discipline.md`.)
- "Done" requires committed proof. (See `rules/status-truthfulness.md`.)
- Client-side code must not call routes, or reference database objects, that do
  not exist in committed code. (See `rules/no-phantom-references.md`.)
- Before enhancement work on a deployed system, reconcile deployed state against
  committed state first. Reconciliation blocks new feature work.

**Cost.** Multiple re-inspection cycles before useful work could begin;
confusion about what was actually true; improvement work blocked behind cleanup
that should not have been necessary. Drift was easy to create and expensive to
discover.

---

<!-- Add new lessons below. Keep them specific, keep them earned, and keep public versions sanitised. -->
