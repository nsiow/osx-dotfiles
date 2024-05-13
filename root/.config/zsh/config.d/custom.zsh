# general stuff
export CLICOLOR=1
zstyle ':completion:*' menu select

# path stuff
export PATH="$PATH:/opt/homebrew/bin"

# emacs stuff
export PATH="$PATH:/Users/nsiow/.config/emacs/bin"

# fzf
eval "$(fzf --zsh)"

# shared history
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY 
setopt HIST_IGNORE_ALL_DUPS
export HISTFILE=~/.zsh_history
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE

# go stuff
# export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export PATH="$PATH:$(go env GOPATH)/bin:${GOROOT}/bin"

# python stuff
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/Users/nsiow/.local/bin:$PATH"
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# ruby stuff
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(brew --prefix)/lib/ruby/gems/3.2.0/bin:$PATH"

# aws stuff
export AWS_REGION=us-west-2
export AWS_DEFAULT_REGION=us-west-2

# jq stuff
alias urlencode='jq -Sr @uri'
