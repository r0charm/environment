# environment

Personal macOS dotfiles, linked into `$HOME` with [GNU Stow](https://www.gnu.org/software/stow/).

- **One mirror**: `home/` mirrors `$HOME`, and `./install` links it in place; edit a file here and the change is live.
- **Nothing personal tracked**: identity and network settings are read from files outside the repo, never committed.
- **One package list**: `Brewfile` installs every tool with `brew bundle`.

## Installation

Requires macOS with [Homebrew](https://brew.sh). The clone path is fixed: the zsh fragments are sourced from `~/dotfiles`.

```sh
git clone https://github.com/r0charm/environment ~/dotfiles
cd ~/dotfiles

# oh-my-zsh first (not brew-installable):
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# everything else, GNU Stow included:
brew bundle --file=Brewfile

# link the dotfiles into place:
./install
```

`./install` re-stows, so run it again after a pull that adds files.

## Personal and machine-specific config

Two files are read from outside the repo and are never committed:

- `~/.gitconfig.local`: your git `user.name` and `user.email`. Copy the template:

  ```sh
  cp gitconfig.local.example ~/.gitconfig.local
  ```

- `~/.config/dotfiles/proxy.local`: proxy environment variables, only needed behind a corporate proxy. See `custom/proxy` for the format.

## Layout

| Path | Holds |
| --- | --- |
| `home/` | Stowed to `$HOME`: nvim (LazyVim), tmux, ghostty, zed, ssh, zshrc, gitconfig |
| `custom/` | zsh fragments sourced by `.profile` and `.zshrc`: aliases, prompt, PATH, nvm |
| `Brewfile` | Packages and casks for `brew bundle` |

## What it does not do

- Work outside macOS: the Brewfile and paths assume it.
- Back up files already in `$HOME`: Stow refuses to overwrite a real file, so move it aside first.
