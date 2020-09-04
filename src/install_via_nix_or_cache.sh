#!/bin/bash

echo ""
echo "running install_via_nix_or_cache.sh"
echo ""

NIX_STORE=/nix/store
NIX_BIN=/nix/var/nix/profiles/per-user/$USER/profile/bin

echo CACHE_HIT: $CACHE_HIT

if [[ "$CACHE_HIT" != 'true' ]]; then
    nix-env --install --file $INPUTS_NIX_FILE
    sudo chown --verbose --recursive $(id -u):$(id -g) /nix/store
else
    which hello
fi

printenv | sort
