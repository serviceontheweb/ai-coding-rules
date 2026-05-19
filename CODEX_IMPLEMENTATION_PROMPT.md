# Prompt for Codex

Use this prompt in Codex from the root of `serviceontheweb/ai-coding-rules`.

```text
You are working in the public repository serviceontheweb/ai-coding-rules.

Goal: implement the v0.2 documentation and structure upgrade for the AI coding
rules repo without losing existing content.

Rules:
- Read AGENTS.md first.
- Check git status before editing.
- Preserve existing user changes.
- Do not delete existing content unless it is moved and referenced correctly.
- Use bounded command output.
- Do not claim validation passed unless it ran.
- Do not commit unless asked.

Tasks:
1. Create a branch named docs/agent-rules-v0.2 unless already on a working branch.
2. Add CLAUDE.md at the repo root that imports AGENTS.md using @AGENTS.md and
   includes short Claude Code notes.
3. Add SECURITY.md with safety baseline, secret handling, dangerous operations,
   prompt-injection resistance, and reporting guidance.
4. Move template files into templates/:
   - project-agents-template.md -> templates/project-agents-template.md
   - LESSONS-template.md -> templates/LESSONS-template.md
   - CHANGELOG-template.md -> templates/CHANGELOG-template.md
   Update all references to those paths.
5. Create docs/ with:
   - index.md
   - getting-started.md
   - compatibility.md
   - context-discipline.md
   - safety-rules.md
   - lessons-system.md
   - migration.md
6. Create rules/ with:
   - context-discipline.md
   - safety.md
   - validation.md
   - git-workflow.md
   - deployment.md
   - memory.md
7. Create skills/ with SKILL.md files for:
   - repo-onboarding
   - context-discipline
   - security-preflight
   - validation-plan
   - session-closeout
8. Create adapters/ with README.md files for:
   - claude
   - codex
   - github-copilot
   - cursor
   - windsurf
   - aider
9. Add GitHub Copilot adapter examples under adapters/github-copilot/.github/:
   - copilot-instructions.md
   - instructions/backend.instructions.md
   - instructions/frontend.instructions.md
10. Create wiki/ pages:
   - Home.md
   - _Sidebar.md
   - Getting-Started.md
   - Compatibility.md
   - Context-Discipline.md
   - Safety-Rules.md
   - Lessons-System.md
   - Publishing-Guide.md
11. Update README.md to position the repo as a lightweight, tool-neutral AI
    coding rules starter kit. Mention AGENTS.md, CLAUDE.md, LESSONS.md,
    CHANGELOG.md, rules, skills, adapters, docs, and wiki.
12. Fix the compatibility wording:
   - Do not say every tool auto-reads AGENTS.md.
   - Say Claude Code should use CLAUDE.md importing AGENTS.md.
   - Say GitHub Copilot can use .github/copilot-instructions.md,
     .github/instructions/*.instructions.md, and AGENTS.md depending on surface.
13. Update config.toml to default to safer network posture if applicable:
   - approval_policy = "on-request"
   - sandbox_mode = "workspace-write"
   - network_access = false under sandbox workspace-write settings, unless
     existing docs clearly explain why network must be true.
14. Validate:
   - git status --short
   - git diff --stat
   - find . -maxdepth 4 -name '*.md' | sort
   - check that all README and Getting Started template paths exist
   - check that no secrets or private values were added
15. Summarize changes, validation, files changed, and any unresolved risks.

Suggested commit message if the maintainer asks you to commit:

docs: add modular AI coding rules pack
```
