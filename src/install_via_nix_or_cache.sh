#!/bin/bash

echo ""
echo "running install_via_nix_or_cache.sh"
echo ""

NIX_STORE=/nix/store
NIX_BIN=/nix/var/nix/profiles/per-user/$USER/profile/bin

if [[ "$CACHE_HIT" != 'true' ]]; then
    nix-env --install --file $INPUTS_NIX_FILE
    echo "Relaxing permissions for /nix/store"
    sudo chown --recursive "$USER:" /nix/store
else
    which hello
fi
