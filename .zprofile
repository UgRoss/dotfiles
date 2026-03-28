# Homebrew (sets HOMEBREW_PREFIX and updates PATH)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Obsidian CLI — requires "Enable Command Line Interface" in Settings → General
export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"
