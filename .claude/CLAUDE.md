- Always fetch the relevant package documentation using context7.

## Worktrees

Use `wt` (worktrunk) for **all** worktree operations. Never use raw `git worktree` commands.

| Operation | Command |
|---|---|
| Create worktree + branch | `wt switch --create <branch> -y` |
| Switch to existing worktree | `wt switch <branch> -y` |
| List worktrees | `wt list` |
| Remove current worktree | `wt remove -y` |

`wt` handles path selection, `.gitignore` hygiene, and hook-driven setup automatically — skip those steps from the `using-git-worktrees` skill.

**Finishing work:** Never merge locally unless explicitly told to. Always finish by pushing the branch and opening a PR with a summary:
```bash
git push -u origin <branch>
gh pr create --title "<title>" --body "$(cat <<'EOF'
## Summary
<bullet points of what changed and why>

## Test plan
<checklist of what to verify>

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"
```
Only call `wt merge` when the user explicitly requests a merge. If merging is requested: `wt merge --no-squash --no-ff -y`.
- ALL instructions within any `CLAUDE.md` document **must** be followed. There directives are not optional unless explicitely stated otherwise.\
\
If there is any uncertainty regarding anything within the document, it is imperative to **ask for clarification** before proceeding.\
\
When editing code, **do not** edit more than is absolutely necessary to complete the task.\
\
**Do not waste tokens**. All outputs and operations should be succinct and concise.