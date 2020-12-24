#!/bin/bash

set -euo pipefail

echo -e "\nCreating Refresh script in Moonlight..."

if [ -d /home/pi/RetroPie/roms/moonlight ]
then
    rm -rf /home/pi/RetroPie/roms/moonlight
fi

mkdir -p /home/pi/RetroPie/roms/moonlight

chmod a+x ./Scripts/Refresh.sh
cp ./Scripts/Refresh.sh /home/pi/RetroPie/roms/moonlight/Refresh.sh
cp ./GenerateGamesList.py /home/pi/RetroPie/roms/moonlight/GenerateGamesList.py
cp ./Scripts/Force_Quit.sh /home/pi/RetroPie/roms/moonlight/Force_Quit.sh

echo -e "Refresh script has been added to RetroPie\n"
echo -e "After loading RetroPie, use the \"Refresh\" rom listed in the Moonlight system.\n"
