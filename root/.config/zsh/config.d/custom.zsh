# general stuff
export CLICOLOR=1
zstyle ':completion:*' menu select

# emacs stuff
export PATH="$PATH:/Users/nsiow/.config/emacs/bin"

# fzf
eval "$(fzf --zsh)"

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
