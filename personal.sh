#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
# brew upgrade --all

brew install --cask --appdir="/Applications" whatsapp
brew install --cask --appdir="/Applications" telegram
# brew install --cask --appdir="/Applications" skype
brew install --cask --appdir="/Applications" google-drive
brew install --cask --appdir="/Applications" onedrive
brew install --cask --appdir="/Applications" vnc-viewer
brew install --cask --appdir="/Applications" spectacle

# Install Emacs
brew install --cask --appdir="/Applications" emacs
git clone https://github.com/oscartanner/emacs.git ~/.emacs.d
curl https://raw.githubusercontent.com/humitos/py-autoflake.el/master/py-autoflake.el > ~/.emacs.d/py-autoflake.el
curl https://raw.githubusercontent.com/humitos/buftra.el/master/buftra.el > ~/.emacs.d/buftra.el
