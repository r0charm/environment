# dotfiles

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).
`home/` mirrors `$HOME` and gets symlinked in place; `custom/` holds zsh
fragments sourced by `.zshrc`/`.profile` from a fixed `~/dotfiles` clone path.

## Setup

```sh
git clone <this repo> ~/dotfiles
cd ~/dotfiles

# Install oh-my-zsh first (not brew-installable):
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install everything else:
brew bundle --file=Brewfile

# Symlink dotfiles into place:
./install
```

## Personal / machine-specific config

Nothing personally identifying or network-specific is tracked in this repo.
Two files are read from outside the repo and are never committed:

- `~/.gitconfig.local` — your git `user.name`/`user.email`. Copy the template:
  ```sh
  cp gitconfig.local.example ~/.gitconfig.local
  ```
- `~/.config/dotfiles/proxy.local` — corporate/network proxy env vars, only
  needed if you're behind one. See `custom/proxy` for the expected format.

## Layout

- `home/` — stowed directly to `$HOME` (nvim/LazyVim, tmux, ghostty, zed, ssh, zshrc, gitconfig).
- `custom/` — zsh fragments sourced by `.profile`/`.zshrc` (aliases, prompt, PATH, nvm).
- `Brewfile` — package/cask list for `brew bundle`.
