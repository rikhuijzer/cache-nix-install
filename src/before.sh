#!/bin/bash

# This separate file is necessary since the shell needs a restart after the Nix installation.

set -e

function install_dependencies {
    sudo apt-get update
    sudo apt-get install -y nodejs
}

function install_nix {
    export INPUT_NIX_PATH="nixpkgs=channel:$INPUT_NIX_VERSION"
    export INPUT_SKIP_ADDING_NIXPKGS_CHANNEL="false"

    git clone --branch v10 https://github.com/cachix/install-nix-action /tmp/cachix
    nodejs /tmp/cachix/lib/main.js
}
