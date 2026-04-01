#!/bin/bash

if ps aux | grep -q "[n]wg-dock-hyprland -f -p bottom -mb 10 -mr 10 -ml 10 -x -s style-fullscreen.css"; then
    pkill -x nwg-dock-hyprla
    nwg-dock-hyprland -d -p bottom -mb 10 -l top &
else
    pkill -x nwg-dock-hyprla
    nwg-dock-hyprland -f -p bottom -mb 10 -mr 10 -ml 10 -x -s style-fullscreen.css &
fi
