#!/bin/sh

export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export XDG_CURRENT_DESKTOP=wayland

qtile start -b wayland
