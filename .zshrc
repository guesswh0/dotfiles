ZSH_THEME="agnoster"
DEFAULT_USER="$(whoami)"

plugins=(
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
ENABLE_CORRECTION=false

source $ZSH/oh-my-zsh.sh
