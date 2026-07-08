# Agents

Guidelines for AI agents working in this dotfiles repository.

## Check for Drift Before Every New Task

Run this one command before starting *any* new piece of work in this repo — not just at session start, but before each new task within a session too (other processes, like Obsidian, edit tracked files live and can create drift mid-session):

```bash
chezmoi status
```

Empty output → proceed. Any output → resolve it immediately, unconditionally, even if unrelated to the task at hand:

```bash
chezmoi status | awk '{print $2}' | while read -r f; do chezmoi re-add ~/"$f"; done
```

Never wait to be asked or reminded. See `.claude/skills/chezmoi-dotfiles/SKILL.md` for the full workflow.

## If a Commit Attempt Fails on a Hook

`end-of-file-fixer`, `trailing-whitespace`, and similar hooks rewrite files in the working tree as a side effect of a failed commit attempt. That rewrite is NOT yet applied to the home directory, so it silently re-creates chezmoi drift even though you just resolved it. After ANY failed commit attempt, before retrying:

```bash
chezmoi apply && chezmoi status   # must print nothing before you retry the commit
```

Do not just re-stage and retry `git commit` — re-run `chezmoi apply` first, every time, no exceptions.

## Commit Each Piece Separately

Do not batch unrelated changes into one commit. Commit as soon as a logical piece of work is done — e.g. drift re-adds, a skill/doc fix, and a new feature (like a layout file) are three separate commits, even within the same session. Never hold commits until the end of a session and squash them together.

Before staging a commit for one piece of work, run `git status --short` and `git diff --cached --stat` and confirm only the intended paths are staged — a prior failed commit attempt (e.g. `git add -A`) can leave unrelated files staged, silently bundling them into the next commit.
