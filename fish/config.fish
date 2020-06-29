#fish_vi_key_bindings
fish_default_key_bindings
alias wifi-menu='nmtui'
alias update='sudo pacman -Syu'
alias c='clear'
alias search='pacman -Ss'
alias cp="cp -i"              
alias clean='sudo pacman -Rsn (pacman -Qdtq)'
alias v=nvim
alias vi=nvim
alias svi='sudo nvim'
alias svim='sudo nvim'
alias vim=nvim
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -riv'
alias untar='tar -xvf'
alias ls='lsd'
alias la='lsd -A'
alias ll='lsd -l'
alias lt='lsd --tree'
alias lla='lsd -lA'
alias cat=bat
alias gotest='golangci-lint run'
alias update-music='mpc update && mpc clear && mpc add (mpc ls)'

set -g theme_display_date no
set -x -U GOPATH $HOME/go
set PATH $HOME/go/bin $HOME/bin $PATH
