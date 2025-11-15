function cleanup -d "Clean up old versions for brew and cargo"
    brew cleanup
    cargo cache -a
end
