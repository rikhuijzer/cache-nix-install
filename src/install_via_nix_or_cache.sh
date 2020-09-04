#!/bin/bash

echo ""
echo "running install_via_nix_or_cache.sh"
echo ""

NIX_STORE=/nix/store
NIX_BIN=/nix/var/nix/profiles/per-user/$USER/profile/bin

if [[ "$CACHE_HIT" != 'true' ]]; then
    nix-env --install --file $INPUTS_NIX_FILE
else
    1
fi
