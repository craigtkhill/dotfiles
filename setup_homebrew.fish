#!/usr/bin/env fish

echo "starting homebrew setup"

# Check if Homebrew is already installed
if not command -v brew > /dev/null
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" < /dev/tty
else
    echo "Homebrew already installed, skipping installation"
end

brew install httpie
brew install bat
