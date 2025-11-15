function outdated -d "Show outdated packages for brew and cargo"
    brew outdated
    cargo install-update -l
end
