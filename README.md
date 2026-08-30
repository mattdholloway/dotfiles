# Matt's Dotfiles

My personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## 🚀 Features

### Shell Configuration
- **Fish Shell** with oh-my-posh (spaceship theme)
- **Atuin** - Enhanced shell history with sync
- **Zoxide** - Smart directory jumping with `z`
- **fzf** - Fuzzy finder with custom key bindings
- **direnv** - Auto-load environment variables per directory

### Modern CLI Tools
- **eza** - Modern `ls` replacement with git integration
- **bat** - `cat` with syntax highlighting
- **delta** - Beautiful git diffs
- **ripgrep** - Fast grep alternative
- **fd** - Fast find alternative
- **btop** - Beautiful system monitor
- **duf** - Better disk usage display
- **dust** - Better directory size analyzer
- **procs** - Modern process viewer
- **lazygit** - Terminal UI for git
- **sd** - Better sed for find/replace
- **hyperfine** - Benchmarking tool
- **tldr** - Simplified man pages

### Development Tools
- **mise** - Runtime version manager (node, rust, go, python, ruby, deno)
- **Git** with delta integration and sensible defaults
- **GitHub CLI** (gh) configuration

## 📦 Installation

### Bootstrap on a new machine

1Password first (SSH agent), then Homebrew, then this repo, then the Brewfile.

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Sign in to 1Password, enable Settings → Developer → Use SSH agent
brew install --cask 1password
brew install 1password-cli

# Dotfiles (fish, git, mise, atuin, nvim, iTerm prefs, Brewfile)
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply mattdholloway

# All CLI tools and casks
brew bundle --file ~/Brewfile

# Fish as login shell
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

## ⚡ Key Features

### Aliases
- `cat` → `bat` (syntax highlighting)
- `ls` → `eza --icons` (beautiful file listings)
- `ll` → `eza -l --icons --git` (long format with git status)
- `top` → `btop` (better system monitor)
- `df` → `duf` (better disk usage)
- `du` → `dust` (better directory sizes)
- `ps` → `procs` (modern process viewer)
- `lg` → `lazygit` (git TUI)

### Git Abbreviations
- `gst` → `git status`
- `gco` → `git checkout`
- `gcm` → `git commit -m`
- `gaa` → `git add --all`
- `gpo` → `git push origin`
- `glo` → `git log --oneline`

### FZF Key Bindings
- `Ctrl+F` - Search directories
- `Ctrl+G` - Search git log
- `Ctrl+S` - Search git status
- `Ctrl+P` - Search processes

### Custom Functions
- `mkcd <dir>` - Create directory and cd into it
- `extract <archive>` - Universal archive extractor
- `backup <file>` - Create timestamped backup
- `z <dir>` - Jump to frequently used directories

## 🔄 Updating

### Update dotfiles from this repo
```bash
chezmoi update
```

### Add new files to dotfiles
```bash
chezmoi add ~/.config/newfile
chezmoi cd
git add .
git commit -m "Add newfile"
git push
```

## 📝 Customization

### Fish Configuration
- Main config: `~/.config/fish/config.fish`
- Aliases: `~/.config/fish/conf.d/aliases.fish`
- Functions: `~/.config/fish/functions/`

### Git Configuration
- Global config: `~/.gitconfig`
- Global ignore: `~/.gitignore_global`

### Tool Configurations
- Mise: `~/.config/mise/config.toml`
- Atuin: `~/.config/atuin/config.toml`
- GitHub CLI: `~/.config/gh/config.yml`

## 📚 Resources

- [Fish Shell Documentation](https://fishshell.com/docs/current/)
- [chezmoi Documentation](https://www.chezmoi.io/)
- [Oh My Posh Themes](https://ohmyposh.dev/docs/themes)
- [Atuin Documentation](https://atuin.sh/)

## 🎨 Theme

Using Oh My Posh with the **spaceship** theme for a beautiful, informative prompt.

---

**Note**: This configuration is optimized for macOS with Apple Silicon. Adjust paths and commands as needed for other systems.
