#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="lvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.docker/bin":$PATH
# export PATH="$HOME/.local/lvim-macos-arm64/bin":$PATH
export MANPAGER='lvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export GOPATH=$HOME/.local/share/go
export PATH=$HOME/.local/share/fnm:$PATH
export PATH=$HOME/.config/emacs/bin:$PATH
export PATH="$HOME/.local/share/neovim/bin":$PATH
export PATH="$HOME/.local/share/bob/lvim-bin":$PATH
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
#export PATH="$PATH:./node_modules/.bin"
eval "$(fnm env)"
eval "$(zoxide init zsh)"
# eval "`pip completion --zsh`"

case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
  export DYLD_LIBRARY_PATH=/opt/homebrew/lib/
  export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib
	;;

Linux)
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac
