# general stuff
alias ls='ls -G'

# editing/sourcing configuration
alias conf-reload='source ~/.zshrc'
alias conf-edit-aliases='vim ~/.config/zsh/config.d/aliases.zsh'
alias conf-edit-zshrc='vim ~/.config/zsh/config.d/custom.zsh'
alias conf-edit-zplug='vim ~/.config/zsh/config.d/zplug.zsh'
alias conf-edit-work='vim ~/.config/zsh/config.d/work.zsh'
alias conf-edit-vimrc='vim ~/.config/nvim/init.vim'
alias conf-edit-emacs='e ~/.config/doom/init.el'

# Directory stuff
alias src='cd ~/src'

# Copy/paste
alias c='pbcopy'
alias p='pbpaste'

# vim stuff
alias vim='nvim'

# emacs stuff
function emacs-restart() {
  killall Emacs-arm64-11 || :
}
function emacs-start-daemon() {
  pgrep Emacs-arm64-11 || emacs --daemon && pgrep Emacs-arm64-11
}
function emacs-edit() {
  emacs-start-daemon && emacsclient -nw "$@"
}
alias e='emacs-edit'

# functions
alias py2js='python3 -c "import ast, json, sys; print(json.dumps(ast.literal_eval(sys.stdin.read())))"'
