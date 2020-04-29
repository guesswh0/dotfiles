#!/bin/bash

brew update
brew upgrade

# taps
brew tap homebrew/cask-fonts

# Main tools
brew install zsh
brew install git
brew install tree
brew install wget
brew install brew-cask-completion
brew install source-highlight

# Additional utilities
brew install moreutils
brew install coreutils

# Build tools
brew install cmake
brew install pkg-config
brew install readline

# Python
brew install python

# Applications
brew cask install iterm2
brew cask install transmission
brew cask install smcfancontrol
brew cask install dropbox
brew cask install iina

# fonts
brew cask install font-hack-nerd-font

brew cleanup