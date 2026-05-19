# Claude Rule: Testing

Run validation before reporting completion.

Use bounded output:

```bash
npm test 2>&1 | tail -c 6000
pytest 2>&1 | tail -c 6000
```

If tests cannot run, explain why and list the exact command the maintainer
should run.
