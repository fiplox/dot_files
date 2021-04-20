#fish_vi_key_bindings
fish_default_key_bindings
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'" 
# set -x MANPAGER "nvim -c 'set ft=man' -"

alias v=nvim
alias vi=nvim
alias vim=nvim
alias sv=sudoedit
alias mv='mv -i'
alias ln='ln -i'
alias rm='echo "Try again with rmt."; false'
alias rmt='trash-put'
alias untar='tar -xvf'
alias ls='lsd -X'
alias la='lsd -AX'
alias ll='lsd -lX'
alias lt='lsd --tree'
alias lla='lsd -lAX'
alias gs='git status'
alias gp='git push'
alias gpll='git pull'
alias gcm='git commit -m'
alias ga='git add'
alias gpom='git pull origin master'
alias gb='git branch'
alias gck='git checkout'
alias gd='git diff'
alias gl='git log'
alias p=python

bind \cx 'fg'

set PATH $PATH /home/user/.cargo/bin
set -Ux JAVA_OPTS '-XX:+IgnoreUnrecognizedVMOptions'
set -g fish_prompt_pwd_dir_length 0
set -g theme_display_date no
set -x -U GOPATH $HOME/go
set PATH $HOME/go/bin $HOME/bin $PATH
