#!/bin/bash

# Directory for icons
iDIR="$HOME/.config/swaync/icons"

# Note: You can add more options below with the following format:
# ["TITLE"]="link"

# Define menu options as an associative array
declare -A menu_options=(
  ["Lofi Girl ☕️🎶"]="https://play.streamafrica.net/lofiradio"
  ["J-Pop Powerplay Kawaii 🎀🎶"]="https://kathy.torontocast.com:3060/;?type=http&nocache=1614591208"
  ["J-Rock Powerplay 🎸🎶"]="https://kathy.torontocast.com:3340/;?type=http&nocache=1614591283"
  ["NoLife Radio 🎮🎶"]="https://listen.nolife-radio.com/stream"
  ["Rainwave 🌧️🎶"]="https://relay.rainwave.cc/all.ogg?1:Uvu1YuwJOZ"
)

# Function for displaying notifications
notification() {
  notify-send -u normal -i "$iDIR/music.png" "En cours de lecture: $@"
}

# Main function
main() {
  choice=$(printf "%s\n" "${!menu_options[@]}" | rofi -dmenu -config ~/.config/rofi/config-rofi-Beats.rasi -i -p "")

  if [ -z "$choice" ]; then
    exit 1
  fi

  link="${menu_options[$choice]}"

  notification "$choice"
  
  # Check if the link is a playlist
  if [[ $link == *playlist* ]]; then
    mpv --shuffle --vid=no "$link"
  else
    mpv "$link"
  fi
}

# Check if an online music process is running and send a notification, otherwise run the main function
pkill mpv && notify-send -u low -i "$iDIR/music.png" "Musique arrêtée !" || main
