# Why

Having config centralised in one versioned repository makes it easier to port across systems and recover.

# How

## Symlinking config

All config is stored in this repository and symlinked to the correct places with [GNU stow](https://dr563105.github.io/blog/manage-dotfiles-with-gnu-stow/).

```
brew install stow

bash install.sh
```


