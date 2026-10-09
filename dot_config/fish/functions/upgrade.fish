function upgrade -d "Upgrade all packages for brew, flatpak, and cargo"
    if command -v brew >/dev/null
        sudo -v
        sh -c 'while kill -0 $PPID 2>/dev/null; do sudo -n true; sleep 50; done' </dev/null >/dev/null 2>&1 &
        set -l sudo_keepalive_pid $last_pid

        echo "Upgrading Homebrew packages..."
        env NONINTERACTIVE=1 brew upgrade
        echo "Upgrading Homebrew casks..."
        env NONINTERACTIVE=1 brew upgrade --cask

        kill $sudo_keepalive_pid 2>/dev/null
    end

    if command -v flatpak >/dev/null
        echo "Upgrading Flatpak packages..."
        flatpak update -y
    end

    if command -v cargo-install-update >/dev/null
        echo "Upgrading Cargo packages..."
        cargo install-update -a
    end

    if command -v rustup >/dev/null
        echo "Updating Rust stable toolchain..."
        rustup update stable
    end
end
