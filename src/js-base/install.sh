#!/bin/sh
set -e

echo "Activating feature 'js-base'..."

# Workaround that's needed because `"runArgs": ["--add-host=host.docker.internal:host-gateway"]` isn't supported in devcontainer features
## Make sure `ip` is available
apt-get update && apt-get install -y --no-install-recommends iproute2
cat > /usr/local/share/js-base-entrypoint.sh <<'EOF'
#!/bin/sh
if ! grep -q 'host.docker.internal' /etc/hosts; then
  GW=$(ip route | awk '/default/ {print $3; exit}')
  [ -n "$GW" ] && echo "$GW host.docker.internal" >> /etc/hosts
fi
exec "$@"
EOF
chmod +x /usr/local/share/js-base-entrypoint.sh

# Install the post-create script into the image so postCreateCommand can run it at runtime.
install -m 0755 "$(dirname "$0")/post-create.sh" /usr/local/share/js-base-post-create.sh
