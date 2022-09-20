#########################
######## PATH ###########
#########################
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin \
  $HOME/.local/bin/scripts \
  $HOME/.fnm \
  # $HOME/Documents/Applications/console/pandoc/bin \ # use pandoc-bin from aur
  $HOME/.emacs.d/bin $fish_user_paths

############################
######## EXPORTS ###########
############################
set fish_greeting                     # Supresses fish's intro message
set TERM "xterm-256color"             # Sets the terminal type
set EDITOR "nvim"                     # $EDITOR use nvim in terminal
set VISUAL "neovide"                  # $VISUAL use neovide
set -x MANPAGER 'nvim +Man!'
set -x MANWIDTH 999
set -x BAT_THEME "gruvbox-dark"
# set -x BAT_THEME "OneHalfDark"
set -Ux QT_QPA_PLATFORMTHEME qt5ct

############################
######## VI MODE ###########
############################
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end

############################
######## ALIASES ###########
############################
# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias j='z'
alias f='zi'
alias g='lazygit'
alias nvrc='nvim ~/.config/nvim/'
alias v='nvim'
alias sv='sudo -E nvim'
alias cat='bat'
alias upd='paru'
alias paclockrem='sudo rm -f /var/lib/pacman/db.lck'
alias snls='snapper ls'
alias sndl='snapper delete'
alias ls='exa --icons -l'
alias la='exa --icons -la'
alias pain='paru -S'
alias mpv='mpv --hwdec=auto'
alias parm='paru -Rns'
alias gcp='g++ -Wall -std=c++20'
alias rel='xrdb merge /home/aloks/.Xresources && kill -USR1 $(pidof st)'
alias ytbv='yt-dlp -f bestaudio+bestvideo --verbose'
alias ytba='yt-dlp -f bestaudio -x --audio-format mp3 --verbose'
alias ytp='yt-dlp --yes-playlist -o "%(playlist_index)s-%(title)s.%(ext)s"'
alias mdtopdf="pandoc --pdf-engine=xelatex -V 'mainfont:DejaVuSerif' -V 'mainfontoptions:Extension=.ttf, UprightFont=*, BoldFont=*-Bold, ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic' -V 'sansfont:DejaVuSans.ttf' -V 'monofont:DejaVuSansMono.ttf' -V "geometry:margin=1in" --highlight-style=zenburn"
# eg : mdtopdf <file.md> -o <file.pdf>
alias emacs='emacsclient -c -a 'emacs''
alias wallchange='feh --bg-fill -zr ~/Pictures/wallpapers'
alias n='notetaker'
alias ndsa='nvim ~/Dropbox/notes/src/note-1-dsa.md'
alias ka='killall'
alias c='clear'
# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'
# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'
# For when keys break
alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"

setxkbmap -option caps:escape
xset r rate 210 40

zoxide init fish | source

starship init fish | source
pfetch
