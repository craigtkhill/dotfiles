# Agents

Guidelines for AI agents working in this dotfiles repository.

## Before Any Work: Sync Chezmoi Drift

Run `chezmoi status` as your first tool call in every session that touches this repo — before reading files, before editing, before anything else. Do this unconditionally, even if the user's request has nothing to do with the files that show drift. Do not wait for the user to ask or remind you.

```bash
chezmoi status
```

If any files show drift, re-add them all (paths from `chezmoi status` are home-relative):

```bash
chezmoi status | awk '{print $2}' | while read -r f; do chezmoi re-add ~/"$f"; done
```

The pre-commit hook (`chezmoi-drift`) blocks all commits when the home directory files differ from the chezmoi source. Resolving drift first — always, not just when it's related to the current task — avoids commit failures mid-task.

After re-adding drifted files, also apply any hook fixes back to the home directory before committing:

```bash
chezmoi apply <target-path>
```

See `.claude/skills/chezmoi-dotfiles/SKILL.md` for the full workflow.

## Commit Each Piece Separately

Do not batch unrelated changes into one commit. Commit as soon as a logical piece of work is done — e.g. drift re-adds, a skill/doc fix, and a new feature (like a layout file) are three separate commits, even within the same session. Never hold commits until the end of a session and squash them together.
