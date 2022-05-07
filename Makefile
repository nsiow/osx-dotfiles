.DEFAULT_GOAL = setup

# ------------------------------------------------------------
#  Utilities
# ------------------------------------------------------------

BREW_INSTALL = brew install --quiet
INSTALL_MSG  = echo '[✓] Installed:'

.PHONY: brew-install-%
brew-install-%: brew
	@$(BREW_INSTALL) $*
	@$(INSTALL_MSG) $*

# ------------------------------------------------------------
#  Meta-targets
# ------------------------------------------------------------

.PHONY: setup
setup: files brew neovim zplug other-random-dev-packages

# ------------------------------------------------------------
#  Prerequisites
# ------------------------------------------------------------

.PHONY: brew
brew:
	@which brew >/dev/null \
	  && echo '[✓] Homebrew already installed' \
	  || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ------------------------------------------------------------
#  Packages
# ------------------------------------------------------------

.PHONY: neovim
neovim: brew-install-neovim

.PHONY: starship
starship: brew-install-starship

.PHONY: zplug
zplug: brew-install-zplug

.PHONY: other-random-dev-packages
other-random-dev-packages: brew-install-ripgrep brew-install-tree

# ------------------------------------------------------------
#  Filesystem
# ------------------------------------------------------------

.PHONY: files
files:
	@# Set up some base directories
	@mkdir -p ~/src
	@mkdir -p ~/.config

	@# Set up zshrc
	@ln -f $$(pwd)/root/.zshrc ~/.zshrc

	@# Set up .config directories
	@ls root/.config | xargs -I{} bash -c 'rm -f ~/.config/{} && ln -s $$(pwd)/root/.config/{} ~/.config/{}'

	@echo '[✓] Bootstrapped filesystem'
