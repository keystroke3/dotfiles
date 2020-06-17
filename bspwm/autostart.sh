#!/bin/bash
setxkbmap -option compose:ralt
pkill -f "deadd-notification-center"
declare -a programs=(
"ssh-agent" 
"blueman-tray"
"sxhkd"
"nm-applet"
"xfce4-power-manager"
"deadd-notification-center"
)

declare -a lazy_load=(
"thunderbird"
"kdeconnect-indicator"
)

$HOME/.config/polybar/launch.sh &
sleep 2
for program in "${programs[@]}"; do
   if pgrep $program; then
       :
   else
       $program &
   fi
done 

if pgrep -f "tauon";then 
    :
else 
    python3 /opt/tauon-music-box/tauon.py %U &
    bspc desktop -f 9
fi
bspc desktop -f 1

picom --config ~/.config/picom.conf &
~/.redpaper/wallpaper.sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
sleep 20
for program in "${lazy_load[@]}"; do
   if pgrep $program; then
       return 0
   else
       $program &
   fi
done 
sleep 10
py ~/dotfiles/bspwm/scripts/swallow.py &
