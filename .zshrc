# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source "$ZSH/oh-my-zsh.sh"

# ZSH Autosuggestions
source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh" ] && source "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh"
[ -s "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm" ] && source "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm"

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Obsidian vault
# Named directory: `cd ~vault`, tab-completion (`~vault/03<TAB>`), and the
# prompt abbreviates the long iCloud path to `~vault`.
hash -d vault="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal"
# `vault` jumps to the root; `vault 03 - Knowledge` jumps into a subdir.
vault() { cd ~vault/"${*:-}"; }

# Local overrides (not tracked in dotfiles)
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# Starship prompt (keep last)
eval "$(starship init zsh)"
