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

## Install

```sh
# Install everything from Brewfile
brew bundle
```

## Dependencies

### Shell

```sh
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install zsh-autosuggestions nvm starship gh
```

### Obsidian

1. Install [Obsidian](https://obsidian.md)
2. Enable the CLI: **Settings → General → Enable Command Line Interface**

> If you don't use Obsidian, remove this line from `~/.zprofile`:
> ```zsh
> export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"
> ```

### Claude Code

```sh
brew install claude
```

Install plugins from the Claude Code command palette (`/plugins`):

| Plugin | Marketplace |
|--------|-------------|
| `superpowers` | `obra/superpowers-marketplace` |
| `code-review` | `claude-plugins-official` |
| `code-simplifier` | `claude-plugins-official` |
| `playwright` | `claude-plugins-official` |
| `claude-md-management` | `claude-plugins-official` |
| `skill-creator` | `claude-plugins-official` |
| `obsidian` | `kepano/obsidian-skills` |

## Structure

Files are stored relative to `$HOME`. yadm maps them directly — `.zshrc` in the repo lives at `~/.zshrc`.
