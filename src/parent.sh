#!/bin/bash

set -e

function post {
    echo Came from post
}

sudo find / -iwholename "/etc/profile.d/nix.sh"

CALLER="$1"
if [ "$CALLER" == "main" ]; then
    ./src/prepare.sh
    printenv
elif [ "$CALLER" == "post" ]; then
    post
else
    echo "No argument given"
    exit 1
fi
