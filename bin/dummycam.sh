#!/bin/sh
VVV=$(cat /home/user/.config/sxhkd/vvv)
echo $VVV
if pgrep -x "ffmpeg" >/dev/null
then
	pkill -3 ffmpeg
else
	if [ $VVV -eq 1 ]
	then
		echo $VVV
		ffmpeg -f x11grab -framerate 60 -video_size 1920x1080 -probesize 64M -i :0.0+0,840 -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video7
	else
		ffmpeg -f x11grab -framerate 60 -video_size 1920x1080 -probesize 64M -i :0.0+0,0 -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video7
	fi
fi
