#!/bin/bash

set -e

function install_nix {
    export INPUT_NIX_PATH="nixpkgs=channel:${{ INPUT_NIX_VERSION }}"
    export INPUT_SKIP_ADDING_NIXPKGS_CHANNEL="false"

    git clone --branch v10 https://github.com/cachix/install-nix-action /tmp/cachix
    nodejs /tmp/cachix/lib/main.js
}

function install_via_nix {
    nix-env --install --file ${{ INPUT_NIX_FILE }}
}

function post {
    echo Came from post
}

CALLER="$1"
if [ "$CALLER" == "main" ]; then
    install_nix
    install_via_nix
elif [ "$CALLER" == "post" ]; then
    post
else
    echo "No argument given"
    exit 1
fi
