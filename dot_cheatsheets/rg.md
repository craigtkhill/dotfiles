# ripgrep (rg)

## Basic Usage
| Command | Description |
|---------|-------------|
| `rg pattern` | search in current directory |
| `rg pattern path/` | search in specific directory |
| `rg pattern file` | search in specific file |

## Common Flags
| Flag | Description |
|------|-------------|
| `-i` | case-insensitive (overrides smart-case) |
| `-l` | list matching files only |
| `-c` | count matches per file |
| `-n` | show line numbers |
| `-w` | match whole words only |
| `-v` | invert match |
| `-A n` | show n lines after match |
| `-B n` | show n lines before match |
| `-C n` | show n lines before and after match |

## File Filtering
| Flag | Description |
|------|-------------|
| `-t py` | search only Python files |
| `-T py` | exclude Python files |
| `-g '*.fish'` | include glob pattern |
| `-g '!*.lock'` | exclude glob pattern |

## Defaults (from ripgreprc)
- `--smart-case` — case-insensitive unless pattern has uppercase
- `--hidden` — searches hidden files and directories
- `--glob=!.git` — always excludes .git directory
