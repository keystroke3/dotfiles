#!/bin/bash

declare -a programs=(
"kdeconnect-indicator"
"ssh-agent" 
"blueman-tray"
"sxhkd"
"nm-applet"
"xfce4-power-manager"
)

for program in "${programs[@]}"; do
   if pgrep $program; then
       return 0
   else
       $program &
   fi
done 

picom --config ~/.config/picom.conf &
~/.config/bspwm/scripts/starttauon.sh
~/.redpaper/wallpaper.sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
$HOME/.config/polybar/launch.sh &
sleep 300 && thunderbird &
