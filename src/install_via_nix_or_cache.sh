#!/bin/bash

echo ""
echo "running install_via_nix_or_cache.sh"
echo ""

NIX_BIN=/nix/var/nix/profiles/per-user/$USER/profile/bin
NIX_STORE=/nix/store

if [[ "$CACHE_HIT" != 'true' ]]; then
    nix-env --install --file "$INPUTS_NIX_FILE"
    mkdir --verbose ~/nix
    which hello
    ls -ahl $NIX_BIN
    sudo mv --verbose $NIX_STORE ~/nix/store
    sudo mv --verbose $NIX_BIN ~/nix/bin
else
    sudo mkdir --parents $NIX_STORE
    sudo mkdir --parents $NIX_BIN
    sudo mv --force ~/nix/store $NIX_STORE
    sudo mv --force ~/nix/bin $NIX_BIN
fi
