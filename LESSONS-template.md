# Lessons Learned

> Append-only log. Never delete entries. Read before every session.
> Each entry should be specific enough that a future agent (with no other context) can avoid the same mistake.

## Format

```markdown
### YYYY-MM-DD — [Short Descriptive Title]
**What happened:** [What went wrong or what was discovered]
**Root cause:** [Why it happened — be specific]
**Lesson:** [What to remember — actionable rule]
**Action:** [What was done about it — code change, rule added, etc.]
```

---

<!-- Agents: append new lessons below this line -->
