# The Lessons System — Persistent Memory for AI Agents

## Why This Matters

AI coding agents have no memory between sessions. Every session starts from zero. Without persistent memory, agents will:
- Repeat the same mistakes
- Try approaches that were already proven to fail
- Break things that were previously fixed
- Waste tokens re-discovering project quirks

## The Three-File System

### AGENTS.md — What to do (rules)
Read-only reference. Updated rarely. Contains coding standards, safety rules, and project context.

### LESSONS.md — What went wrong (memory)
Append-only log. Updated every session. Contains specific failures and what was learned from them.

### CHANGELOG.md — What was done (history)
Append-only log. Updated every session. Contains a record of every change by every agent.

## LESSONS.md Format

Each entry must be specific enough that a future agent (with no other context) can avoid the same mistake:

```markdown
### 2026-05-09 — CSS Bundling Broke Dashboard UI
**What happened:** Combined all CSS files into dashboard.min.css using clean-css. The entire dashboard broke — missing sidebar icons, broken KPI card layout, POS "Request Failed" errors.
**Root cause:** The minified bundle was built from CSS files that pre-dated recent UI improvements. The bundle overwrote the improved styles. Additionally, posajax.css contained raw PHP inside CSS url() which broke when served as a static cached file.
**Lesson:** Never bundle CSS/JS in this project. The risk of overwriting improved styles far outweighs the marginal performance gain. Use individual CSS files with ?v=YYYYMMDD cache-busting query strings instead.
**Action:** Added "NEVER bundle CSS/JS" to AGENTS.md safety rules. Reverted to individual file loading.
```

### Bad lesson (too vague):
```markdown
### 2026-05-09 — CSS broke
**What:** CSS broke.
**Lesson:** Don't break CSS.
```

### Good lesson (specific and actionable):
The example above — includes exact file names, exact error symptoms, exact root cause, and a concrete rule to follow.

## CHANGELOG.md Format

```markdown
## 2026-05-09

| Author | Type | Description |
|--------|------|-------------|
| Codex | fix | Fixed duplicate getChartData() call in home controller |
| Codex | perf | Added idx_sales_date and idx_sales_customer_date indexes |
| Claude | feat | Created SMS API endpoint at /api/sms/send |
| Human | chore | Updated SSL certificate, expires 2026-07-25 |
```

## Rules for Agents

1. **Read LESSONS.md before every session** — this is non-negotiable
2. **Never delete entries** — lessons accumulate over the life of the project
3. **Be specific** — include file names, error messages, exact commands
4. **Promote recurring lessons** — if the same lesson appears multiple times, add it as a permanent rule in AGENTS.md
5. **Separate facts from opinions** — lessons should be verifiable, not subjective

## Multi-Agent Workflows

When multiple agents (Codex, Claude, Cursor) work on the same project, LESSONS.md and CHANGELOG.md become essential coordination tools. Each agent reads what others have done and learned, avoiding conflicts and repeated work.

```
Codex session: reads LESSONS.md → learns Claude broke CSS bundling yesterday → avoids bundling
Claude session: reads CHANGELOG.md → sees Codex added indexes today → doesn't add them again
```
