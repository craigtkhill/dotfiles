function upgrade -d "Upgrade all packages for brew and cargo"
    brew upgrade
    cargo install-update -a
end
