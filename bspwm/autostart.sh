#!/bin/bash

declare -a programs=(
"ssh-agent" 
"blueman-tray"
"sxhkd"
"nm-applet"
"xfce4-power-manager"
)

declare -a lazy_load=(
"thunderbird"
"kdeconnect-indicator"
)

$HOME/.config/polybar/launch.sh &
for program in "${programs[@]}"; do
   if pgrep $program; then
       :
   else
       $program &
   fi
done 

if pgrep "tauonmb";then 
    :
else 
    nohup python3 /opt/tauon-music-box/tauon.py %U &
fi

picom --config ~/.config/picom.conf &
~/.redpaper/wallpaper.sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
sleep 30
for program in "${lazy_load[@]}"; do
   if pgrep $program; then
       return 0
   else
       $program &
   fi
done 

