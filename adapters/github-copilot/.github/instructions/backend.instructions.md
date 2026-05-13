---
applyTo: "**/*.{py,php,rb,go,java,kt,cs,ts,js,sql}"
---

# Backend Instructions

- Prefer explicit, readable code.
- Validate and sanitize external input.
- Use parameterized queries for database access.
- Do not log secrets or personal data.
- Keep business logic testable.
- Preserve existing API contracts unless the task requires a contract change.
- Add or update targeted tests for behavior changes.
- For database migrations, include rollback notes where possible.
