#!/bin/sh

HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="wezterm"
export BROWSER="firefox"
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.docker/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export GOPATH=$HOME/.local/share/go
export PATH=$HOME/.local/share/fnm:$PATH
export PATH=$HOME/.config/emacs/bin:$PATH
export PATH="$HOME/.local/share/neovim/bin":$PATH
export PATH="$HOME/development/flutter/bin":$PATH
export SPARK_HOME="/opt/apache-spark"
export ELECTRON_OZONE_PLATFORM_HINT="auto"
eval "$(fnm env)"
eval "$(zoxide init zsh)"
