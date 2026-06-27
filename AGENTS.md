# Agents

Guidelines for AI agents working in this dotfiles repository.

## Before Any Work: Sync Chezmoi Drift

Always run this before editing or committing anything:

```bash
chezmoi status
```

If any files show drift, re-add them:

```bash
chezmoi re-add <drifted-file-target-path>
```

The pre-commit hook (`chezmoi-drift`) blocks all commits when the home directory files differ from the chezmoi source. Resolving drift first avoids commit failures mid-task.

After re-adding drifted files, also apply any hook fixes back to the home directory before committing:

```bash
chezmoi apply <target-path>
```

See `.claude/skills/chezmoi-dotfiles/SKILL.md` for the full workflow.
