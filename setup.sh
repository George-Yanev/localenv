#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

### Variables
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

### Functions
function check_before_run {
    if [[ $(uname) != 'Darwin' || "$(uname -m)" != "arm64" ]]; then
        echo "This script only support MacOS arm64 environments"
        exit 1
    fi
}

### main
check_before_run

# go the root dir of the script
cd "${SCRIPT_DIR}" || (echo -e "Error cd to ${SCRIPT_DIR}" && exit 1)

echo "Install the packages from the Brewfile"
brew bundle

echo "Enable the packages you want to use by executing stow"
echo "Example for enabling the zsh configuration"
echo "cd localfiles && stow -v -t $HOME zsh"
echo "Example for enabling all of them"
echo "cd localfiles && stow -v -t $HOME *"
