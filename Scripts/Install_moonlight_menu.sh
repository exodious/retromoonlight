#!/bin/bash

set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo -e "\nCreating Moonlight Menu for RetroPie..."

MENU_CONFIG=$(cat ${DIR}/menu_config.txt)
CONFIG_FILE=${HOME}/.emulationstation/es_systems.cfg

if [[ -f $CONFIG_FILE ]]; then
    echo -e "Removing Duplicate Systems File"
    rm $CONFIG_FILE
fi

echo -e "Copying Systems Config File"
cp /etc/emulationstation/es_systems.cfg $CONFIG_FILE

echo -e "Adding Moonlight to Systems"
sed -i -e "s|</systemList>|${MENU_CONFIG}|g" $CONFIG_FILE

echo -e "\nMoonlight menu added to RetroPie..."
