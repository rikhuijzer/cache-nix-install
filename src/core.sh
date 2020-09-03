#!/bin/bash

CALLER="$1"

function main {
    echo Came from main
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
