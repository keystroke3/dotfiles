#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

polybar-launch &

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

indicator-kdeconnect &
libinput-gestures-setup start
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add /home/ted/.ssh/github /home/ted/.ssh/bitbucket
fi

xsetroot -cursor_name left_ptr &
sxhkd &
run nm-applet &
run xfce4-power-manager &
blueberry-tray &
compton --config $HOME/.config/bspwm/compton.conf &
conky  &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
$HOME/.redpaper/wallpaper.sh &
wal -i Pictures/Redpaper/Firewatch\ but\ without\ man-made\ objects\ or\ birds..png  -n &
