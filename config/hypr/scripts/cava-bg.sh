#!/bin/bash

term="$HOME/.local/bin/kitty"

if ps aux | grep '[k]itty-bg'; then
    notify-send "Cava désactivé !" ":( Sad"
    pkill cava
else
    notify-send "Cava activé !" "Démarrage de cava en fond d'écran."
    $term --config ~/.config/kitty/kitty-bg.conf --class kitty-bg -e cava
fi
