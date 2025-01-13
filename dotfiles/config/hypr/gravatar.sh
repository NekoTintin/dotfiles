#!/bin/bash

if [ -z "$1" ]; then
 https://gravatar.com/avatar/f93182fbfd610cacf6faf57a43fb141ce950bf1206574d73ab822072166caaa4?s=500"
  exit 1
fi

url="$1"

# Nom du fichier de sortie
output_file="/home/tintin/Téléchargements"

# Télécharger l'avatar
curl -o "$output_file" "$url"

echo "$output_file"
