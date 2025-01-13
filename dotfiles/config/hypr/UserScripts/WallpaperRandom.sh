#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for Random Wallpaper ( CTRL ALT W)

wallDIR="$HOME/Images/wallpapers"
scriptsDir="$HOME/.config/hypr/scripts"
swww="/home/tintin/swww/target/release/swww"

PICS=$(find ${wallDIR} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}


# Transition config
FPS=60
TYPE="random"
DURATION=1
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"

echo ${RANDOMPICS}
$swww query || $swww init && $swww img ${RANDOMPICS} $SWWW_PARAMS


${scriptsDir}/PywalSwww.sh
sleep 1
${scriptsDir}/Refresh.sh
sleep 1115