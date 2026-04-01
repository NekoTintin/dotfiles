#!/bin/sh

columns="-c 5"

margin_left="-ml 800"
margin_right="-mr 800"
margin_top="-mt 500"
margin_bottom="-mb 120"

spacing="-spacing 2"

search_limit="-fscol 2"
search_lenght="-fslen 40"

pkill nwg-d*

# Launch nwg-drawer
nwg-drawer -r $columns $margin_left $margin_right $margin_top $margin_bottom $spacing $search_limit $search_lenght -ovl -lang="fr" -nofs -nocats -o DP-1 -close &

autohide="-d"
position="-p bottom"
margin_bottom="-mb 10"
layer="-l top"

nwg-dock-hyprland $autohide $position $margin_bottom $layer &
