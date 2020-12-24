#!/bin/bash

set -euo pipefail

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
        bash ./Scripts/Install_moonlight.sh
        bash ./Scripts/Pair_moonlight.sh
        bash ./Scripts/Install_moonlight_menu.sh
        bash ./Scripts/Install_Scripts.sh
        bash ./Scripts/Install_themes.sh
        ;;
    2)
        bash ./Scripts/Install_moonlight.sh
        bash ./Install.sh
        ;;
    3)
        bash ./Scripts/Pair_moonlight.sh
        bash ./Install.sh
        ;;
    4)
        bash ./Scripts/Install_moonlight_menu.sh
        bash ./Install.sh
        ;;
    5)
        bash ./Scripts/Install_Scripts.sh
        bash ./Install.sh
        ;;
    6)
        bash ./Scripts/Install_themes.sh
        bash ./Install.sh
        ;;
    7)
        echo -e "\nRemoving all Moonlight launch scripts..."
        rm -rf /home/pi/RetroPie/roms/moonlight
        bash ./Install.sh
        ;;
    8)
        exit 1
        ;;
    *) echo "INVALID NUMBER!" ;;
esac
