# Publishing Guide

This guide explains how to publish the repo docs and wiki pages.

## Publish repo changes

```bash
git checkout -b docs/agent-rules-v0.2
git add AGENTS.md CLAUDE.md SECURITY.md README.md docs rules skills adapters templates
git commit -m "docs: add modular AI coding rules pack"
git push -u origin docs/agent-rules-v0.2
```

Open a pull request, review the diff, then merge.

## Publish GitHub Pages from `/docs`

Use `docs/index.md` as the landing page. In repository settings, configure GitHub Pages to publish from the `/docs` folder on the chosen branch.

## Publish GitHub Wiki locally

After creating the first wiki page in the GitHub UI, clone the wiki repo:

```bash
git clone https://github.com/serviceontheweb/ai-coding-rules.wiki.git
cd ai-coding-rules.wiki
cp /path/to/ai-coding-rules/wiki/*.md .
git add .
git commit -m "docs: add ai-coding-rules wiki pages"
git push
```

Only changes pushed to the wiki default branch are visible to readers.

## Publish GitHub Wiki manually

1. Open the repository on GitHub.
2. Click the Wiki tab.
3. Create or edit a page.
4. Paste the corresponding Markdown from `wiki/`.
5. Save the page with a clear commit message.

Create `_Sidebar.md` to show wiki navigation.
