#!/bin/bash

# install brew
if ! [ -x "$(command -v brew)" ]; 
then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
        echo "brew already installed!"
fi

$DOTFILES_DIR/macos/brews.sh
$DOTFILES_DIR/macos/.defaults
