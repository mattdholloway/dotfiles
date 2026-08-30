# iTerm2 shell integration (load first)
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

if status is-interactive
    # Oh My Posh prompt
    oh-my-posh init fish --config (brew --prefix oh-my-posh)/themes/spaceship.omp.json | source
    
    # Mise (runtime version manager)
    if not set -q VSCODE_PID
        mise activate fish | source
    end
    
    # Zoxide (smart cd)
    zoxide init fish | source
    
    # FZF key bindings (history disabled - using atuin instead)
    fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs --processes=\cp --history=
    
    # Atuin (shell history) - must be after fzf to override bindings
    # Patch out deprecated `bind -k` syntax for fish 4.x
    atuin init fish | string replace -a -- '-k up' 'up' | string replace -a -- '-M insert -k up' '-M insert up' | source
    
    # Direnv (auto-load env vars per directory)
    direnv hook fish | source
end

# PATH additions
fish_add_path /Users/matt/.lmstudio/bin
fish_add_path /Users/matt/.local/bin
fish_add_path /Users/matt/.antigravity/antigravity/bin

# Environment variables
set -gx CLICOLOR 1
set -gx PKG_CONFIG_PATH "/opt/homebrew/lib/pkgconfig:$PKG_CONFIG_PATH"
set -gx OPENSSL_DIR "/opt/homebrew/opt/openssl"
set -gx OPENSSL_LIB_DIR "/opt/homebrew/opt/openssl/lib"
set -gx OPENSSL_INCLUDE_DIR "/opt/homebrew/opt/openssl/include"

# Homebrew
fish_add_path /opt/homebrew/bin /opt/homebrew/sbin

# Better defaults
set -gx EDITOR "code --wait"  # or vim, nano, etc.
set -gx VISUAL $EDITOR
set -gx BAT_THEME "TwoDark"

# Fish abbreviations (expand on space)
if status is-interactive
    # Git abbreviations
    abbr -a gst git status
    abbr -a gco git checkout
    abbr -a gcm git commit -m
    abbr -a gaa git add --all
    abbr -a gpo git push origin
    abbr -a glo git log --oneline
    
    # Docker shortcuts
    abbr -a d docker
    abbr -a dc docker compose
    abbr -a dps docker ps
    abbr -a dcu docker compose up
    abbr -a dcd docker compose down
    
    # Common typos
    abbr -a gti git
    abbr -a gt git
end

# >>> grok installer >>>
fish_add_path $HOME/.grok/bin
# <<< grok installer <<<
