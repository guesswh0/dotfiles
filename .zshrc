ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=()
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR=white
SPACESHIP_BATTERY_SHOW=false

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

ENABLE_CORRECTION=false

plugins=(
  git
  pyenv
  command-not-found
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/.aliases
source $HOME/.dotfiles/.functions
if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
