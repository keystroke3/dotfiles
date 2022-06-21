#!/bin/bash

# LIBVA_DRIVER_NAME=i914 discord \
#       --ignore-gpu-blocklist \
#       --disable-features=UseOzonePlatform \
#       --enable-features=VaapiVideoDecoder \
#       --use-gl=desktop \
#       --enable-gpu-rasterization \ 
#       --enable-zero-copy

LOG_DIR=~/logs/autostart
declare -a programs=(
nm-applet
flameshot
dunst
)
declare -a lazy_load=(
thunderbird
copyq
kdeconnectd
kdeconnect-indicator
discord
)
for program in "${programs[@]}"; do
   if pgrep $program; then
       :
   else
       $program &> $LOG_DIR/$program &
   fi
done 

xsetroot -cursor_name left_ptr &
dirmngr --daemon &> $LOG_DIR/xsetroot
~/.config/bspwm/scripts/switch-displays wm &> $LOG_DIR/switch
picom --experimental-backends --daemon --log-level WARN --log-file $LOG_DIR/picom
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &> $LOG_DIR/polkit &

sleep 10
for program in "${lazy_load[@]}"; do
   if pgrep $program; then
       :
   else
       $program &> $LOG_DIR/$program &
   fi
done 

setxkbmap -option compose:ralt &
wmname LG3D &

