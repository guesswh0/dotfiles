# Locale
export LANG=eu_US.UTF-8
export LC_ALL=en_US.UTF-8
export NLS_LANG=AMERICAN_AMERICA.AL32UTF8

# pyenv init
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init - --no-rehash zsh)"
  eval "$(pyenv virtualenv-init - zsh)"
fi