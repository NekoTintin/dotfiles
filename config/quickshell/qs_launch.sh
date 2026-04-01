#!/usr/bin/env bash
# Wrapper to run quickshell with local Qt 6.10 libs/plugins/qml imports

QT_DIR="/home/tintin/Qt/6.10.0/gcc_64"
export LD_LIBRARY_PATH="$QT_DIR/lib${LD_LIBRARY_PATH+:$LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="$QT_DIR/plugins${QT_PLUGIN_PATH+:$QT_PLUGIN_PATH}"
export QT_QPA_PLATFORM_PLUGIN_PATH="$QT_DIR/plugins/platforms${QT_QPA_PLATFORM_PLUGIN_PATH+:$QT_QPA_PLATFORM_PLUGIN_PATH}"
export QML2_IMPORT_PATH="$QT_DIR/qml${QML2_IMPORT_PATH+:$QML2_IMPORT_PATH}"

export QS_ICON_THEME="Tela-circle-purple"

export QT_QPA_PLATFORMTHEME=qt6ct
export XDG_DATA_DIRS="$HOME/.local/share/icons:/usr/share/icons:$XDG_DATA_DIRS"

echo $XDG_DATA_DIRS
echo $QT_QPA_PLATFORMTHEME

exec "quickshell" -c "$HOME/.config/quickshell/ii/"
