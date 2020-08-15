#!/bin/bash
setxkbmap -option compose:ralt
xinput --set-button-map 8 1 3 2 4 5 6 7
xinput set-prop 11 331 0.7
xinput set-prop 8 319 1
xsetroot -cursor_name left_ptr
dirmngr --daemon
declare -a programs=(
"ssh-agent" 
# "blueman-tray"
"sxhkd"
"nm-applet"
"xfce4-power-manager"
"flameshot"
"dunst"
)

declare -a lazy_load=(
"thunderbird"
exec /usr/lib/kdeconnectd
indicator-kdeconnect
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
