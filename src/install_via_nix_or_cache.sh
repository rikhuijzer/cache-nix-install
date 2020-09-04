#!/bin/bash

echo ""
echo "running install_via_nix_or_cache.sh"
echo ""

NIX_BIN=/nix/var/nix/profiles/per-user/runner/profile/bin
NIX_STORE=/nix/store

if [[ "$CACHE_HIT" != 'true' ]]; then
  nix-env --install --file "$INPUTS_NIX_FILE"
  mkdir ~/nix
  mv $NIX_STORE ~/nix/store
  mv $NIX_BIN ~/nix/bin
else
  sudo mkdir --parents $NIX_STORE
  sudo mkdir --parents $NIX_BIN
  sudo mv --force ~/nix/store $NIX_STORE
  sudo mv --force ~/nix/bin $NIX_BIN
fi
