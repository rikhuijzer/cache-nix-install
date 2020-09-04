#!/bin/bash

echo ""
echo "running install_via_nix_or_cache.sh"
echo ""

NIX_STORE=/nix/store
NIX_BIN=/nix/var/nix/profiles/per-user/$USER/profile/bin

if [[ "$CACHE_HIT" != 'true' ]]; then
    nix-env --install --file $INPUTS_NIX_FILE
    echo "Relaxing permissions for /nix/store"
    sudo chown --recursive $(id -u):$(id -g) /nix/store
    echo "Relaxing permissions for /run/current-system/sw/bin"
    sudo chown --recursive $(id -u):$(id -g) /run/current-system/sw/bin
else
    which hello
fi

printenv | sort
