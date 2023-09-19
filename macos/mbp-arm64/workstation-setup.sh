#!/bin/bash
# Initial dev workstation setup script.

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/tommyc/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add tap required for things like Visual Studio
brew tap homebrew/cask-versions

# Install software using Homebrew (where available)
brew install --cask 1password
brew install --cask android-studio
brew install --cask arc
brew install --cask charles-beta
brew install --cask daisydisk
brew install --cask discord
brew install --cask docker
brew install --cask dotnet-sdk
brew install gifski
brew install --cask gimp
brew install git-lfs
brew install --cask gitkraken
brew install gnupg
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask inkscape
brew install --cask logi-options-plus
brew install mas
brew install --cask messenger
brew install --cask microsoft-remote-desktop
brew install --cask microsoft-teams
brew install node
brew install --cask parallels
brew install --cask postman
brew install --cask powershell
brew install ruby
brew install --cask slack
brew install --cask visual-studio
brew install --cask visual-studio-code
brew install --cask warp

# Install software using Mac App Store
mas install 497799835  # Xcode
mas install 441258766  # Magnet
mas install 1561788435 # Usage

# Install Xcode command line tools if necessary
xcode-select --install || true

# Remove Dock autohide animation delay
defaults write com.apple.dock autohide-delay -float 0; defaults delete com.apple.dock autohide-time-modifier

# Restart machine
echo "Software installation completed."
