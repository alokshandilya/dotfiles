#!/bin/sh

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

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"
#
eval "$(uv generate-shell-completion zsh)"

# starship prompt
eval "$(starship init zsh)"

# Check if the terminal is kitty and run fastfetch if it is
if [[ $TERM == "xterm-kitty" ]]; then
  if command -v fastfetch >/dev/null 2>&1; then
    fastfetch
  else
    echo "fastfetch command not found."
  fi
fi
