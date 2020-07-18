#!/bin/bash

# Restart
killall polybar sxhkd 
sxhkd &
polybar v1 &

# Start
pidof xcape || xcape -e 'Super_L=Alt_L|F1'
pidof dunst || dunst &
pidof picom || picom --experimental-backends

# Confs
setxkbmap -option grp:alt_shift_toggle us,fr,ua &
feh --bg-scale ~/Pictures/wallpapers/0031.jpg
xsetroot -cursor_name left_ptr
setxkbmap -option caps:swapescape
