#!/bin/bash
# Initial dev workstation setup script.

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/tommyc/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add third party taps
brew tap azure/functions
brew tap chargepoint/xcparse
brew tap isen-ng/dotnet-sdk-versions
brew tap shaunsingh/sfmono-nerd-font-ligaturized

# Install formulae and casks
brew install --cask 1password
brew install --cask adguard
brew install --cask android-studio
brew install angular-cli
brew install azure-functions-core-tools@4
brew install --cask arc
brew install --cask audacity
brew install --cask azure-data-studio
brew install --cask balenaetcher
brew install bitrise
brew install --cask bruno
brew install cmake
brew install cocoapods
brew install --cask daisydisk
brew install --cask discord
brew install --cask docker
brew install --cask dotnet-sdk
brew install --cask dotnet-sdk6-0-400
brew install --cask font-sf-mono-nerd-font-ligaturized
brew install --cask font-smoothing-adjuster
brew install --cask gimp
brew install git-lfs
brew install --cask gitkraken
brew install gh
brew install gnupg
brew install go
brew install --cask google-chrome
brew install --cask inkscape
brew install --cask linearmouse
brew install --cask logi-options-plus
brew install --cask maccy
brew install mas
brew install --cask messenger
brew install --cask microsoft-remote-desktop
brew install --cask microsoft-teams
brew install --cask mitmproxy
brew install node
brew install p7zip
brew install --cask parallels
brew install --cask powershell
brew install ruby
brew install --cask slack
brew install swift-format
brew install --cask visual-studio-code
brew install --cask vnc-viewer
brew install --cask warp
brew install wget
brew install xcbeautify
brew install xcparse

# Install software using Mac App Store
mas install 497799835  # Xcode
mas install 441258766  # Magnet
mas install 1561788435 # Usage

# Install Xcode command line tools if necessary
xcode-select --install || true

# Customize Dock
defaults write com.apple.Dock autohide 1
defaults write com.apple.dock autohide-delay -float 0 
defaults delete com.apple.dock autohide-time-modifier
defaults write com.apple.dock size-immutable -bool yes
killall Dock

# Append .zshrc commands
echo "\n# Load Angular CLI autocompletion.\nautoload -Uz compinit\ncompinit\nsource <(ng completion script)" >> ~/.zshrc
echo "\n# Create command aliases\nalias simctl="xcrun simctl"\nalias dc="docker compose"" >> ~/.zshrc

# Finish
echo "Software installation completed. A reboot may be necessary."
