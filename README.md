# Dotfiles

Personal development environment configuration with automated setup and security scanning.

## Features

- **Fish Shell Configuration** - Modern shell with intelligent autocompletions and syntax highlighting
- **Automated Installation** - One-command setup using Dotbot
- **Security Scanning** - Pre-commit hooks prevent accidental leaks of secrets and personal information

## Quick Start

```bash
git clone https://github.com/craigtkhill/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install
```

## Security

This repository implements comprehensive security measures:

- **Secret Detection** - Gitleaks integration catches API keys, tokens, and credentials
- **Personal Data Protection** - Automated detection of personal paths and email addresses
- **Pre-commit Validation** - All commits are scanned before they reach version control

## License

MIT License - see [LICENSE.md](LICENSE.md) for details.
