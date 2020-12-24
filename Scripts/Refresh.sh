#!/bin/bash

set -euo pipefail

moonlight list > gameslist.txt
python3 ~/RetroPie/roms/moonlight/GenerateGamesList.py "./gameslist.txt"
rm ./gameslist.txt
