# Dotfiles

Personal development environment configuration with automated setup and security scanning.

## Features

- **Fish Shell Configuration** - Modern shell with intelligent autocompletions and syntax highlighting
- **Automated Installation** - One-command setup using chezmoi
- **Cross-Platform** - Works on macOS and Linux
- **Automated Package Installation** - Homebrew (macOS), Flatpak (Linux), and Cargo (both)
- **Security Scanning** - Pre-commit hooks prevent accidental leaks of secrets and personal information

## Quick Start

Install your dotfiles on a new machine:

```bash
# Install chezmoi and apply dotfiles in one command
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply craigtkhill

# Or if chezmoi is already installed:
chezmoi init --apply craigtkhill
```

## Manual Installation

If you prefer to review before applying:

```bash
# Initialize without applying
chezmoi init craigtkhill

# Review what will change
chezmoi diff

# Apply the changes
chezmoi apply
```

## Package Management

Cross-platform commands are available for managing packages:

- `update` - Update package lists
- `outdated` - Show outdated packages across all package managers
- `upgrade` - Upgrade all packages
- `cleanup` - Clean up old versions and unused packages

These commands automatically detect which package managers are available on your system.

## Security

This repository implements comprehensive security measures:

- **Secret Detection** - Gitleaks integration catches API keys, tokens, and credentials
- **Personal Data Protection** - Automated detection of personal paths and email addresses
- **Pre-commit Validation** - All commits are scanned before they reach version control

## License

MIT License - see [LICENSE.md](LICENSE.md) for details.
