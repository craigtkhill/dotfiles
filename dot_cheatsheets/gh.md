# gh

GitHub CLI.

## Pull Requests
| Command | Description |
|---------|-------------|
| `gh pr list` | list open PRs |
| `gh pr view` | view current branch PR |
| `gh pr view --web` | open PR in browser |
| `gh pr create` | create PR interactively |
| `gh pr checkout <number>` | checkout a PR locally |
| `gh pr merge` | merge current branch PR |
| `gh pr diff` | show PR diff |
| `gh pr checks` | show CI status for PR |
| `gh pr review --approve` | approve PR |
| `gh pr review --request-changes -b "comment"` | request changes |
| `gh pr close` | close PR |

## Issues
| Command | Description |
|---------|-------------|
| `gh issue list` | list open issues |
| `gh issue view <number>` | view issue |
| `gh issue create` | create issue interactively |
| `gh issue close <number>` | close issue |

## Repos
| Command | Description |
|---------|-------------|
| `gh repo view` | view current repo |
| `gh repo view --web` | open repo in browser |
| `gh repo clone <owner/repo>` | clone a repo |
| `gh repo fork` | fork current repo |

## Workflows (Actions)
| Command | Description |
|---------|-------------|
| `gh run list` | list recent workflow runs |
| `gh run view` | view latest run |
| `gh run watch` | watch run in progress |
| `gh workflow list` | list workflows |
| `gh workflow run <name>` | trigger a workflow |

## Releases
| Command | Description |
|---------|-------------|
| `gh release list` | list releases |
| `gh release view` | view latest release |
| `gh release create <tag>` | create a release |

## Misc
| Command | Description |
|---------|-------------|
| `gh auth status` | show auth status |
| `gh auth login` | authenticate |
| `gh config set git_protocol ssh` | set git protocol |
| `gh api <endpoint>` | call GitHub API |
| `gh search repos <query>` | search repositories |
