# Migration Guide

Use this guide to move from a duplicated instruction set to the Core +
Extensions layout.

## 1. Find the Source of Truth

Choose one baseline contract: `core/AGENTS.md`.

Move shared rules into core files. Replace repeated copies with links or short
pointers.

## 2. Split by Responsibility

- Safety and approvals go in `core/SAFETY.md`.
- Context limits go in `core/CONTEXT.md`.
- Lessons and changelog usage go in `core/MEMORY.md`.
- Repeatable task behavior goes in `skills/`.
- Tool setup goes in `adapters/`.
- Starter project variants go in `templates/`.

## 3. Remove Private Details

Before publishing, search for:

- company or product names;
- server names, IP addresses, domains, and private paths;
- secrets, tokens, credentials, and `.env` values;
- non-public delivery, release, or approval workflows.

## 4. Keep Legacy Entry Points Brief

If existing users rely on older files, keep those files as short compatibility
pointers during migration.

## 5. Validate the Refactor

Run a bounded search for prohibited private terms and inspect changed markdown
for duplicate long-form sections.
