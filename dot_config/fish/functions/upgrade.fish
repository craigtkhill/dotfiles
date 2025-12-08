function upgrade -d "Upgrade all packages for brew, flatpak, and cargo"
    if command -v brew >/dev/null
        echo "Upgrading Homebrew packages..."
        brew upgrade
    end

    if command -v flatpak >/dev/null
        echo "Upgrading Flatpak packages..."
        flatpak update -y
    end

    if command -v cargo-install-update >/dev/null
        echo "Upgrading Cargo packages..."
        cargo install-update -a
    end
end
