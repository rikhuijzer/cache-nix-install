#!/usr/bin/env bash

# Source: https://github.com/cachix/install-nix-action/blob/master/lib/install-nix.sh

set -euo pipefail

echo ""
echo "running install_nix.sh"
echo ""

if [ -d "/nix" ]; then
    echo Nix folder exists. Assuming it was restored from cache.
    exit 0
fi

# Configure Nix
add_config() {
  echo "$1" | sudo tee -a /tmp/nix.conf >/dev/null
}
# Set jobs to number of cores
add_config "max-jobs = auto"
# Allow binary caches for runner user
add_config "trusted-users = root runner"

# Nix installer flags
installer_options=(
  --daemon
  --daemon-user-count 4
  --darwin-use-unencrypted-nix-store-volume
  --nix-extra-conf-file /tmp/nix.conf
)

INPUT_NIX_PATH="nixpkgs=channel:$INPUT_NIX_VERSION"
if [[ "$INPUT_NIX_PATH" != "" ]]; then
  installer_options+=(--no-channel-add)
else
  INPUT_NIX_PATH="/nix/var/nix/profiles/per-user/root/channels"
fi

sh <(curl --retry 5 --retry-connrefused -L "${INPUT_INSTALL_URL:-https://nixos.org/nix/install}") \
  "${installer_options[@]}"

if [[ $OSTYPE =~ darwin ]]; then
  # Disable spotlight indexing of /nix to speed up performance
  sudo mdutil -i off /nix

  # macOS needs certificates hints
  cert_file=/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt
  echo "::set-env name=NIX_SSL_CERT_FILE::$cert_file"
  export NIX_SSL_CERT_FILE=$cert_file
  sudo launchctl setenv NIX_SSL_CERT_FILE "$cert_file"
fi

# Set paths
echo "::add-path::/nix/var/nix/profiles/per-user/runner/profile/bin"
echo "::add-path::/nix/var/nix/profiles/default/bin"

if [[ $INPUT_NIX_PATH != "" ]]; then
  echo "::set-env name=NIX_PATH::${INPUT_NIX_PATH}"
fi
