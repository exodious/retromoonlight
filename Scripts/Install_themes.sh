#!/bin/bash

set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo -e "\nInstalling Moonlight compatible themes..."

sudo cp -R ${DIR}/themes /etc/emulationstation/

echo -e "\nThemes installed"
