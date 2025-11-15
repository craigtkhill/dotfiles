function update -d "Update package lists for brew and cargo"
    brew update
    cargo install-update -l
end
