#!/usr/bin/env bash

## Terminate already running bar instances
#killall -q polybar

## Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#for m in $(polybar --list-monitors | cut -d":" -f1); do
#	WIRELESS=$(ls /sys/class/net/ | grep ^wl | awk 'NR==1{print $1}') MONITOR=$m polybar --reload mainbar-bspwm -c ~/.config/polybar/config &
#done

#echo "Bars launched..."

#===========================================================================#


# Add this to your wm startup file.

 Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mainbar-bspwm -c ~/.config/polybar/bubbles.ini &
  done
fi

#==========================================================================#


## Terminate already running bar instances
#killall -q polybar

## Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar mainbar-bspwm >>/tmp/polybar1.log 2>&1 &


