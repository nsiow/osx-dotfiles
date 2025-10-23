.DEFAULT_GOAL = install

# ------------------------------------------------------------
#  Utilities
# ------------------------------------------------------------

.PHONY: brew-install-%
brew-install-%: brew
	@brew install --quiet $*
	@echo '[✓] Installed: $*'

.PHONY: brew-cask-%
brew-cask-%: brew
	@brew install --cask --quiet $*
	@echo '[✓] Installed: $*'

# ------------------------------------------------------------
#  Meta-targets
# ------------------------------------------------------------

.PHONY: install
install: pre packages files commands

# ------------------------------------------------------------
#  Prerequisites
# ------------------------------------------------------------

.PHONY: pre
pre: brew

.PHONY: brew
brew:
	@which brew >/dev/null \
	  && echo '[✓] Homebrew already installed' \
	  || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ------------------------------------------------------------
#  Packages
# ------------------------------------------------------------

.PHONY: packages
packages: \
	brew-cask-docker \
	brew-install-fd \
	brew-install-fzf \
	brew-install-gh \
	brew-install-go \
	brew-install-minikube \
	brew-install-neovim \
	brew-install-node \
	brew-install-pyenv \
	brew-install-ripgrep \
	brew-install-tree

# ------------------------------------------------------------
#  Filesystem
# ------------------------------------------------------------

.PHONY: files
files:
	@# Set up some base directories
	@mkdir -p ~/src
	@mkdir -p ~/.config

	@# Set up zshrc
	@ln -sf $$(pwd)/root/.zshrc ~/.zshrc

	@# Set up .config directories
	@ls root/.config | xargs -I{} bash -c 'rm -f ~/.config/{} && ln -s $$(pwd)/root/.config/{} ~/.config/{}'

	@echo '[✓] Bootstrapped filesystem'

# ------------------------------------------------------------
#  Commands
# ------------------------------------------------------------

.PHONY: commands
commands:
	@echo '[✓] Ran setup commands'
