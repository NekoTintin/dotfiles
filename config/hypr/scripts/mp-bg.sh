#!/bin/bash

if ps aux | grep '[m]pv'; then
    notify-send "Fond d'écran animé désactivé" ":(((("
    pkill mpv
else
    notify-send "Fond d'écran animé activé" "Miku en mp4 !"
    mpv --loop --mute=yes /home/tintin/Vidéos/Miku\ 2.mp4 &
fi
