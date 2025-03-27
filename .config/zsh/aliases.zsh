#!/bin/sh

alias ..='cd ..'
alias ...='cd ../..'
alias j='z'
alias f='zi'
alias g='lazygit'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias nvimrc='nvim ~/.config/nvim/'
alias nman='bob'
alias sshk="kitty +kitten ssh"
alias ls='eza --icons'
alias la='eza --icons -la'
alias mdtopdf="pandoc --pdf-engine=xelatex -V 'mainfont:DejaVuSerif' -V 'mainfontoptions:Extension=.ttf, UprightFont=*, BoldFont=*-Bold, ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic' -V 'sansfont:DejaVuSans.ttf' -V 'monofont:DejaVuSansMono.ttf' -V "geometry:margin=1in" --highlight-style=zenburn"
alias vim='nvim'
alias rel='xrdb merge /home/aloks/.Xresources && kill -USR1 $(pidof st)'

# yt-dlp
# alias ytbv='yt-dlp -f bestaudio+bestvideo --verbose --no-playlist'
alias ytbv='yt-dlp -f "bestvideo[height<=1080]+bestaudio" --merge-output-format mp4 --verbose --no-playlist'
alias ytba='yt-dlp -f bestaudio -x --audio-format mp3 --verbose --no-playlist'
# alias ytp='yt-dlp --yes-playlist -o "%(playlist_index)s-%(title)s.%(ext)s"'
alias ytp='yt-dlp -f "bestvideo[height<=720]+bestaudio" --merge-output-format mp4 --yes-playlist -o "%(playlist_index)s-%(title)s.%(ext)s"'
alias ytfzf='ytfzf --rii -t'

# Remarkable
alias remarkable_ssh='ssh root@10.11.99.1'
alias restream='restream -p'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# mirror
# alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirror="sudo reflector -c India -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# pgadmin4
# alias pgadmin4='cd ~/Desktop && source .venv/bin/activate && pgadmin4'
alias pytesta='pytest -v --disable-warnings -x'
