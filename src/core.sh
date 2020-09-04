#!/bin/bash

set -e

function install_dependencies {
    sudo apt-get update
    sudo apt-get install -y nodejs
}

function install_nix {
    export INPUT_NIX_PATH="nixpkgs=channel:$INPUT_NIX_VERSION"
    export INPUT_SKIP_ADDING_NIXPKGS_CHANNEL="false"

    git clone --depth 1 --branch v10 https://github.com/cachix/install-nix-action /tmp/cachix
    nodejs /tmp/cachix/lib/main.js
    export PATH=$PATH:~/.nix-profile/bin/
    export PATH=$PATH:/nix/var/nix/profiles/default/bin/
    export PATH=$PATH:/nix/var/nix/profiles/per-user/$USER/profile/bin/
}

function install_via_nix {
    nix-env --install --file "$INPUT_NIX_FILE"
}

function check_cache {
    git clone --depth 1 --branch v2.1.1 https://github.com/actions/cache /tmp/cache
    nodejs /tmp/cache/dist/restore/index.js
    printenv | sort
    CACHE_HIT=1
    install_via_nix
}

CALLER="$1"
if [ "$CALLER" == "main" ]; then
    install_dependencies
    install_nix
    cache_install
elif [ "$CALLER" == "post" ]; then
    echo Came from post
else
    echo "No argument given"
    exit 1
fi
