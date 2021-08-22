#!/bin/sh
date=$(date +"%Y-%m-%dT%H.%M.%S")
if pgrep -x "ffmpeg" >/dev/null
then
	pkill -3 ffmpeg	
else
	ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0 -f pulse -i 1 -ac 2 -crf 0 -preset ultrafast "/home/user/Videos/$date.mkv"
fi
	#ffmpeg -f pulse -i 1 -ac 2 -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0+0,0 -c:v libx264rgb -crf 0 -preset ultrafast -threads 8 "/home/user/Videos/$date.mkv"

