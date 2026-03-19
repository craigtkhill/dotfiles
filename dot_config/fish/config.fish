fish_add_path $HOME/.local/bin
starship init fish | source
zoxide init fish | source
fzf --fish | source
direnv hook fish | source

# Ripgrep
set -x RIPGREP_CONFIG_PATH ~/.config/ripgrep/ripgreprc

# Editor
set -x EDITOR nvim
set -x VISUAL nvim

# Use bat for syntax highlighting in man pages
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x MANROFFOPT -c
