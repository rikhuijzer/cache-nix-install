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

function cache_install {
    # https://artifactcache.actions.githubusercontent.com/.../
    # Restore is defined at https://github.com/actions/toolkit
    CACHE_URL="$ACTIONS_CACHE_URL"
    curl "$ACTIONS_CACHE_URL/test"
    printenv | sort
}

CALLER="$1"
if [ "$CALLER" == "main" ]; then
    # install_dependencies
    # install_nix
    cache_install
elif [ "$CALLER" == "post" ]; then
    echo Came from post
else
    echo "No argument given"
    exit 1
fi
