#!/bin/bash


xlayoutdisplay -p eDP1 -o HDMI1 -d 100
declare -a programs=(
"ssh-agent" 
# "blueman-tray"
"sxhkd"
"nm-applet"
"flameshot"
"dunst"
)

declare -a lazy_load=(
"thunderbird"
exec /usr/lib/kdeconnectd
indicator-kdeconnect
#code
)
sleep 2
for program in "${programs[@]}"; do
   if pgrep $program; then
       :
   else
       $program &
   fi
done 

$HOME/.config/polybar/launch.sh &
# 
mons_num=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -w)
xrandr --output HDMI1 --left-of eDP1 --output eDP1 --mode 1920x1080 
if [ $mons_num -eq 2 ]; then
    bspc monitor eDP1 -d  6 7 8 9 0
    bspc monitor HDMI1 -d 1 2 3 4 5
else
    bspc monitor eDP1 -d 1 2 3 4 5 6 7 8 9 0
fi
picom --daemon --config ~/dotfiles/bspwm/compton.conf
~/.redpaper/wallpaper.sh $
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
sleep 20
for program in "${lazy_load[@]}"; do
   if pgrep $program; then
       return 0
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
setxkbmap -option compose:ralt
xinput set-prop "Elan Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-button-map "Elan Touchpad" 1 3 2 4 5 6 7
xmodmap -e 'keycode 135 = Super_R'
xsetroot -cursor_name left_ptr
dirmngr --daemon
wmname LG3D
