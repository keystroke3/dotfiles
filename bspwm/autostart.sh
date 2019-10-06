#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

$HOME/.config/polybar/launch.sh &
kdeconnect-indicator &

#change your keyboard if you need it
#setxkbmap -layout be

#Some ways to set your wallpaper besides variety or nitrogen
# feh --bg-scale ~/.config/bspwm/wall.png &
#feh --randomize --bg-fill ~/Képek/*
#feh --randomize --bg-fill ~/Dropbox/Apps/Desktoppr/*

xsetroot -cursor_name left_ptr &
sxhkd &
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/github
# conky -c $HOME/.config/bspwm/system-overview &
#run variety &
run nm-applet &
devilspie &
# run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
compton --config $HOME/.config/bspwm/compton.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
#nitrogen --set-auto Pictures/blackpink.png
# ulauncher &
$HOME/.redpaper/wallpaper.sh &
wal -i /home/ted/Pictures/Redpaper/Astronaut\ and\ the\ black\ hole\ fantasy\ space\ \[1920x1080\].jpeg -n &
#auto-xflux -k 1800

#Git init
eval "$(ssh-agent -s)"

