# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -r /home/user/.config/bash_completion ] && . /home/user/.config/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*|st*)
		PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi


	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
fi

unset use_color safe_term match_lhs sh

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export MANPAGER="nvim -c 'set ft=man' -"
export HISTSIZE=20000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups

alias clean='sudo pacman -Rsn $(pacman -Qdtq)'
alias cp="cp -r"              
alias v=nvim
alias vi=nvim
alias vim=nvim
alias sv=sudoedit
alias mv='mv -i'
alias ln='ln -i'
alias cp='cp -r'
alias rmt='trash-put'
alias ls='exa -s type --color auto'
alias la='exa -s type -a'
alias ll='exa -s type -l --git -g'
alias lt='exa -s type --tree'
alias lla='exa -s type -la --git -g'
alias gotest='golangci-lint run --enable-all' #test lint
alias gs='git status'
alias gp='git push'
alias gcm='git commit -m'
alias ga='git add'
alias gb='git branch'
alias gd='git diff'
alias gl='git log'
alias p=python
alias py=python
alias mutt='neomutt -n'
#alias update='sudo emerge --sync -q && sudo emerge --update --deep -akq --newuse @world'
alias timeupd='sudo ntpdate fr.pool.ntp.org'
alias adb-restart='sudo adb kill-server && sudo adb start-server'
alias rsync='rsync -rh --info=progress2'
alias s='sudo systemctl'
# alias t=task
# alias d=startx
# alias x='startx ~/.xinitrc xfce'
alias lsblk='lsblk --output NAME,SIZE,RO,MOUNTPOINT,UUID'
alias chat=profanity

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend
# shopt -s cdspell # autocorrects cd misspellings.
#bind "set completion-ignore-case on" # ignore upper and lowercase when TAB completion.
#bind "set show-all-if-ambiguous On"

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#
# # pdf - pdf convertor
# # usage: pdf <file>
pdf ()
{
	name=$(echo $1 | cut -d\. -f1)
	pandoc $1 -o $name.pdf
}
# PS1='\[\e[01;96m\]\W \[\e[00m\]$ '
# PS1='\[\e[0;1;38;5;40m\]\w\[\e[0m\] $ '
PS1='$ '

bind '"\C-a":"fg\015"'
# set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
bind 'set mark-symlinked-directories on'

#complete -C /home/user/go/bin/gocomplete go
source ~/.complete_alias
source /usr/share/fzf/key-bindings.bash
#source /usr/share/doc/fzf/examples/completion.bash
#source /home/user/.local/share/bash-completion/completions/*

#eval "$(gh completion -s bash)"
eval "$(pandoc --bash-completion)"
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  source ~/.config/exercism/exercism_completion.bash
fi
. "$HOME/.cargo/env"
