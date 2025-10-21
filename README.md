# Dotfiles

Personal development environment configuration with automated setup and security scanning.

## Features

- **Fish Shell Configuration** - Modern shell with intelligent autocompletions and syntax highlighting
- **Automated Installation** - One-command setup using chezmoi
- **Cross-Platform** - Works on macOS, Linux, and Windows
- **Automated Package Installation** - Homebrew and packages installed automatically
- **Security Scanning** - Pre-commit hooks prevent accidental leaks of secrets and personal information

## Quick Start

Install your dotfiles on a new machine:

```bash
# Install chezmoi and apply dotfiles in one command
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply craigtkhill

# Or if chezmoi is already installed:
chezmoi init --apply craigtkhill
```

The installation will:
1. Clone this repository
2. Install Homebrew (if not already installed)
3. Install all packages from the Brewfile
4. Set up Fish shell configuration
5. Configure Git settings

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

## Security

This repository implements comprehensive security measures:

- **Secret Detection** - Gitleaks integration catches API keys, tokens, and credentials
- **Personal Data Protection** - Automated detection of personal paths and email addresses
- **Pre-commit Validation** - All commits are scanned before they reach version control

## License

MIT License - see [LICENSE.md](LICENSE.md) for details.
