#!/bin/sh

export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export XDG_CURRENT_DESKTOP=wayland
# export ZDOTDIR=HOME/.config/zsh

qtile start -b wayland
