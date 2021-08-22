#!/bin/bash
export XAUTHORITY=/home/$USER/.Xauthority
export DISPLAY=:0

function connect(){
xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 1920x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off
feh --no-fehbg --bg-scale ~/.wallpaper.jpg --bg-scale ~/Pictures/h1.jpg
}

function disconnect(){
xrandr --output HDMI-A-0 --off --off --output DisplayPort-0 --off --output DisplayPort-1 --off
}

xrandr | grep "HDMI-A-0 connected" &> /dev/null && connect || disconnect
