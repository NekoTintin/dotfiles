#!/bin/bash

if ps aux | grep '[k]itty-bg'; then
    pkill cava
else
    KITTY_DISABLE_WAYLAND=1 kitty --config ~/.config/kitty/kitty-bg.conf --class kitty-bg -e cava
fi
