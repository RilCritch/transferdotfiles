#!/usr/bin/bash

# This is a shell script for setting the screen refresh rate

display=$(xrandr --listactivemonitors | awk 'NR==2' | xargs)
# echo "$display"

# check for display
if [ "$display" = "0: +HDMI-A-0 2560/697x1440/392+0+0 HDMI-A-0" ]; then
	xrandr -r 144
# else
# 	echo "failed"
fi
