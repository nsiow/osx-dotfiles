# ~/.zshrc

source ~/.config/zsh/config.d/omz.zsh

for conf in $(ls "$HOME/.config/zsh/config.d/" | grep -E '\.zsh$'| grep -v omz); do
  source "$HOME/.config/zsh/config.d/${conf}"
done
unset conf

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
