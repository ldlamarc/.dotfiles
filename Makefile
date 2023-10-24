.PHONY: stow
TARGET_DIR := ${HOME}
# Add any directories you want to link here
STOW_FOLDERS := zsh yabai nvim skhd tmux bin p10k tmuxinator

stow:
	@stow -v 2 -t ${TARGET_DIR} ${STOW_FOLDERS}
