# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export TERMINAL=st
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
# export MANPAGER="nvim -c 'set ft=man' -"
export BROWSER=firefox
export EDITOR=nvim
export READER=zathura
export VISUAL=nvim
export VIDEO=mpv
export IMAGE=feh
export WM=dwm

export HISTSIZE=20000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups

# export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

export ANDROID_HOME="$HOME/.local/lib/android-sdk"
export JAVA_HOME='/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64'
#export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
export _JAVA_AWT_WM_NONREPARENTING=1
export ANDROID_SDK_ROOT="$HOME/.local/lib/android-sdk"

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/tools/bin/
export PATH=$PATH:$ANDROID_HOME/tools/
export PATH="$HOME/.cargo/bin:$HOME/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/.npm-global/bin:$PATH:/usr/sbin:/usr/lib/dart/bin:$HOME/.local/lib/flutter/bin:$ANDROID_HOME/cmdline-tools/4.0/bin:$ANDROID_HOME/cmdline-tools/latest/bin"

GPG_TTY=$(tty)
export GPG_TTY

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/lib64
export WINIT_X11_SCALE_FACTOR=1
export NPM_CONFIG_PREFIX=$HOME/.npm-global
export MOZ_USE_XINPUT2=1
export CHROME_EXECUTABLE=/usr/bin/chromium
