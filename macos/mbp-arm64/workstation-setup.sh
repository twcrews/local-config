#!/bin/bash
# Initial dev workstation setup script.

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/tommyc/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add third party taps
brew tap deskflow/tap
brew tap shaunsingh/sfmono-nerd-font-ligaturized

# Install formulae
brew install cocoapods
brew install colima
brew install displayplacer
brew install docker
brew install docker-compose
brew install gifski
brew install mas
brew install p7zip

# Install casks
brew install --cask 1password
brew install --cask adguard
brew install --cask android-studio
brew install --cask arc
brew install --cask azure-data-studio
brew install --cask balenaetcher
brew install --cask bruno
brew install --cask daisydisk
brew install --cask deskflow
brew install --cask figma
brew install --cask font-sf-mono-nerd-font-ligaturized
brew install --cask gimp
brew install --cask inkscape
brew install --cask logi-options+
brew install --cask maccy
brew install --cask microsoft-auto-update
brew install --cask microsoft-office
brew install --cask microsoft-teams
brew install --cask mitmproxy
brew install --cask obsidian
brew install --cask parallels
brew install --cask sf-symbols
brew install --cask slack
brew install --cask visual-studio-code
brew install --cask warp

# Install software using Mac App Store
mas install 497799835   # Xcode
mas install 1561788435  # Usage

# Install Xcode command line tools if necessary
xcode-select --install || true
brew install xcparse

# Customize Dock
defaults write com.apple.Dock autohide 1
defaults write com.apple.Dock autohide-delay -float 0 
defaults delete com.apple.Dock autohide-time-modifier
defaults write com.apple.Dock size-immutable -bool yes
killall Dock

# Disable restoring windows on reboot
defaults write -g ApplePersistence -bool no

# Finish
echo "Software installation completed. A reboot may be necessary."
