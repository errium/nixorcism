1.  Check git status and current branch
2.  If uncommitted changes:

- Stage changes
- Analyze what changed
- Review previous commits to match style
- Create commit message:

* Conventional commits when appropriate (feat:, fix:, docs:)
* First line <72 chars, specific but concise
* Split unrelated changes into multiple commits

3.  Sync with remote (fetch, pull if behind, handle conflicts)
4.  Push to origin
5.  Report: branch, commit message, files changed, status

**Commit examples:**
Good: "feat: add auth module", "fix: race condition in cache"
Bad: "update", "changes", walls of text in first line
