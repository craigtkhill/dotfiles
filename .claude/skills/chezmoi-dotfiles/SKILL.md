---
name: chezmoi-dotfiles
description: Manage dotfiles using chezmoi. Use when creating, modifying, or deploying dotfiles, shell functions, or configuration files in this repository.
---

# Chezmoi Dotfiles Management

This skill helps manage dotfiles using chezmoi in this repository.

## Critical Workflow

When creating or modifying dotfiles, you MUST follow this exact order:

1. **Create files in the dotfiles repository**
   - Use `dot_` prefix for dotfiles (e.g., `dot_gitconfig` → `~/.gitconfig`)
   - Preserve directory structure (e.g., `dot_config/fish/functions/` → `~/.config/fish/functions/`)

2. **Copy files to home directory first**
   ```bash
   cp dot_config/fish/functions/myfile.fish ~/.config/fish/functions/
   ```
   This step is REQUIRED because chezmoi cannot add files that don't exist in the target location.

3. **Add to chezmoi tracking**
   ```bash
   chezmoi add ~/.config/fish/functions/myfile.fish
   ```

4. **Verify it's managed**
   ```bash
   chezmoi managed | grep myfile
   ```

## Common Commands

- `chezmoi status` - Show what has changed
- `chezmoi diff` - Show detailed differences
- `chezmoi managed` - List all managed files
- `chezmoi apply` - Apply changes from dotfiles to home directory
- `chezmoi apply --force` - Force apply, overriding conflicts
- `chezmoi add <file>` - Add a file to chezmoi tracking
- `chezmoi re-add <file>` - Re-add a tracked file

## Fish Shell Specifics

Fish automatically loads functions from `~/.config/fish/functions/`. Each function must be in its own file named `functionname.fish`.

After adding new fish functions:
1. Copy to `~/.config/fish/functions/`
2. Functions are immediately available (fish auto-loads them)
3. No need to source or reload

## Common Mistakes

❌ **DON'T**: Create files only in dotfiles repo and run `chezmoi apply`
- This won't work because chezmoi can't track files that don't exist in the target location

✅ **DO**: Create in dotfiles repo → Copy to home → Add to chezmoi → Apply
