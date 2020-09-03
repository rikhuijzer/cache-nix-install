#!/bin/sh

CALLER="$1"

if [ "$CALLER" == "main" ]; then
    echo Came from main
elif [ "$CALLER" == "post" ]; then
    echo Came from post
else
    echo "No argument given"
    exit 1
fi
