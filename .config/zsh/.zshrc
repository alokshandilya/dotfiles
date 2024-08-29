#!/bin/sh

xset r rate 210 40

# history
HISTFILE=~/.zsh_history

# source
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/exports.zsh"


# keybinds
bindkey '^ ' autosuggest-accept

export PATH="$HOME/.local/bin":$PATH

if command -v bat &> /dev/null; then
  alias cat="bat --theme gruvbox-dark" 
  alias catt="bat -pp --theme gruvbox-dark" 
fi

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# starship prompt
eval "$(starship init zsh)"
