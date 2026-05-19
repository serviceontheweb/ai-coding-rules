---
name: repo-onboarding
description:
  Use when first adding ai-coding-rules to a repository or when refreshing
  project-specific instructions.
---

# Repo Onboarding

## Purpose

Create or refresh the minimum files that help coding agents work safely in this
repository.

## Triggers

- First adding this framework to a repository.
- Refreshing outdated project instructions.
- Creating project-specific `AGENTS.md` notes.

## Checklist

- Inspect structure with bounded output.
- Identify languages, frameworks, package managers, and commands.
- Add only verified project facts.
- Preserve approval gates and safety rules.
- Mark unknown commands as unknown.

## Execution Pattern

1. Inspect the repository structure with bounded output.
2. Identify languages, frameworks, package managers, test commands, and
   deployment hints.
3. Create or update `AGENTS.md` with project-specific facts.
4. Add memory files only when useful.
5. Add adapter files only for tools in use.
6. Do not invent commands.

## Escalation Conditions

- The repository contains secrets or private data.
- Deployment or production details are required.
- Existing instructions conflict with safety rules.
