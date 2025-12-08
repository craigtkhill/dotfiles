function cleanup -d "Clean up old versions for brew, flatpak, and cargo"
    if command -v brew >/dev/null
        echo "Cleaning up Homebrew..."
        brew cleanup
    end

    if command -v flatpak >/dev/null
        echo "Cleaning up Flatpak..."
        flatpak uninstall --unused -y
    end

    if command -v cargo-cache >/dev/null
        echo "Cleaning up Cargo cache..."
        cargo cache -a
    end
end
