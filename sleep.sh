#!/bin/sh
#in /usr/lib/systemd/system-sleep/
if [ "${1}" == "pre" ]; then
	chvt 2
elif [ "${1}" == "post" ]; then
	chvt 1
fi
