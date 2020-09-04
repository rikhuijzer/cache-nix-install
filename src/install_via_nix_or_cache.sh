#!/bin/bash

NIX_BIN=/nix/var/nix/profiles/per-user/runner/profile/bin
NIX_STORE=/nix/store
if [[ "$CACHE_HIT" != 'true' ]]; then
  nix-env --install --file default.nix
  # mkdir ~/nix
  # sudo cp --force --recursive $NIX_STORE/ ~/nix/store
  # sudo cp --force --recursive $NIX_BIN/ ~/nix/bin
else
  sudo mkdir --parents $NIX_STORE
  sudo mkdir --parents $NIX_BIN
  sudo cp --force --recursive ~/nix/store $NIX_STORE
  sudo cp --force --recursive ~/nix/bin $NIX_BIN
fi
