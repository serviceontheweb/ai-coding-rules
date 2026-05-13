# Context Discipline

Context discipline keeps agent sessions focused and efficient.

## Use bounded commands

```bash
rg -n -m 20 "term" src/ 2>&1 | head -c 4000
sed -n '1,180p' path/to/file
git diff -- path/to/file 2>&1 | head -c 6000
npm test 2>&1 | tail -c 6000
```

## Avoid unbounded commands

```bash
cat large.log
rg -n "term" .
git diff
npm test
```

## Workflow

1. Search narrowly.
2. Read narrow ranges.
3. Patch the smallest safe area.
4. Run targeted validation.
5. Summarize results.
