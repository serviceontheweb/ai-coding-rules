# Changelog

## 2026-05-19

### Codex - WordPress publishing package

Added a public-safe WordPress publishing package for the first SkyX AI
Engineering Governance article, including category metadata, SEO metadata,
WordPress block content, a featured image asset, and publishing notes.

Validation:

- Public WordPress REST API checked for existing category and post slugs.
- Publishing package JSON and Markdown formatted.

### Codex - README and wiki docs

Refactored README into a concise onboarding and architecture entry point,
expanded the wiki into a structured technical knowledge base, improved
cross-linking, formatted Markdown across the repository, and moved the Codex
configuration example to `adapters/codex/config.example.toml` with network
access disabled by default.

Validation:

- `npx prettier --write "**/*.md" --prose-wrap always` completed.
- `npx markdownlint-cli2 "**/*.md" "#node_modules"` passed with 0 errors.
- `git diff --check` passed.
- Public-safety term scan passed.
- Config move verified at `adapters/codex/config.example.toml`.

### Codex - refactor

Introduced Core + Extensions architecture, modular skills, framework templates,
adapter normalization, memory templates, policy examples, and compatibility
pointers.

Validation:

- `rg` private-term scan passed.
- `git diff --check` passed.
- Skill line counts checked.

Affected areas:

- `core/`
- `skills/`
- `templates/`
- `adapters/`
- `policies/`
- `memory/`
- `docs/`
- legacy pointer files

## 2026-05-14

### Codex - production discipline docs

Added sanitized production discipline rule packs, seeded lesson template,
documentation, and wiki pages.

## 2026-05-10

### Codex - initial docs

Added initial AI coding rules package and repository session logs.

### Codex - wiki source

Added source Markdown files for GitHub Wiki pages under `wiki/`.

### Codex - wiki links

Fixed wiki Home quick links to point at `templates/` paths.

### Codex - modular upgrade

Applied the modular `ai-coding-rules` upgrade pack to the main repository.
