# Safety Rules — Why Each One Exists

Every safety rule in this AGENTS.md was learned the hard way — either by the authors or by the community. Here's the reasoning behind each one.

## "Never delete files"

AI agents are confident and fast. They'll delete a file they think is unused, then three pages break because something loaded it dynamically. **Always** comment out, rename with `.bak`, or use `git rm` with a commit (so it's recoverable).

## "Never modify environment config files without approval"

`.env`, `database.php`, `config.py`, `settings.json` — these contain credentials, connection strings, and environment-specific values. An agent that "helpfully" updates a database URL can take down production. These files should only be modified by humans with full context.

## "Never force push to main"

Force pushing rewrites history. If another developer (or agent) has already pulled, their local state diverges from remote. Merge conflicts multiply. Commits disappear. In multi-agent workflows, this is catastrophic.

## "Never commit credentials"

Once a secret is in git history, it's there forever (even after deletion). Credential scanning bots find exposed keys within minutes. This rule exists because it's the single most common security mistake in AI-assisted development — agents don't understand the permanence of git history.

## "Always run syntax checks before deploying"

AI agents produce syntactically valid code 95% of the time. The other 5% brings down production. A `php -l` or `node --check` takes milliseconds and catches the errors that matter most.

## "Always test the critical path after any change"

The "critical path" is the thing that makes money or serves users. For an e-commerce site, it's checkout. For a POS system, it's completing a sale. For a SaaS, it's login + core workflow. If this breaks, nothing else matters.

## "Never bundle CSS/JS without explicit approval"

CSS and JS bundling seems like an obvious optimization. But if the bundle is built from the wrong source files, or the build process changes the load order, or a file contains server-side code that only works when processed by the backend — the entire UI breaks. The performance gain from bundling (saving a few HTTP requests) is rarely worth the risk of a broken UI.

## "Match validation to risk"

Not every change needs a full test suite run. A typo fix in a label doesn't need integration tests. But a database schema change absolutely does. Over-validating wastes time and tokens. Under-validating breaks production. The risk matrix in AGENTS.md calibrates this.

## "Byte-cap all command output"

One unbounded `cat` or `npm test` can dump 50,000+ tokens into the context window, pushing out the agent's instructions and task context. The agent then "forgets" its rules and starts producing lower quality output. Byte-capping at 4KB preserves context for what actually matters.
