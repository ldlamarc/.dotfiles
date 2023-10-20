# Why

Having config centralised in one versioned repository makes it easier to port across systems and recover.

# How

## Symlinking config

All config is stored in this repository and symlinked to the correct places with [GNU stow](https://dr563105.github.io/blog/manage-dotfiles-with-gnu-stow/).

```
brew install stow

make

# Other dependencies (might not be all)

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Various terminal tools
brew install tldr fzf powerlevel10k eza bat tmux ripgrep neovim fd lazygit jq
```


