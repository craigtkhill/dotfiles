set -x PATH /opt/homebrew/bin /usr/local/bin $PATH
starship init fish | source
zoxide init fish | source

# Use bat for syntax highlighting in man pages
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x MANROFFOPT "-c"
