# User specific profile for interactive zsh shells.

ZSH_THEME="agnoster"
DEFAULT_USER="$(whoami)"

plugins=(
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
