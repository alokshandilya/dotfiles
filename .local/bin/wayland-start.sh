#!/bin/sh

export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export XDG_CURRENT_DESKTOP=wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia

qtile start -b wayland
