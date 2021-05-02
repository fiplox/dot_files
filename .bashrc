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
GPG_TTY=$(tty)
export GPG_TTY

# Put your fun stuff here.

alias ls='ls --color=auto'
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
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
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

#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
 #export MANPAGER="nvim -c 'set ft=man' -"
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
alias ls='exa --icons -s type --color auto'
alias la='exa --icons -s type -a'
alias ll='exa --icons -s type -l --git -g'
alias lt='exa --icons -s type --tree'
alias lla='exa --icons -s type -la --git -g'
alias gotest='golangci-lint run --enable-all'
alias gs='git status'
alias gp='git push'
alias gcm='git commit -m'
alias ga='git add'
alias gb='git branch'
alias gd='git diff'
alias gl='git log'
alias p=python
alias py=python
alias pman='sudo pacman'
#alias update='sudo emerge --sync -q && sudo emerge --update --deep -akq --newuse @world'
alias timeupd='sudo ntpdate fr.pool.ntp.org'
alias adb-restart='sudo adb kill-server && sudo adb start-server'

xhost +local:root > /dev/null 2>&1

#complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s autocd
shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend
shopt -s cdspell # autocorrects cd misspellings.
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
# PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\]'
#export LS_COLORS='di=38;5;33:ln=38;5;44:so=38;5;44:pi=38;5;44:bd=38;5;44:or=38;5;124:cd=38;5;172:ex=38;5;40:fi=38;5;184:no=38;5;245'
#PS1='\[\e[01;33m\][\[\e[01;32m\]\u@\h\[\e[01;34m\] \w \[\e[01;33m\]]\[\e[01;34m\]\$\[\e[00m\] '
PS1='\[\e[01;96m\]\W \[\e[00m\]$ '
#if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    #GIT_PROMPT_ONLY_IN_REPO=1
    #GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
    #GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules
    #GIT_PROMPT_WITH_VIRTUAL_ENV=0 # uncomment to avoid setting virtual environment infos for node/python/conda environments

   ## GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
   ## GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files

   ## GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

   ## GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

   ## GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
   ## GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

   ## as last entry source the gitprompt script
   ## GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
   ## GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
    #GIT_PROMPT_THEME=Single_line_NoExitState_Gentoo # use theme optimized for solarized color scheme
    #source $HOME/.bash-git-prompt/gitprompt.sh
#fi

bind '"\C-a":"fg\015"'
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
bind 'set mark-symlinked-directories on'

complete -C /home/user/go/bin/gocomplete go
source "$HOME/.cargo/env"
