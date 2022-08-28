#!/bin/bash
echo 'bspwm' > /tmp/wm &
sxhkdd &> ~/logs/sxhkd &
LOG_DIR=~/logs/autostart
declare -a programs=(
nm-applet
flameshot
dunst
copyq
)
declare -a lazy_load=(
thunderbird
kdeconnectd
kdeconnect-indicator
)
for program in "${programs[@]}"; do
   if pgrep -f $program; then
       :
   else
       $program &> $LOG_DIR/$program &
   fi
done 

gnome-keyring-daemon --start &
xsetroot -cursor_name left_ptr &
dirmngr --daemon &> $LOG_DIR/xsetroot
~/.config/bspwm/scripts/switch-displays wm &> $LOG_DIR/switch
picom --experimental-backends --daemon --log-level WARN --log-file $LOG_DIR/picom

sleep 10
for program in "${lazy_load[@]}"; do
   if pgrep -f $program; then
       :
   else
       $program &> $LOG_DIR/$program &
   fi
done 

setxkbmap -option compose:ralt &
wmname LG3D &
if pgrep -f 'discord';then
	:
else
LIBVA_DRIVER_NAME=i914 discord \
      --ignore-gpu-blocklist \
      --disable-features=UseOzonePlatform \
      --enable-features=VaapiVideoDecoder \
      --use-gl=desktop \
      --enable-gpu-rasterization \ 
      --enable-zero-copy &
fi
if pgrep -f 'qjackctl';then
	:
else
	pw-jack qjackctl &
fi
