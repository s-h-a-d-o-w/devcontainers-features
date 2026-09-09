#!/bin/sh
set -e

# Fix ownership of the volume mounts (these only exist at runtime and are created as root).
# The cwd during postCreateCommand is the workspace folder, where the node_modules volume is mounted.
sudo chown node /.pnpm-store /commandhistory "$PWD/node_modules"

# Run base OS setup. The MS JS base image comes with nvm and zsh.
curl -o- https://raw.githubusercontent.com/s-h-a-d-o-w/my-os-basics/refs/heads/main/init.sh | bash -s -- no-nvm no-user-host-in-prompt

# zsh history settings.
cat >> ~/.zshrc <<'EOF'

export HISTFILE=/commandhistory/.zsh_history
setopt SHARE_HISTORY
EOF
