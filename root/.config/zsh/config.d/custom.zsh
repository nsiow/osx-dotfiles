# general stuff
export CLICOLOR=1

# shared history
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY 
setopt HIST_IGNORE_ALL_DUPS
export HISTFILE=~/.zsh_history
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE

# go stuff
export GOPATH="$HOME/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
