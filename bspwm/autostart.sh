#!/bin/bash
declare -a programs=(
"ssh-agent" 
#"blueman-tray"
"nm-applet"
"flameshot"
"dunst"
)

declare -a lazy_load=(
"thunderbird"
exec /usr/lib/kdeconnectd
LIBVA_DRIVER_NAME=i915 discord \
    --ignore-gpu-blocklist \
    --disable-features=UseOzonePlatform \
    --enable-features=VaapiVideoDecoder \
    --use-gl=desktop \
    --enable-gpu-rasterization \ 
    --enable-zero-copy

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

# 
xsetroot -cursor_name left_ptr &
dirmngr --daemon &
mons_num=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -w)
xrandr --output HDMI1 --rate 144.00 --mode 1920x1080 --left-of eDP1 --output eDP1 --mode 1920x1080 
if [ $mons_num -eq 2 ]; then
    bspc monitor eDP1 -d  6 7 8 9 0
    bspc monitor HDMI1 -d 1 2 3 4 5
else
    bspc monitor eDP1 -d 1 2 3 4 5 6 7 8 9 0
fi
$HOME/.config/polybar/launch.sh &
picom --experimental-backends --daemon 
~/.cache/redpaper/wallpaper.sh &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
sleep 10
for program in "${lazy_load[@]}"; do
   if pgrep $program; then
       return 0
   else
       $program &
   fi
done 

# if pgrep -f "tauon";then 
#     :
# else 
#     python3 ~/Projects/TauonMusicBox/tauon.py %U &
#     bspc desktop -f 9
# fi
setxkbmap -option compose:ralt &
xinput set-prop "Elan Touchpad" "libinput Natural Scrolling Enabled" 1 &
#xinput set-button-map "Elan Touchpad" 1 3 2 4 5 6 7 &
#xmodmap -e 'keycode 135 = Super_R' &
#wmname LG3D &

