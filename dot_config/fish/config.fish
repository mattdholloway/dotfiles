# Homebrew
fish_add_path /opt/homebrew/bin /opt/homebrew/sbin

if status is-interactive
    # Oh My Posh prompt
    oh-my-posh init fish --config (brew --prefix oh-my-posh)/themes/spaceship.omp.json | source
    
    # Mise (runtime version manager)
    mise activate fish --shims | source
    
    # Zoxide (smart cd)
    zoxide init fish | source
    
    # Atuin (shell history)
    atuin init fish | source
    
    # Direnv (auto-load env vars per directory)
    direnv hook fish | source
    
    # FZF key bindings
    fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs --processes=\cp
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
