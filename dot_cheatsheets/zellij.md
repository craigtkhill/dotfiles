# Zellij

Custom keybinds (defaults cleared) — `Ctrl g` locks/unlocks input.

## Global
| Key | Action |
|-----|--------|
| `Ctrl g` | toggle locked mode |
| `Ctrl q` | quit |
| `Alt n` | new pane |
| `Alt f` | toggle floating panes |
| `Alt h/j/k/l` | move focus (or tab, if at edge) |
| `Alt +/-/=` | resize |
| `Alt [` / `Alt ]` | previous/next swap layout |
| `Alt i` / `Alt o` | move tab left/right |

## Mode switches
| Key | Mode |
|-----|------|
| `Ctrl p` | pane |
| `Ctrl t` | tab |
| `Ctrl n` | resize |
| `Ctrl h` | move |
| `Ctrl s` | scroll |
| `Ctrl o` | session |
| `Ctrl b` | tmux |

## Pane mode
| Key | Action |
|-----|--------|
| `h/j/k/l` | move focus |
| `n` | new pane |
| `d` | new pane down |
| `r` | new pane right |
| `c` | rename pane |
| `e` | toggle embed/floating |
| `f` | toggle fullscreen |
| `i` | toggle pinned |
| `w` | toggle floating panes |
| `z` | toggle pane frames |
| `p` | switch focus |

## Tab mode
| Key | Action |
|-----|--------|
| `h/j/k/l` or arrows | prev/next tab |
| `1`-`9` | go to tab N |
| `n` | new tab |
| `r` | rename tab |
| `x` | close tab |
| `s` | sync tab (all panes) |
| `b` | break pane to new tab |
| `[` / `]` | break pane left/right |
| `tab` | toggle last active tab |

## Resize mode
| Key | Action |
|-----|--------|
| `h/j/k/l` | increase left/down/up/right |
| `H/J/K/L` | decrease left/down/up/right |
| `+` / `-` / `=` | increase/decrease |

## Move mode
| Key | Action |
|-----|--------|
| `h/j/k/l` | move pane direction |
| `n` / `tab` | move pane (cycle) |
| `p` | move pane backwards |

## Scroll mode
| Key | Action |
|-----|--------|
| `j/k` | scroll down/up |
| `Ctrl f` / `Ctrl b` | page down/up |
| `d` / `u` | half page down/up |
| `s` | enter search |
| `e` | edit scrollback |
| `Ctrl c` | scroll to bottom, exit |

## Session mode
| Key | Action |
|-----|--------|
| `w` | session manager |
| `p` | plugin manager |
| `c` | configuration |
| `a` | about |
| `d` | detach |

## Layouts
| Command | Action |
|---------|--------|
| `zellij --layout dev` | launch `dev` layout (claude + yazi panes) |
| `zellij action new-tab --layout dev` | open `dev` layout in a new tab |
