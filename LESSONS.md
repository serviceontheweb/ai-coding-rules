# Lessons Learned

> Append-only log. Never delete entries. Read before every session.

### 2026-05-10 — Directory Name Had Trailing Newline
**What happened:** The local source directory was named `ai-coding-rules\n`, so normal path access to `/home/schuman/ai-coding-rules` failed.
**Root cause:** A newline character was included in the directory name.
**Lesson:** When a path appears in `find` but direct `ls` or `stat` fails, inspect escaped names with `ls -b` or `find -printf`.
**Action:** Used the escaped path to copy files into a clean temporary Git working tree before pushing.

### 2026-05-10 — GitHub Wiki Remote Needs Initialization
**What happened:** Pushing directly to `serviceontheweb/ai-coding-rules.wiki.git` failed with `Repository not found`, even though the main repository had `has_wiki: true`.
**Root cause:** GitHub had not initialized the separate wiki Git repository yet, or the available write path did not permit creating it directly.
**Lesson:** For a brand-new GitHub Wiki, create the first page in the web UI if `.wiki.git` returns 404, then push the prepared wiki Markdown files.
**Action:** Prepared the five wiki page files and added source copies under `wiki/` in the main repository.
