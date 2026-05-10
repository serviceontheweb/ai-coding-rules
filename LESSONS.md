# Lessons Learned

> Append-only log. Never delete entries. Read before every session.

### 2026-05-10 — Directory Name Had Trailing Newline
**What happened:** The local source directory was named `ai-coding-rules\n`, so normal path access to `/home/schuman/ai-coding-rules` failed.
**Root cause:** A newline character was included in the directory name.
**Lesson:** When a path appears in `find` but direct `ls` or `stat` fails, inspect escaped names with `ls -b` or `find -printf`.
**Action:** Used the escaped path to copy files into a clean temporary Git working tree before pushing.
