.DEFAULT_GOAL = setup

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

.PHONY: setup
setup: files prerequisites core-packages other-random-dev-packages

# ------------------------------------------------------------
#  Prerequisites
# ------------------------------------------------------------

.PHONY: prerequisites
prerequisites: brew

.PHONY: brew
brew:
	@which brew >/dev/null \
	  && echo '[✓] Homebrew already installed' \
	  || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ------------------------------------------------------------
#  Packages
# ------------------------------------------------------------

.PHONY: core-packages
core-packages: \
	brew-cask-docker \
	brew-install-golang \
	brew-install-neovim \
	brew-install-node \
	brew-install-starship \
	brew-install-the_silver_searcher \
	brew-install-zplug

.PHONY: neovim
neovim: brew-install-neovim

.PHONY: starship
starship: brew-install-starship

.PHONY: zplug
zplug: brew-install-zplug

.PHONY: golang
golang: brew-install-golang brew-install-golangci-lint

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
