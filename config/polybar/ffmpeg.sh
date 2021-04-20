#!/bin/sh
RED='\033[0;31m'
RESET='\033[0m'
if pgrep -x "ffmpeg" >/dev/null
then
	#echo "%{F#f00}壘%{F-}"
	echo -e "壘"
else
	echo -e "雷"
fi
