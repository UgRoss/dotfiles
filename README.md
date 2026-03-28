# dotfiles

Personal dotfiles managed with [yadm](https://yadm.io).

## Setup

```sh
# Install yadm (macOS)
brew install yadm

# Clone the dotfiles
yadm clone git@github.com:UgRoss/dotfiles.git
```

## Usage

```sh
# Track a new file
yadm add ~/.someconfig

# Commit changes
yadm commit -m "update someconfig"

# Push
yadm push
```

## Dependencies

### Shell

```sh
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install zsh-autosuggestions nvm starship
```

## Structure

Files are stored relative to `$HOME`. yadm maps them directly — `.zshrc` in the repo lives at `~/.zshrc`.
