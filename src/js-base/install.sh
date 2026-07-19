#!/bin/sh
set -e

echo "Activating feature 'js-base'..."

# Install the post-create script into the image so postCreateCommand can run it at runtime.
install -m 0755 "$(dirname "$0")/post-create.sh" /usr/local/share/js-base-post-create.sh
