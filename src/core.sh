#!/bin/bash

set -e

function install_via_nix {
    nix-env --install --file "$INPUT_NIX_FILE"
}

function post {
    echo Came from post
}

CALLER="$1"
if [ "$CALLER" == "main" ]; then
    install_via_nix
elif [ "$CALLER" == "post" ]; then
    post
else
    echo "No argument given"
    exit 1
fi
