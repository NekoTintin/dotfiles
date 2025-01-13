#!/bin/bash
# Rofi menu for Quick Edit / View of Settings (SUPER E)

configs="$HOME/.config/hypr/configs"
UserConfigs="$HOME/.config/hypr/UserConfigs"
UserScripts="$HOME/.config/hypr/UserScripts"
hypr="$HOME/.config/hypr"

menu(){
  printf "1. Env-variables\n"
  printf "2. Window-Rules\n"
  printf "3. Startup_Apps\n"
  printf "4. User-Keybinds\n"
  printf "5. Monitors\n"
  printf "6. Laptop-Keybinds\n"
  printf "7. User-Settings\n"
  printf "8. Default-Settings\n"
  printf "9. Default-Keybinds\n"
  printf "10. WallpaperSelect\n"
  printf "11. LockScreen\n"
}

main() {
    choice=$(menu | rofi -dmenu -config ~/.config/rofi/config-compact.rasi | cut -d. -f1)
    case $choice in
        1)
            kitty -e nano "$UserConfigs/ENVariables.conf"
            ;;
        2)
            kitty -e nano "$UserConfigs/WindowRules.conf"
            ;;
        3)
            kitty -e nano "$UserConfigs/Startup_Apps.conf"
            ;;
        4)
            kitty -e nano "$UserConfigs/UserKeybinds.conf"
            ;;
        5)
            kitty -e nano "$UserConfigs/Monitors.conf"
            ;;
        6)
            kitty -e nano "$UserConfigs/Laptops.conf"
            ;;
        7)
            kitty -e nano "$UserConfigs/UserSettings.conf"
            ;;
        8)
            kitty -e nano "$configs/Settings.conf"
            ;;
        9)
            kitty -e nano "$configs/Keybinds.conf"
            ;;
        10)
            kitty -e nano "$UserScripts/WallpaperSelect.sh"
            ;;
        11)
            code "$hypr/hyprlock.conf"
            ;;
        *)
            ;;
    esac
}

main
