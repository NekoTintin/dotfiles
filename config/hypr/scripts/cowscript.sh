#!/bin/bash

LIST=("Hello world !"
	"Debugging mode activé"
	"On en a gros"
	"UWU"
	"Mais frérot, t'a cru que je parlais en hex 64 ?"
)
LIST_STR=$(printf "%s\n" "${LIST[@]}")

# Dossier des cowfiles
COWDIR="/home/tintin/.config/cowfile"

# Liste des cowfiles disponibles (sans extension)
COWFILE=$(ls "$COWDIR"/*.cow 2>/dev/null | xargs -n1 basename | sed 's/\.cow$//' | rofi -dmenu -p "Choisis un cowfile :")

[ -z "$COWFILE" ] && exit 1

# Demande le texte
TEXT=$(rofi -dmenu -no-history -p "Texte pour cowsay :" <<<  "$LIST_STR")

[ -z "$TEXT" ] && exit 1

# Lance cowsay
cowsay -f "$COWDIR/$COWFILE.cow" "$TEXT"