#!/bin/sh

export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export XDG_CURRENT_DESKTOP=wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export ELECTRON_OZONE_PLATFORM_HINT=auto
# export CLUTTER_BACKEND=wayland
# export GDK_BACKEND=wayland,x11
# export __GL_GSYNC_ALLOWED=0
# export __GL_VRR_ALLOWED=0
# export __GL_THREADED_OPTIMIZATIONS=1
export NVD_BACKEND=direct
export LIBVA_DRIVER_NAME=nvidia

qtile start -b wayland
