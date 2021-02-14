#!/bin/bash

# install brew
if ! [ -x "$(command -v brew)" ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew upgrade

# taps
brew tap homebrew/cask-fonts

# Main tools
brew install zsh
brew install git
brew install tree
brew install wget
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
brew install --cask iterm2
brew install --cask transmission
brew install --cask smcfancontrol
brew install --cask dropbox
brew install --cask iina
brew install --cask typora
brew install --cask ngrok

# fonts
brew install --cask font-hack-nerd-font

brew cleanup