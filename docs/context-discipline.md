# Context Discipline

Context discipline is the practice of keeping the agent's working context small, relevant, and useful.

AI coding agents often fail because they inspect too much, paste huge logs, or load entire directories when only a few lines matter. Context discipline prevents that.

## Rules

1. Inspect only relevant files.
2. Prefer search before reading files.
3. Limit output from every command that might be large.
4. Avoid dumping generated files, dependency folders, build output, and logs.
5. Summarize findings instead of pasting everything.
6. Re-open narrow ranges when more detail is needed.

## Good commands

```bash
rg -n -m 20 "checkout" src/ 2>&1 | head -c 4000
sed -n '40,140p' src/orders/checkout.ts
git diff -- src/orders/checkout.ts 2>&1 | head -c 6000
npm test -- checkout 2>&1 | tail -c 6000
```

## Risky commands

```bash
cat app.log
rg -n "checkout" .
git diff
npm test
find . -type f
```

These commands may be acceptable only when bounded:

```bash
find . -type f | head -200
git diff --stat
npm test 2>&1 | tail -c 6000
```

## Search pattern

Use this sequence:

1. Search for symbols or terms.
2. Read only the relevant file ranges.
3. Patch the smallest area.
4. Run targeted validation.
5. Inspect the diff for only changed files.

## File-reading pattern

Start with:

```bash
sed -n '1,180p' file
```

Then read additional ranges only as needed:

```bash
sed -n '180,360p' file
```

Avoid reading a whole large file unless it is short enough to fit comfortably in context.

## Diff pattern

Prefer:

```bash
git diff --stat
git diff -- path/to/file 2>&1 | head -c 6000
```

Avoid:

```bash
git diff
```

## Test-output pattern

Prefer:

```bash
npm test 2>&1 | tail -c 6000
pytest tests/specific_test.py 2>&1 | tail -c 6000
```

If a test fails, rerun the narrow failing test with enough output to diagnose it.

## Final response pattern

Do not paste raw command output unless the user needs it. Summarize:

```text
Validation: ran npm test -- checkout. One test failed because the local Redis service is unavailable.
```
