# Git delta configuration
# Set delta as the default pager for git
set -gx GIT_PAGER "delta"

# Delta options via git config are preferred, but these env vars work too
set -gx DELTA_FEATURES "side-by-side line-numbers decorations"
set -gx DELTA_NAVIGATE "true"
