# Context Discipline

Treat the context window as a limited engineering resource.

## Pattern

1. Search before reading.
2. Read narrow file ranges.
3. Cap command output.
4. Summarize findings before expanding scope.
5. Stop once you have enough evidence to act.

## Preferred Commands

```bash
rg -n -m 20 "term" src/ 2>&1 | head -c 4000
sed -n '1,180p' path/to/file
git diff -- path/to/file 2>&1 | head -c 6000
python -m pytest tests/specific_test.py 2>&1 | tail -c 6000
```

## Avoid

```bash
cat large-file.log
rg -n "term" .
git diff
npm test
```

Use unbounded commands only when the repository is small enough and the output
risk is clear.
