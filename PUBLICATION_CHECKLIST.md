# Publication Checklist

Use this checklist after applying the upgrade pack.

## Repository

- [ ] `CLAUDE.md` exists and imports `AGENTS.md`.
- [ ] `SECURITY.md` exists.
- [ ] Templates live in `templates/`.
- [ ] README links to docs, adapters, skills, rules, and wiki.
- [ ] Compatibility wording is precise.
- [ ] Default config does not enable network casually.
- [ ] No secrets or private values were added.
- [ ] Markdown paths are correct.
- [ ] `git diff --stat` looks reasonable.

## GitHub metadata

Add repository description:

```text
Lightweight AGENTS.md rules, safety guardrails, context discipline, and memory templates for AI coding agents.
```

Add topics:

```text
agents-md ai-coding codex claude-code github-copilot cursor windsurf aider prompt-engineering developer-tools coding-agents ai-agent-rules
```

## GitHub Pages

- [ ] Use `docs/index.md` as landing page.
- [ ] Configure Pages source to `/docs` if using GitHub Pages.
- [ ] Verify internal links.

## GitHub Wiki

- [ ] Create initial wiki page in GitHub UI if wiki is empty.
- [ ] Clone `https://github.com/serviceontheweb/ai-coding-rules.wiki.git`.
- [ ] Copy `wiki/*.md` into the wiki repo.
- [ ] Commit and push.
- [ ] Confirm `_Sidebar.md` appears as sidebar navigation.

## Release

Suggested release title:

```text
v0.2.0 - Modular AI coding rules pack
```

Suggested release notes:

```md
## Added

- Claude Code bridge via CLAUDE.md.
- Modular rules for context discipline, safety, validation, git workflow, deployment, and memory.
- Reusable skills for onboarding, security preflight, validation, and session closeout.
- Tool adapters for Codex, Claude Code, GitHub Copilot, Cursor, Windsurf, and Aider.
- GitHub Pages docs and Wiki pages.
- Security policy and publication checklist.

## Changed

- Clarified compatibility wording across tools.
- Moved reusable templates into templates/.
- Positioned the repo as a lightweight, tool-neutral starter kit.
```
