skip_global_compinit=1

# dotfiles
export DOTFILES_DIR=$HOME/.dotfiles
source $HOME/.dotfiles/.aliases
source $HOME/.dotfiles/.functions

# OS specific exports
if [ "$(uname -s)" = "Darwin" ]; then 
    source $DOTFILES_DIR/macos/.exports
    source $DOTFILES_DIR/macos/.aliases
else
    source $DOTFILES_DIR/ubuntu/.exports
    source $DOTFILES_DIR/ubuntu/.aliases
fi

# ZSH
export ZSH=$HOME/.oh-my-zsh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# pipenv
export PIPENV_VENV_IN_PROJECT=1

# Locale
export LANG=eu_US.UTF-8
export LC_ALL=en_US.UTF-8
export NLS_LANG=AMERICAN_AMERICA.AL32UTF8
