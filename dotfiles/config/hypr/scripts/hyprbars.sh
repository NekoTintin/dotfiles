#!/bin/bash

# Vérifier si Hyprbar est actif
if hyprctl plugin list | grep -q "hyprbars by Vaxry"; then
  # Si Hyprbar est déjà actif, le désactiver
  hyprpm disable hyprbars
else
  # Si Hyprbar n'est pas actif, l'activer
  hyprpm enable hyprbars
fi
