#!/bin/sh

# history
HISTFILE=~/.zsh_history

# source
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/exports.zsh"

export PATH="$HOME/.local/bin":$PATH

if command -v bat &> /dev/null; then
  alias cat="bat --theme gruvbox-dark"
  alias catt="bat -pp --theme gruvbox-dark"
fi

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# keybinds

# Enable vim mode
bindkey -v

# Reduce ESC delay for faster mode switching
export KEYTIMEOUT=1

# Change cursor shape based on vi mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'  # Block cursor for normal mode
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'  # Beam cursor for insert mode
  fi
}
zle -N zle-keymap-select

# Initialize with beam cursor
echo -ne '\e[5 q'

bindkey '^ ' autosuggest-accept

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
