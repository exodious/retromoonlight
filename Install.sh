#!/bin/bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SCRIPTS_DIR="${DIR}/Scripts"

while true; do
    echo -e "\n****************************************************************"
    echo -e "Welcome to the Moonlight Installer Script for RetroPie"
    echo -e "****************************************************************\n"
    echo -e "Select an option:"
    echo -e " * 1: Complete Install and Setup"
    echo -e " * 2: Install Moonlight"
    echo -e " * 3: Pair Moonlight to PC"
    echo -e " * 4: Install Moonlight Menu in RetroPie"
    echo -e " * 5: Install Moonlight Refresh Script in RetroPie"
    echo -e " * 6: Install Moonlight themes"
    echo -e " * 7: Remove Launch Scripts"
    echo -e " * 8: Exit"

    read NUM
    case $NUM in
        1)
            ${SCRIPTS_DIR}/Install_moonlight.sh
            ${SCRIPTS_DIR}/Pair_moonlight.sh
            ${SCRIPTS_DIR}/Install_moonlight_menu.sh
            ${SCRIPTS_DIR}/Install_Scripts.sh
            ${SCRIPTS_DIR}/Install_themes.sh
            ;;
        2)
            ${SCRIPTS_DIR}/Install_moonlight.sh
            ;;
        3)
            ${SCRIPTS_DIR}/Pair_moonlight.sh
            ;;
        4)
            ${SCRIPTS_DIR}/Install_moonlight_menu.sh
            ;;
        5)
            ${SCRIPTS_DIR}/Install_Scripts.sh
            ;;
        6)
            ${SCRIPTS_DIR}/Install_themes.sh
            ;;
        7)
            echo -e "\nRemoving all Moonlight launch scripts..."
            rm -rf "~pi/RetroPie/roms/moonlight"
            ;;
        8)
            exit 0
            ;;
        *)
            echo "INVALID NUMBER!"
            ;;
    esac
done
