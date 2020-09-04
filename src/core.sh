#!/bin/bash

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
    export PATH=$PATH:~/.nix-profile/bin/:/nix/var/nix/profiles/default/bin/
}

function install_via_nix {
    nix-env --install --file "$INPUT_NIX_FILE"
}

CALLER="$1"
if [ "$CALLER" == "main" ]; then
    install_dependencies
    install_nix
    printenv | sort
    install_via_nix
elif [ "$CALLER" == "post" ]; then
    post
else
    echo "No argument given"
    exit 1
fi
