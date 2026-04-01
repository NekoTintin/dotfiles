#!/bin/bash

# Hotspot Toggle Script

# Configuration
SSID="Ubuntu-Couillon"
PASSWORD="moneymoney"

# Interfaces détectées automatiquement
ETH=$(nmcli device status | grep ethernet | awk '{print $1}')
WIFI="wlo1"

# Nom du hotspot
HOTSPOT_NAME="Hotspot"

# Vérifie si le hotspot est actif
if nmcli connection show --active | grep -q "$HOTSPOT_NAME"; then
    # 🔹 Hotspot actif → le désactiver
    nmcli connection down "$HOTSPOT_NAME"
    nmcli connection delete "$HOTSPOT_NAME"


    # 🔹 Notification
    notify-send "Hotspot Désactivé"

else
    # 🔹 Hotspot non actif → le démarrer

    # Supprimer si hotspot existant (précaution)
    if nmcli connection show | grep -q "$HOTSPOT_NAME"; then
        nmcli connection delete "$HOTSPOT_NAME"
    fi

    # Configurer NAT
    sudo iptables -t nat -A POSTROUTING -o "$ETH" -j MASQUERADE
    sudo iptables -A FORWARD -i "$WIFI" -o "$ETH" -j ACCEPT
    sudo iptables -A FORWARD -i "$ETH" -o "$WIFI" -m state --state ESTABLISHED,RELATED -j ACCEPT

    # Supprimer si hotspot existant (précaution)
    if nmcli connection show | grep -q "$HOTSPOT_NAME"; then
        nmcli connection delete "$HOTSPOT_NAME"
    fi

    # Lancer le hotspot
    nmcli device wifi hotspot ifname "$WIFI" con-name "$HOTSPOT_NAME" ssid "$SSID" password "$PASSWORD"
    nmcli connection modify "$HOTSPOT_NAME" ipv4.method shared
    nmcli connection up "$HOTSPOT_NAME"

    # Notification
    notify-send "Hotspot Activé" "SSID: $SSID"
fi
