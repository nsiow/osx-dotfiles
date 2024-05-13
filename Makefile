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

BREW_INSTALL_SCRIPT ?= \
  https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

.PHONY: brew
brew:
	@which brew >/dev/null \
	  && echo '[✓] Homebrew already installed' \
	  || /bin/bash -c "$$(curl -fsSL $(BREW_INSTALL_SCRIPT))"

# ------------------------------------------------------------
#  Packages
# ------------------------------------------------------------

.PHONY: core-packages
core-packages: \
	docker \
	kitty \
	golang \
	neovim \
	zplug

.PHONY: docker
docker: brew-cask-docker

.PHONY: kitty
kitty: brew-cask-kitty

.PHONY: neovim
neovim: brew-install-neovim

.PHONY: golang
golang: brew-install-golang brew-install-golangci-lint

.PHONY: zplug
zplug: brew-install-zplug

.PHONY: other-random-dev-packages
other-random-dev-packages: \
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
	@ls root/.config | xargs -I{} bash -c ' && ln -s $$(pwd)/root/.config/{} ~/.config/{}'

	@echo '[✓] Bootstrapped filesystem'
