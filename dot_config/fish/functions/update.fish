function update -d "Update package lists for brew, flatpak, and cargo"
    if command -v brew >/dev/null
        echo "Updating Homebrew..."
        brew update
    end

    if command -v flatpak >/dev/null
        echo "Updating Flatpak..."
        flatpak update
    end

    if command -v cargo-install-update >/dev/null
        echo "Checking cargo packages..."
        cargo install-update -l
    end
end
