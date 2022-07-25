colorscript -r

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
eval "$(zoxide init zsh)"

eval "$(starship init zsh)"
