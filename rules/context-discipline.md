# Rule: Context Discipline

Agents must protect the context window.

## Required behavior

- Search before reading large files.
- Read narrow line ranges.
- Cap command output.
- Avoid dumping logs, diffs, generated files, dependency folders, and build artifacts.
- Summarize results in final responses instead of pasting raw output.

## Output caps

Recommended limits:

| Command type | Suggested cap |
|---|---:|
| Search results | 4 KB |
| File excerpts | 180 lines at a time |
| Diffs | 6 KB per file |
| Test output | Last 6 KB |
| Logs | Last 4 KB unless more is needed |

## Preferred snippets

```bash
rg -n -m 20 "term" src/ 2>&1 | head -c 4000
sed -n '1,180p' path/to/file
git diff -- path/to/file 2>&1 | head -c 6000
pytest tests/specific.py 2>&1 | tail -c 6000
```
