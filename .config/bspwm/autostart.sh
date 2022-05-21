#!/bin/bash
declare -a programs=(
# "ssh-agent" 
#"blueman-tray"
"nm-applet"
"flameshot"
)
dunst &
declare -a lazy_load=(
"thunderbird"
copyq
exec /usr/lib/kdeconnectd
exec /usr/bin/kdeconnect-indicator
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
~/.config/bspwm/scripts/switch-displays &
picom --experimental-backends --daemon 
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
#xinput set-button-map "Elan Touchpad" 1 3 2 4 5 6 7 &
#xmodmap -e 'keycode 135 = Super_R' &
#wmname LG3D &

