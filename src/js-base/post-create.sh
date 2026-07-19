#!/bin/sh
set -e

# Fix ownership of the shared volume mounts (these only exist at runtime).
sudo chown node /.pnpm-store /commandhistory

# Run base OS setup.
curl -o- https://raw.githubusercontent.com/s-h-a-d-o-w/my-os-basics/refs/heads/main/init.sh | bash -s -- no-nvm no-user-host-in-prompt

# zsh history settings.
cat >> ~/.zshrc <<'EOF'

export HISTFILE=/commandhistory/.zsh_history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
EOF
