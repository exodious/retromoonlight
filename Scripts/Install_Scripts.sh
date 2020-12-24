#!/bin/bash

set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
MOONLIGHT_ROMS_DIR=${HOME}/RetroPie/roms/moonlight

echo -e "\nCreating Refresh script in Moonlight..."

if [[ -d $MOONLIGHT_ROMS_DIR ]]; then
    rm -rf "$MOONLIGHT_ROMS_DIR"
fi

mkdir -p "$MOONLIGHT_ROMS_DIR"

install ${DIR}/Refresh.sh ${MOONLIGHT_ROMS_DIR}/
install ${DIR}/../GenerateGamesList.py ${MOONLIGHT_ROMS_DIR}/
install ${DIR}/Force_Quit.sh ${MOONLIGHT_ROMS_DIR}/

echo -e "Refresh script has been added to RetroPie\n"
echo -e "After loading RetroPie, use the \"Refresh\" rom listed in the Moonlight system.\n"
