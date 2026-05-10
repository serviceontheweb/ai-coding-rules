# Getting Started

## Step 1: Choose Your Scope

**Global (all projects):**
```bash
mkdir -p ~/.codex
cp AGENTS.md ~/.codex/AGENTS.md
```

**Per-project:**
```bash
cp AGENTS.md /your/project/root/
```

**Both (recommended):** Global for universal rules, per-project for specifics.

## Step 2: Add Persistence Files

In every project root:
```bash
touch LESSONS.md CHANGELOG.md
echo "# Lessons Learned" > LESSONS.md
echo "# Changelog" > CHANGELOG.md
```

## Step 3: Configure Your Agent

### Codex
```toml
# ~/.codex/config.toml
project_doc_fallback_filenames = ["CLAUDE.md", "AGENTS.md", ".agents.md"]
project_doc_max_bytes = 65536
```

### Claude Code
Rename to `CLAUDE.md` or keep as `AGENTS.md` — both are supported.

### Cursor
Place at project root — auto-detected. For advanced rules, use `.cursor/rules/` directory.

### GitHub Copilot
Place at project root — processed server-side automatically.

## Step 4: Create a Project-Specific AGENTS.md

Use the template in `templates/project-agents-template.md` and fill in your project details.

## Step 5: Start Working

Launch your agent. It reads the files automatically. No special prompting needed.

After every session, the agent should append to `LESSONS.md` and `CHANGELOG.md`. If it doesn't do this automatically, remind it once — it will follow the rule from AGENTS.md going forward.
