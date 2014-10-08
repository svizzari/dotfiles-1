# General
alias less="more"
alias reload="source ~/.zshrc"
alias ssho="/usr/bin/ssh"

ssh() {
  rsync -avz -e ssh --copy-links --progress ~/.tmux.conf $1:~/ > /dev/null 2>&1
  /usr/bin/ssh -A $* -t 'tmux a || tmux || `which zsh`'
}

# Ruby
alias be='bundle exec'
alias bi='bundle install --path vendor/bundle'
