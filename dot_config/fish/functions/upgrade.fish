function upgrade -d "Upgrade all packages for brew, flatpak, and cargo"
    if command -v brew >/dev/null
        echo "Upgrading Homebrew packages..."
        env NONINTERACTIVE=1 brew upgrade
        echo "Upgrading Homebrew casks..."
        env NONINTERACTIVE=1 brew upgrade --cask
        if command -v gh >/dev/null
            for spec in "alacritty/alacritty:Alacritty-*.dmg:Alacritty" "marktext/marktext:marktext-mac-arm64-*.dmg:MarkText"
                set -l p (string split : $spec)
                set -l tag (gh release view -R $p[1] --json tagName -q .tagName | string replace -r '^v' '')
                set -l cur (defaults read /Applications/$p[3].app/Contents/Info CFBundleShortVersionString 2>/dev/null)
                test -n "$tag"; and test "$tag" != "$cur"; or continue
                echo "Upgrading $p[3] $cur -> $tag (GitHub release)..."
                set -l tmp (mktemp -d)
                gh release download -R $p[1] -p $p[2] -D $tmp; or continue
                set -l mnt $tmp/mnt
                mkdir $mnt
                diskutil image attach --readOnly --nobrowse --mountPoint $mnt $tmp/*.dmg >/dev/null; or continue
                rm -rf /Applications/$p[3].app
                cp -R "$mnt/$p[3].app" /Applications/
                diskutil eject $mnt >/dev/null
                xattr -dr com.apple.quarantine /Applications/$p[3].app
                rm -rf $tmp
            end
        end
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
