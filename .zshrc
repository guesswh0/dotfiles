ZSH_THEME="agnoster"
DEFAULT_USER="$(whoami)"

plugins=(
  git
  pyenv
  pip
  python
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
ENABLE_CORRECTION=false

source $ZSH/oh-my-zsh.sh

# removes host@user from prompt to default user
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}