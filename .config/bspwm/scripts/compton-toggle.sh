#!/bin/bash
if pgrep -x "picom" > /dev/null
then
	killall picom && notify-send "compton is off"
else
	picom -b && notify-send "compton is on"
fi
