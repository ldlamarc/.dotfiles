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
brew install tldr fzf powerlevel10k eza bat tmux ripgrep neovim fd lazygit jq zoxide zsh-autosuggestions gh
```
## Various other installing/configuring

- Configure and log in for gh tool
- [Terminal syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#in-your-zshrc)
- Try to disable motion when switching spaces and mapping them to Ctrl-1-10.
- See yabairc to change default space->app mappings
- Configure Alfred/Spotlight to search apps/sites/bookmarks/internet history 
- Recommended to map caps lock to ctrl

# Cheatsheet

- Neovim: leader is space
- Tmux: leader is Ctrl-a
- VSCode: leader can be space (neovim extenstion normal mode), ctrl-a (tmux like commands) or ctrl (custom)/cmd (default). 

Neovim/VSCode n means normal mode.

Be sure to configure the locations of your project directories well. See bin/tmux-sessionizer.

Not all keymaps listed. Check config/\<leader\>pk.

## Navigation

| Environment | Command | Description |
| ----------- | ----------- | ----------- | 
| OS X | alt+space | apps/internet/bookmarks/history |
| OS X | ctrl+1-9 | spaces (with fixed apps) |
| OS X | alt+f | focus windows |
| Neovim n | ctrl+f | projects |
| Tmux | \<leader\>f | projects |
| Tmux/VSC | \<leader\>1-9 | go to window |
| Neovim n/Tmux/VSC | ctrl+h/j/k/l | navigate panes |
| Neovim n/VSC | \<leader\>pf | files |
| Neovim n/VSC | \<leader\>pg | project content |
| Neovim n/VSC | \<leader\>pk | keymappings |
| Neovim n/VSC | \<leader\>pp | commands |
| Neovim n/VSC | \<leader\>h/j/k/l | go to marked location |
| Neovim n/VSC | \<leader\>e | parent directory |
| Neovim n/VSC | \<leader\>x | plugins/extensions |
| Neovim n | s\<char\>\<char\> | leap to word in file |
| Neovim v | x\<char\>\<char\> | leap to word in file |

## Organisation

| Environment | Command | Description |
| ----------- | ----------- | ----------- | 
| OS X | alt+m | move windows | 
| Tmux/VSC | \<leader\>w  | list windows (del: x) | 
| Tmux/VSC | \<leader\>c  | new window | 
| Tmux | \<leader\>j/l  | split h/v | 
| Neovim n/VSC | \<leader\>sj/l  | split h/v | 
| Neovim n/VSC | \<leader\>sj/l  | split h/v | 
| Neovim ntwr | % | create file | 
| VSC | cmd+n | create file | 
| Neovim ntwr | d | create directory | 
| Neovim n/VSC | \<leader\>uu | manage marked locations |
| Neovim n/VSC | \<leader\>a | mark location |

## Editing

Basic vim and (in nvim):
- vim-surround
- vim-commentary

## Running

| Environment | Command | Description |
| ----------- | ----------- | ----------- | 
| VSC n | \<leader\>tac | copilot chat | 
| VSC n | \<leader\>ts | Run all servers | 
| VSC n | \<leader\>tg | Run guard | 

# Git

See:
- lazygit (terminal), press ? for keybindings
- vim-fugitive (nvim), 

| Environment | Command | Description |
| ----------- | ----------- | ----------- | 
| Neovim n/VSC | \<leader\>gl  | git log (navigate with leaderJ-K, back with ctrl-o)| 
| Neovim n/VSC | \<leader\>gbpr | open GH PR of line in web | 
| Neovim n | \<leader\>gbco  | open commit of line in web | 

# Debug / Profile

- Neovim :Lazy (see how much time each plugin took)
- hyperfine "nvim . --headless +qa" --warmup 10 
- Neovim: :LspInfo
- Neovim: :checkhealth
