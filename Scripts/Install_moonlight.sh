#!/bin/bash

set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

rpiversion=`head -1 /etc/apt/sources.list | cut -d " " -f3`

echo -e "\nAdding Moonlight to Sources List..."

repo_url="http://archive.itimmer.nl/raspbian/moonlight"

if apt-cache policy | grep -q "$repo_url"; then
    echo -e "NOTE: Moonlight Source Exists - Skipping"
else
    sudo bash -c "echo 'deb $repo_url $rpiversion main' >> /etc/apt/sources.list.d/moonlight.list"
    echo -e "Added Moonlight to Sources List"
fi

echo -e "\nFetching and installing the GPG key....\n"
curl http://archive.itimmer.nl/itimmer.gpg | sudo apt-key add -

echo -e "\nUpdating System..."
sudo apt-get update -y

echo -e "\nInstalling Moonlight..."
sudo apt-get install moonlight-embedded -y

echo -e "\nInstalling Gamepad Maps..."
moonlight_cfg_dir=${HOME}/.config/moonlight
mkdir -p $moonlight_cfg_dir
cp /usr/share/moonlight/gamecontrollerdb.txt $moonlight_cfg_dir
for map in ${DIR}/../gamepad/*.map; do
    cat $map >> ${moonlight_cfg_dir}/gamecontrollerdb.txt
done

echo -e "\nMoonlight Installed!"
