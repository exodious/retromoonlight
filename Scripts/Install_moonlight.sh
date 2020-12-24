#!/bin/bash

set -euo pipefail

rpiversion=`head -1 /etc/apt/sources.list | cut -d " " -f3`

echo -e "\nAdding Moonlight to Sources List..."

if grep -q "deb http://archive.itimmer.nl/raspbian/moonlight $rpiversion main" /etc/apt/sources.list; then
    echo -e "NOTE: Moonlight Source Exists - Skipping"
else
    echo -e "Adding Moonlight to Sources List"
    echo "deb http://archive.itimmer.nl/raspbian/moonlight $rpiversion main" >> /etc/apt/sources.list
fi

echo -e "\nFetching and installing the GPG key....\n"

wget http://archive.itimmer.nl/itimmer.gpg
sudo apt-key add itimmer.gpg
rm itimmer.gpg

echo -e "\nUpdating System..."
sudo apt-get update -y

echo -e "\nInstalling Moonlight..."
sudo apt-get install moonlight-embedded -y
echo -e "\nInstalling Gamepad..."
moonlight_cfg_dir=~/.config/moonlight
mkdir -p $moonlight_cfg_dir
cp /usr/share/moonlight/gamecontrollerdb.txt $moonlight_cfg_dir
cat ./gamepad/steel-series-duo.txt >> ${moonlight_cfg_dir}/gamecontrollerdb.txt
echo -e "\nMoonlight Installed!"
