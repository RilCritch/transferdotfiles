#!/bin/bash

## AwesomeWM startup script ######################################################
#
## Inspired by arco linux awesome startup
#
## Author: Ril Critch
#
## Updated: 4/16/2023
#
##################################################################################

function run {
	if ! pgrep $1; then
		$@ &
	fi
}

## Startup applications ########

# arcolinux ###########

run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop

#######################

# systray #############

run nm-applet
run pamac-tray
run volumeicon
# run blueberry-tray

#######################

# polybar #############

# terminate already running bar isntances
killall -q polybar

# wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# start polybar
if type "xrandr" >/dev/null; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload main -c /home/rc/.config/polybar/config.ini &
	done
else
	polybar --reload main -c /home/rc/.config/polybar/config.ini &
fi

#######################

# utility #############

run xfce4-power-manager
run xbindkeys
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run /home/rc/Documents/my_scripts/displaysetting.sh
# run /home/rc/Documents/my_scripts/appimagehandler.sh -- Need to fix so it waits until the file is downloaded fully
# run clipmenud

#######################

# look and feel #######

run nitrogen --restore
run picom --experimental-backends --config /home/rc/.config/awesome/configs/picom.conf
# run conky -c /home/rc/.config/awesome/conky/systemoverview.config

#######################

# applications ########

#######################

################################
