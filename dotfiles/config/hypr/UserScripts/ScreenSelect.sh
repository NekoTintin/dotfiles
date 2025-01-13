#!/bin/bash

#configs="$HOME/.config/hypr/configs"

SCREENS=$(hyprctl monitors | grep "Monitor*" | awk '{print $2}')

menu(){
  for screen in "${SCREENS[@]}"; do
    echo "$screen"
  done
}

main() {
    local selected_screen=$(menu | rofi -dmenu -p "Select Screen:")

    if [[ -n "$selected_screen" ]]; then
        echo "$selected_screen"
    else
        echo "No screen selected."
    fi
}

main
