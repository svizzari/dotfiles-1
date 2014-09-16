# General
alias reload="source ~/.zshrc"
alias ssho="/usr/bin/ssh"

ssh() {
  /usr/bin/ssh $* -t 'tmux a || tmux || /usr/bin/zsh'
}

# Ruby
alias be='bundle exec'
alias bi='bundle install --path vendor/bundle'
