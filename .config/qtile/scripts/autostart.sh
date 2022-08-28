#!/bin/bash
echo 'qtile' > /tmp/wm &
~/.config/sxhkd/sxhkdd &
~/.config/qtile/scripts/xrandr-manager &
LOG_DIR=/home/salvaje/logs
nm-applet & disown
flameshot & disown
dunst & disown
copyq & disown
gnome-keyring-daemon --start &> /dev/null
dirmngr --daemon &> $LOG_DIR/xsetroot
picom --experimental-backends --daemon --log-level WARN --log-file $LOG_DIR/picom &> /dev/null

sleep 10
thunderbird &
kdeconnectd &
kdeconnect-indicator & 
setxkbmap -option compose:ralt &
pw-jack qjackctl &
LIBVA_DRIVER_NAME=i914 discord \
      --ignore-gpu-blocklist \
      --disable-features=UseOzonePlatform \
      --enable-features=VaapiVideoDecoder \
      --use-gl=desktop \
      --enable-gpu-rasterization \ 
      --enable-zero-copy &

