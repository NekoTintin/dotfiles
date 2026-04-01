#!/bin/bash

# Chemin du fichier de configuration
config_file="$HOME/.config/OpenTabletDriver/settings.json"

# Vérifie si le fichier de configuration existe
if [ ! -f "$config_file" ]; then
    echo "Erreur : Le fichier de configuration $config_file n'existe pas."
    exit 1
fi

# Vérifie si le mode actuel est AbsoluteMode ou LinuxArtistMode
if grep -q '"Path": "OpenTabletDriver.Desktop.Output.AbsoluteMode"' "$config_file"; then
    # Si le mode est Absolute, bascule vers LinuxArtistMode
    sed -i 's/"Path": "OpenTabletDriver.Desktop.Output.AbsoluteMode"/"Path": "OpenTabletDriver.Desktop.Output.LinuxArtistMode"/' "$config_file"
    notify-send "Changement de mode" "Mode changé vers Artist Mode" --icon="$HOME/.config/hypr/scripts/pen.png"
else
    # Sinon, bascule vers AbsoluteMode
    sed -i 's/"Path": "OpenTabletDriver.Desktop.Output.LinuxArtistMode"/"Path": "OpenTabletDriver.Desktop.Output.AbsoluteMode"/' "$config_file"
    notify-send "Changement de mode" "Mode changé vers Absolute Mode" --icon="$HOME/.config/hypr/scripts/pen.png"
fi

# Recharge la configuration de OpenTabletDriver
otd loadsettings "$config_file"
