HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory
# some useful options (man zshoptions)
setopt autocd extendedglob menucomplete
unsetopt nomatch
setopt interactive_comments
stty stop undef  # Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')
unsetopt BEEP

#########################
######## Exports ########
#########################
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.local/bin/scripts":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export PATH=$HOME/Documents/Applications/console/pandoc/bin:$PATH
export GOPATH=$HOME/.local/share/go
export PATH=$HOME/.emacs.d/bin:$PATH
export BAT_THEME="gruvbox-dark"
export QT_QPA_PLATFORMTHEME=qt5ct
eval "$(zoxide init zsh)"
# fnm
export PATH=/home/aloks/.fnm:$PATH
eval "`fnm env`"

#########################
######## Aliases ########
#########################
alias j='z'
alias f='zi'
alias g='lazygit'
alias nvrc='nvim ~/.config/nvim/'
alias v='nvim'
alias sv='sudo -E nvim'
alias upd='paru'
alias ls='exa --icons -l'
alias pain='paru -S'
alias mpv='mpv --hwdec=auto'
alias parm='paru -Rns'
alias gcp='g++ -Wall -std=c++20'
alias rel='xrdb merge /home/aloks/.Xresources && kill -USR1 $(pidof st)'
alias ytbv='yt-dlp -f bestaudio+bestvideo --verbose'
alias ytba='yt-dlp -f bestaudio -x --audio-format mp3 --verbose'
alias mdtopdf="pandoc --pdf-engine=xelatex -V 'mainfont:DejaVuSerif' -V 'mainfontoptions:Extension=.ttf, UprightFont=*, BoldFont=*-Bold, ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic' -V 'sansfont:DejaVuSans.ttf' -V 'monofont:DejaVuSansMono.ttf' -V "geometry:margin=1in" --highlight-style=zenburn"
alias dwmbuild="sudo cp config.def.h config.h && sudo make clean install"
# eg : mdtopdf <file.md> -o <file.pdf>
alias emacs='emacsclient -c -a 'emacs''
alias wallchange='feh --bg-fill -zr ~/Pictures/wallpapers'
alias n='notetaker'
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

#############################
######## Keybindings ########
#############################
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey -s '^o' 'ranger^M'
bindkey -s '^f' 'zi^M'
bindkey -s '^s' 'ncdu^M'
# bindkey -s '^n' 'nvim $(fzf)^M'
# bindkey -s '^v' 'nvim\n'
bindkey -s '^z' 'zi^M'
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"
setxkbmap -option caps:escape
xset r rate 210 40

##########################
######## Starship ########
##########################
eval "$(starship init zsh)"
# colorscript -r

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
