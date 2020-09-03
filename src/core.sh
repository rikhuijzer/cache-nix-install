#!/bin/bash

set -e

CALLER="$1"

printenv

function main {
    git clone --branch v10 https://github.com/cachix/install-nix-action /tmp/cachix
    nodejs /tmp/cachix/lib/main.js
}

function post {
    echo Came from post
}

if [ "$CALLER" == "main" ]; then
    main
elif [ "$CALLER" == "post" ]; then
    post
else
    echo "No argument given"
    exit 1
fi
