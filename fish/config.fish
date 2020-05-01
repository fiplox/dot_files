alias ls='lsd'
alias update='sudo pacman -Syu'
alias c='clear'
alias search='pacman -Ss'
alias cp="cp -i"              
alias clean='sudo pacman -Rsn (pacman -Qdtq)'
alias vi='nvim'
alias svi='sudo nvim'
alias svim='sudo nvim'
alias vim='nvim'
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -i'
alias untar='tar -zxvf'
alias la='lsd -A'
alias ll='lsd -Al'
alias lt='lsd --tree'
alias gotest='golangci-lint run -E'
set -g theme_display_date no
set -x -U GOPATH $HOME/go
set PATH $HOME/go/bin $HOME/bin $PATH
