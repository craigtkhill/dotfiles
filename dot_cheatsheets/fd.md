# fd

Fast alternative to `find`.

## Basic Usage
| Command | Description |
|---------|-------------|
| `fd pattern` | search for pattern in current directory |
| `fd pattern path/` | search in specific directory |
| `fd` | list all files recursively |

## Common Flags
| Flag | Description |
|------|-------------|
| `-t f` | files only |
| `-t d` | directories only |
| `-t l` | symlinks only |
| `-e ext` | filter by extension (e.g. `-e js`) |
| `-H` | include hidden files |
| `-I` | include ignored files (.gitignore) |
| `-l` | long listing format |
| `-x cmd` | execute command for each result |
| `-X cmd` | execute command with all results at once |

## Examples
| Command | Description |
|---------|-------------|
| `fd -e fish` | find all .fish files |
| `fd -t d config` | find directories named config |
| `fd -H .env` | find hidden .env files |
| `fd -x bat` | preview all results with bat |
