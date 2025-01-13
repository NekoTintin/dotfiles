#!/bin/bash

set -e # Stop on error

hypr_folder="/home/tintin/Hyprland_builds"

build_install="cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf _NPROCESSORS_CONF)
sudo cmake --install build"

# Create build folder if not exists
mkdir -p "$hypr_folder"

# Update installed packages
sudo apt update
sudo apt upgrade -y

# Install needed packages
sudo apt install -y \
    build-essential cmake meson ninja-build pkg-config \
    libseat-dev libinput-dev libwayland-dev wayland-protocols \
    libpixman-1-dev libdrm-dev libgbm-dev libudev-dev libdisplay-info-dev hwdata \
    libcairo2-dev libjpeg-dev libwebp-dev libmagic-dev \
    libjxl-dev libjxl-tools \
    libx11-xcb-dev libxcb-render0-dev libxcb-xfixes0-dev libxcb-icccm4-dev \
    libxcb-composite0-dev libxcb-res0-dev \
    libxkbcommon-dev uuid-dev \
    libpango1.0-dev libpangocairo-1.0-0 \
    libxcursor-dev libudis86-dev \
    libzip-dev librsvg2-dev \
    libpolkit-agent-1-dev libpolkit-qt6-1-dev \
    libsdbus-c++-dev \
    libegl1-mesa-dev libgl1-mesa-dev libopengl-dev \
    qt6-base-dev qt6-base-dev-tools qt6-wayland-dev \
    libpipewire-0.3-dev libspa-0.2-dev

# Update Rust (if needed for other builds)
if ! command -v rustup &>/dev/null; then
    echo "Rust is not installed. Please install rustup."
    exit 1
fi
rustup update

# Install hyprutils
if [ ! -d "$hypr_folder/hyprutils" ]; then
    cd "$hypr_folder"
    git clone https://github.com/hyprwm/hyprutils.git && cd hyprutils
    eval "$build_install"
fi

# Build aquamarine
if [ ! -d "$hypr_folder/aquamarine" ]; then
    cd "$hypr_folder"
    git clone https://github.com/hyprwm/aquamarine.git && cd aquamarine
    eval "$build_install"
fi

# Build hyprgraphics
if [ ! -d "$hypr_folder/hyprgraphics" ]; then
    cd "$hypr_folder"
    git clone https://github.com/hyprwm/hyprgraphics.git && cd hyprgraphics
    eval "$build_install"
fi

# Build hyprlang
if [ ! -d "$hypr_folder/hyprlang" ]; then
    cd "$hypr_folder"
    git clone https://github.com/hyprwm/hyprlang.git && cd hyprlang
    eval "$build_install"
fi

# Build hyprcursor
if [ ! -d "$hypr_folder/hyprcursor" ]; then
    cd "$hypr_folder"
    git clone https://github.com/hyprwm/hyprcursor.git && cd hyprcursor
    eval "$build_install"
fi

# Build hyprwayland-scanner
if [ ! -d "$hypr_folder/hyprwayland-scanner" ]; then
    cd "$hypr_folder"
    git clone https://github.com/hyprwm/hyprwayland-scanner.git && cd hyprwayland-scanner
    eval "$build_install"
fi

# Build Hyprland
if [ ! -d "$hypr_folder/hyprland" ]; then
    cd "$hypr_folder"
    git clone https://github.com/hyprwm/Hyprland.git && cd Hyprland
    make all && sudo make install
fi

# Build hyprpolkitagent
if [ ! -d "$hypr_folder/hyprpolkitagent" ]; then
    cd "$hypr_folder"
    git clone https://github.com/hyprwm/hyprpolkitagent.git && cd hyprpolkitagent
    eval "$build_install"
fi

# Build hypridle
#if [ ! -d "$hypr_folder/hypridle" ]; then
#    cd "$hypr_folder"
#    git clone https://github.com/hyprwm/hypridle.git && cd hypridle
#    eval "$build_install"
#fi

## Build hyprlock
#if [ ! -d "$hypr_folder/hyprlock" ]; then
#    cd "$hypr_folder"
#    git clone https://github.com/hyprwm/hyprlock.git && cd hyprlock
#    eval "$build_install"
#fi

# Build hyprpicker
if [ ! -d "$hypr_folder/hyprpicker" ]; then
    cd "$hypr_folder"
    git clone https://github.com/hyprwm/hyprpicker.git && cd hyprpicker
    eval "$build_install"
fi

# Build hyprland-protocols
if [ ! -d "$hypr_folder/hyprland-protocols" ]; then
    cd "$hypr_folder"
    git clone https://github.com/hyprwm/hyprland-protocols.git && cd hyprland-protocols
    meson build
    ninja -C build
    sudo ninja -C build install
fi

# Build hyprland-qtutils
if [ ! -d "$hypr_folder/hyprland-qtutils" ]; then
    cd "$hypr_folder"
    git clone https://github.com/hyprwm/hyprland-qtutils.git && cd hyprland-qtutils
    eval "$build_install"
fi

# Build xdg-desktop-portal-hyprland
if [ ! -d "$hypr_folder/xdg-desktop-portal-hyprland" ]; then
    cd "$hypr_folder"
    git clone --recursive https://github.com/hyprwm/xdg-desktop-portal-hyprland.git && cd xdg-desktop-portal-hyprland
    cmake -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -B build
    cmake --build build
    sudo cmake --install build
fi

# Build hyprsunset
if [ ! -d "$hypr_folder/hyprsunset" ]; then
    cd "$hypr_folder"
    git clone https://github.com/hyprwm/hyprsunset.git && cd hyprsunset
    eval "$build_install"
fi

cd $hypr_folder
rm -rf "*"

echo "Installation complète ! Tous les paquets ont été installés."
