#!/bin/bash

# symlink icloud code directory 
ln -sfv "$HOME/Documents/.code" ~

# install brew packages 
$DOTFILES_DIR/macos/brews.sh

# write macos defaults
$DOTFILES_DIR/macos/.defaults
