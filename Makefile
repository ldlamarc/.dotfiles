.PHONY: stow
TARGET_DIR := ${HOME}
# Add any directories you want to link here
STOW_FOLDERS := zsh yabai nvim

stow:
	@stow -v 2 -t ${TARGET_DIR} ${STOW_FOLDERS}
