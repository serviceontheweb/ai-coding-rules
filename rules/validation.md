# Rule: Validation

Agents must validate work according to risk.

## Risk levels

| Risk | Minimum validation |
|---|---|
| Low | Review changed Markdown or code formatting. |
| Medium | Run targeted test, lint, syntax check, or build. |
| High | Run targeted and broader validation; include rollback notes. |

## Required honesty

Do not say validation passed unless it ran and passed.

If validation could not run, report:

- command attempted;
- reason it could not run;
- expected maintainer command;
- risk of not running it.

## Final format

```text
Validation:
- Passed: ...
- Not run: ... because ...
```
