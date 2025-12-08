function outdated -d "Show outdated packages for brew, flatpak, and cargo"
    if command -v brew >/dev/null
        echo "Homebrew outdated packages:"
        brew outdated
    end

    if command -v flatpak >/dev/null
        echo "Flatpak outdated packages:"
        flatpak remote-ls --updates
    end

    if command -v cargo-install-update >/dev/null
        echo "Cargo outdated packages:"
        cargo install-update -l
    end
end
