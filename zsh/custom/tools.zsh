# Boxen
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Coreutils
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# RBENV
eval "$(rbenv init -)"