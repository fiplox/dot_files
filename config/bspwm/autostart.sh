#!/bin/sh

# Restart
killall polybar
#sxhkd &
polybar v1 &
xset r rate 250 30
setxkbmap -option grp:alt_shift_toggle us,ua
setxkbmap -option caps:swapescape
setxkbmap -option compose:rctrl
xsetroot -cursor_name left_ptr


#light -A 100
# Start
#pgrep emote || emote &
#pidof xcape || xcape -e 'Super_L=Alt_L|F1'
#pidof dunst || dunst &
#pidof picom || picom --experimental-backends &
#sleep 0.1
#killall wallt
#wallt -path=/home/user/Pictures/wallpapers/
#notify-send -h string:fgcolor:#fa2 "Task before end of week" "`task due.before:now+10d | sed '$d'`"
#pidof light-locker || light-locker &
# Confs
feh --bg-scale ~/Pictures/1.jpg --bg-scale ~/Pictures/2.jpg
#pidof thunderbird-bin || thunderbird-bin &
#setxkbmap -option grp:alt_shift_toggle us,fr,ua 
#xsetroot -cursor_name left_ptr
#setxkbmap -option caps:swapescape

