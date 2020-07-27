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
brew upgrade --all

brew cask install --appdir="/Applications" whatsapp
brew cask install --appdir="/Applications" telegram
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" google-backup-and-sync

# Install Emacs
brew cask install emacs
git clone git@github.com:oscartanner/emacs.git ~/.emacs.d
