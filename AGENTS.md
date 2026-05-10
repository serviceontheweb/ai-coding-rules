# AGENTS.md — Master Rules for AI Coding Agents

> **READ THIS ENTIRE FILE BEFORE DOING ANY WORK.**
> Universal guidance for AI coding agents: Codex, Claude Code, Cursor, Copilot, Windsurf, Aider, and any other agent that supports AGENTS.md.
> These rules protect codebases, reduce token waste, prevent repeated mistakes, and ensure consistent, production-safe output.

---

## 1. OPERATING PRINCIPLES

Keep it simple. Simple is better than complex.
Make the smallest change that solves the actual request.
Prefer existing patterns over new abstractions.
Avoid broad refactors, speculative helpers, and clever architecture unless clearly justified.
Read enough surrounding code to understand the existing pattern before writing anything.
Optimize for correctness, speed, and token efficiency.
Correct the user when they're heading toward a mistake — don't silently comply with bad ideas.

### Success Criteria

Done means:
- The requested behavior is implemented
- The change is minimal and follows existing patterns
- Risky changes were validated
- Remaining risks are stated plainly
- LESSONS.md and CHANGELOG.md are updated

---

## 2. BEFORE EVERY SESSION — MANDATORY

```
□ Read this file (AGENTS.md)
□ Read the project's AGENTS.md in the repo root (if different from this file)
□ Read LESSONS.md — never repeat a documented mistake
□ Read CHANGELOG.md — understand recent changes
□ Run: git status && git log --oneline -5
□ Identify what files will be touched BEFORE writing code
□ State your approach for non-trivial tasks before editing
```

---

## 3. CONTEXT DISCIPLINE

Protect context aggressively. As tool output and conversation grow, useful signal gets diluted. Keep active context focused on the current decision.

### Before opening files or running searches, ask:

1. What exact question am I answering?
2. Which file, symbol, or component is most likely relevant?
3. Can I inspect a narrower slice first?
4. Can `grep`, `rg`, imports, or filenames locate the answer faster?

### Command output — ALWAYS byte-cap unknown output:

```bash
# Default — cap at 4KB
COMMAND 2>&1 | head -c 4000

# Logs or recent failures
COMMAND 2>&1 | tail -c 4000

# When exit code matters
tmp="$(mktemp)"; COMMAND >"$tmp" 2>&1; status=$?; tail -c 5000 "$tmp"; rm -f "$tmp"; exit "$status"
```

### NEVER run unbounded:

```bash
# BAD — floods context window
cat path/to/large/file
rg -n "term" .
find .
ls -R
git diff
npm test (full suite, unbounded)
SELECT * FROM table

# GOOD — bounded
rg -l "term" . | head -c 2000
rg -n -m 20 "term" src/ 2>&1 | head -c 2000
git diff -- path/to/file 2>&1 | head -c 6000
find . -type f -name "*.py" 2>&1 | head -c 2000
head -100 path/to/file
SELECT * FROM table LIMIT 10
```

### Scope before printing:

- `rg -l` before `rg -n` (list files before printing content)
- `rg -c` before reading full matches (count first)
- `wc -l` or `stat` before `cat` on unknown files
- Search specific directories, not entire repos

### When context gets large, summarize and keep only:

- Current task state and decisions made
- Relevant file paths
- What was changed
- Unresolved risks

Drop everything else.

---

## 4. SAFETY RULES

### NEVER:

- Delete files — comment out, rename with `.bak`, or `git rm` with a commit message
- Modify environment config files (`.env`, database configs, secrets) without explicit approval
- Run destructive database operations without showing the SQL first
- Force push to main/master
- Commit credentials, tokens, API keys, or passwords
- Deploy without testing
- Make broad changes to templates/views without testing all affected pages
- Assume a web server type — check first (nginx vs Apache vs other)
- Reference asset files without verifying they exist

### ALWAYS:

- Create a backup before modifying critical files
- Run syntax checks before deploying (e.g., `php -l`, `python -c "import ast; ast.parse(open('file').read())"`, `node --check file.js`)
- Verify file/directory permissions after deployment
- Test the most critical user-facing flow after any change
- Use parameterized queries — never concatenate user input into SQL
- Check `git status` before and after making changes

---

## 5. CODE STYLE

### General (all languages)

- Follow the project's existing style — don't impose a new one
- Strict comparisons where available (`===` not `==` in JS/PHP)
- Always validate and sanitize input
- Handle errors explicitly — no silent catches
- Meaningful variable names — no `x`, `temp`, `data` unless scope is <3 lines

### Language-Specific Defaults (override in project AGENTS.md)

**Python:** PEP 8, type hints on public functions, f-strings over `.format()`
**JavaScript/TypeScript:** `const`/`let` (never `var`), `async`/`await` over callbacks, strict mode
**PHP:** PSR-12, strict comparisons, use framework's query builder
**SQL:** Parameterized queries always, `EXPLAIN` before adding indexes, `LIMIT` on selects
**CSS:** Don't create new files — add to existing ones, use cache-bust query strings (`?v=YYYYMMDD`)
**HTML:** No inline `<script>` or `<style>` blocks unless fixing a specific rendering bug

---

## 6. GIT PRACTICES

```bash
# Commit after each logical change
git add -A
git commit -m "type: description"
```

### Commit types:

| Type | When |
|------|------|
| `fix` | Bug fixes |
| `feat` | New features |
| `perf` | Performance improvements |
| `refactor` | Code restructuring (no behavior change) |
| `docs` | Documentation only |
| `chore` | Build, config, dependencies |
| `style` | Formatting, whitespace (no logic change) |
| `test` | Adding or updating tests |

### Rules:

- One commit per logical change, not bulk commits
- Never force push to main/master
- Never commit secrets or credentials
- Pull before pushing: `git pull --rebase origin main`
- Write commit messages for humans, not machines

---

## 7. VALIDATION

Match validation effort to risk level.

### Low risk — skip validation, state that you skipped it:
- Copy/label/text changes
- CSS spacing, colors, cosmetic tweaks
- Adding comments
- Documentation updates

### Medium risk — run syntax checks:
- Template/view changes
- Controller/route logic changes
- New API endpoints
- Config changes

### High risk — full testing required:
- Database schema changes
- Authentication/authorization changes
- Payment/financial calculations
- Data migration scripts
- Multi-environment deployments
- Anything touching production user data

### Validation order (cheapest first):

1. Syntax check (`php -l`, `python -c`, `node --check`, `tsc --noEmit`)
2. Linter (`eslint`, `flake8`, `phpcs`)
3. Targeted test (single test file or function)
4. Integration test (if available)
5. Manual browser/functional test (ask user)
6. Full test suite (only for high-risk or when user requests)

---

## 8. DEPLOYMENT

### General deployment rules:

- Always deploy to staging/test environment first
- Verify before deploying to production
- Keep tenant/environment-specific configs separate — never sync them
- Fix file ownership/permissions after deployment
- Verify assets load correctly after deployment (`curl -I`)
- Keep rollback plan — know how to undo every change

### Multi-tenant/multi-environment:

```bash
# Sync shared code, exclude environment-specific files
rsync -avz --delete \
  --exclude='.env' \
  --exclude='config/database.*' \
  --exclude='config/local.*' \
  --exclude='storage/' \
  --exclude='node_modules/' \
  $SOURCE/ user@target:/path/to/app/
```

---

## 9. SUBAGENTS

Use subagents only when they save context or materially improve output quality.

### Good uses:
- Repository exploration and code search
- Scoped implementation of isolated features
- QA, review, or security audit
- Documentation and API reference lookup
- Web research for library/API questions

### When using a subagent:
- Assign a narrow, specific task
- Require: findings, files inspected, files changed, validation run, risks
- Do NOT pass a preferred conclusion — ask for evidence and alternatives
- The main agent owns final judgment and integration

### Avoid subagents for:
- Trivial work the main agent can finish faster
- Tasks that need full project context (subagent won't have it)

---

## 10. COMMUNICATION

### Before editing (non-trivial tasks):
State the approach in 2-3 lines: what files, what change, what risk.

### During work:
Keep updates short — what was found, what changed, what risk remains.

### After work — ALWAYS report:

```
Summary:
- What changed: [files and description]
- Validated: [what was checked, or "skipped — low risk"]
- Risk: [remaining concerns, or "none"]
- Next: [follow-up actions needed, if any]
```

### Do NOT:
- Explain obvious edits
- Repeat the user's request back to them
- Ask permission for low-risk changes — do them and report
- Dump full file contents unless specifically asked
- Over-explain or add unnecessary commentary

---

## 11. PERSISTENT MEMORY — LESSONS.md

Every project should have a `LESSONS.md` file. This is the agent's long-term memory.

### After every session, append:

```markdown
### YYYY-MM-DD — [Short Title]
**What happened:** [brief description]
**Root cause:** [why it happened]
**Lesson:** [what to remember]
**Action:** [what was done, or rule added]
```

### Rules:
- Read LESSONS.md before every session — never repeat a documented mistake
- Be specific — include file names, error messages, exact commands
- Bad lessons: "CSS broke" / Good lessons: "Bundling CSS into dashboard.min.css broke sidebar icons because the bundle was built from pre-improvement source files"
- Never delete lessons — they accumulate over time
- Any lesson that applies globally should also be added to the project's AGENTS.md

---

## 12. PERSISTENT MEMORY — CHANGELOG.md

Track what was done, when, and by whom.

### Format:

```markdown
## YYYY-MM-DD

| Author | Type | Description |
|--------|------|-------------|
| Codex | fix | Repaired form submit button visibility |
| Claude | feat | Added SMS logging API endpoint |
| Human | chore | Updated production SSL certificate |
```

### Rules:
- Update after every session
- One row per logical change
- Include the agent name (Codex, Claude, Cursor, Human)
- Keep it factual — no commentary

---

## 13. PROJECT-SPECIFIC OVERRIDES

This file contains universal rules. Each project can have its own `AGENTS.md` in the repo root that adds project-specific context:

- Tech stack and framework details
- Directory structure
- Build/test/deploy commands
- Environment details (servers, ports, URLs)
- Project-specific "DO NOT" rules
- Known bugs and gotchas

**Project-specific rules override global rules when they conflict.**

### Recommended project AGENTS.md structure:

```markdown
# [Project Name] — AGENTS.md

## Overview
[One paragraph: what this project is, what stack it uses]

## Tech Stack
[Language, framework, database, hosting]

## Directory Structure
[Key directories and what they contain]

## Commands
[Build, test, lint, deploy commands with exact syntax]

## Known Issues
[Gotchas, quirks, things that will trip you up]

## DO NOT
[Project-specific prohibitions]

## Read LESSONS.md before starting work.
```

---

## 14. FILE STRUCTURE OVERVIEW

```
~/.codex/
├── AGENTS.md          ← This file (global rules, read by every session)
└── config.toml        ← Agent configuration

~/project-root/
├── AGENTS.md          ← Project-specific rules (overrides global where needed)
├── LESSONS.md         ← Accumulated lessons (never delete, only append)
├── CHANGELOG.md       ← Track record of all changes
├── README.md          ← For humans
└── ... (project files)
```

### How agents read these (automatic, no prompting needed):

```
Session starts
    ↓
Reads ~/.codex/AGENTS.md (global rules)
    ↓
Reads ./AGENTS.md (project-specific context)
    ↓
Reads LESSONS.md (past mistakes to avoid)
    ↓
Agent is now fully briefed — ready to work
```

---

## 15. QUICK REFERENCE

```bash
# Scoped search (never unbounded)
rg -l "term" src/ | head -c 2000
rg -n -m 20 "term" src/ 2>&1 | head -c 4000

# Syntax checks
php -l file.php
python -c "import ast; ast.parse(open('file.py').read())"
node --check file.js
tsc --noEmit

# Git
git status && git log --oneline -5
git add -A && git commit -m "type: description"

# File inspection (always check size first)
wc -l file.txt
head -50 file.txt
tail -50 file.txt

# Logs (always capped)
tail -c 4000 /var/log/app/error.log

# Deployment verification
curl -I https://example.com/assets/style.css
```

---

**END OF MASTER RULES. Follow them. Update LESSONS.md after every session. No exceptions.**
