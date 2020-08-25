#!/bin/bash

# install brew
if ! [ -x "$(command -v brew)" ]; 
then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
        echo "brew already installed!"
fi

# symlink icloud code directory 
ln -sfv "$HOME/Documents/.code" ~
# install brew packages 
$DOTFILES_DIR/macos/brews.sh
# write macos defaults
$DOTFILES_DIR/macos/.defaults
