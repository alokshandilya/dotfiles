#!/bin/sh
#
alias ai="python /home/aloks/.local/bin/scripts/ai_enhanced.py"
alias sortsize='find . -type f -printf "%s %p\n" | awk '\''{size_bytes = $1; filename = ""; for (i = 2; i <= NF; i++) {filename = filename " " $i;} sub(/^ /, "", filename); printf "%d %s\n", size_bytes, filename;}'\'' | sort -nr | awk '\''{size_bytes = $1; filename = ""; for (i = 2; i <= NF; i++) {filename = filename " " $i;} sub(/^ /, "", filename); if (size_bytes < 1024) {printf "%d bytes %s\n", size_bytes, filename;} else if (size_bytes < 1024*1024) {printf "%.2f KB %s\n", size_bytes/1024, filename;} else if (size_bytes < 1024*1024*1024) {printf "%.2f MB %s\n", size_bytes/(1024*1024), filename;} else {printf "%.2f GB %s\n", size_bytes/(1024*1024*1024), filename;}}'\'''
alias ..='cd ..'
alias ...='cd ../..'
alias j='z'
alias f='zi'
alias g='lazygit'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias nvimrc='nvim ~/.config/nvim/'
alias nman='bob'
alias sshk="kitty +kitten ssh"
alias ls='exa --icons'
alias la='exa --icons -la'
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

alias ssh='TERM=xterm-256color ssh'

# Remarkable
alias remarkable_ssh='ssh root@10.11.99.1'
alias restream='restream -p'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# alias code='prime-run code .'
# alias code='code --enable-features=UseOzonePlatform,WaylandWindowDecorations,Vulkan --ozone-platform=wayland --enable-gpu-rasterization --ignore-gpu-blocklist --disable-features=UseChromeOSDirectVideoDecoder'
# alias code .='_NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia code .'
# alias code='prime-run code --ozone-platform=wayland --enable-features=UseOzonePlatform'
# alias zeditor .='prime-run zeditor .'

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
