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
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# pipenv
export PIPENV_VENV_IN_PROJECT=1
export PIPENV_VERBOSITY=-1
