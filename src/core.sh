#!/bin/bash

function install_via_nix {
    nix-env --install --file "$INPUT_NIX_FILE"
}

install_via_nix
