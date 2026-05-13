# Aider Adapter

Use this adapter when a project uses Aider.

## Recommended approach

- Keep `AGENTS.md` as the canonical repository contract.
- Copy the most important rules into Aider's convention or instruction file if needed.
- Keep the copied rules short: safety, validation, context discipline, and project commands.

## Suggested convention content

```md
Follow AGENTS.md. Make minimal safe changes. Do not expose secrets. Ask before destructive or production actions. Use targeted validation and summarize changed files.
```
