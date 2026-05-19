---
name: tdd
description:
  Use when adding or changing behavior that can be protected with focused tests.
---

# Test-Driven Development

## Purpose

Use tests to define behavior before or alongside implementation.

## Triggers

- Bug fixes with reproducible behavior.
- New business logic.
- Refactors with expected behavior preservation.
- Edge cases that should not regress.

## Checklist

- Identify the smallest observable behavior.
- Add or update a focused test.
- Confirm the test fails for the right reason when practical.
- Implement the minimal fix.
- Run targeted validation.

## Execution Pattern

1. Locate existing test style and helpers.
2. Write the smallest relevant test.
3. Implement the behavior.
4. Run the focused test.
5. Broaden validation if shared behavior changed.

## Escalation Conditions

- Test setup requires installing dependencies, changing services, or accessing
  production-like data.
- No reliable local test path exists.
- The implementation touches high-risk domains.
