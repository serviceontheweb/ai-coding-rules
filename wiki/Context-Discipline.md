# Context Discipline

Context discipline keeps AI engineering workflows focused and auditable.

## Principle

Inspect only the information needed for the task. Prefer narrow searches,
bounded output, and targeted file reads.

## Preferred Commands

```bash
rg -n -m 20 "term" src/ 2>&1 | head -c 4000
sed -n '1,180p' path/to/file
git diff -- path/to/file 2>&1 | head -c 6000
npm test 2>&1 | tail -c 6000
```

## Avoid by Default

```bash
cat large.log
rg -n "term" .
git diff
npm test
```

## Workflow

1. Search narrowly.
2. Read narrow ranges.
3. Summarize findings.
4. Patch the smallest safe area.
5. Run targeted validation.

## Related Pages

- [Workflow Patterns](Workflow-Patterns)
- [AGENTS.md Standards](AGENTS.md-Standards)
- [Memory Systems](Memory-Systems)
