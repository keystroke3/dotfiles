#!/bin/bash
echo 'qtile' > /tmp/wm &
~/.config/sxhkd/sxhkdd &
LOG_DIR=/home/salvaje/logs
nm-applet & disown
flameshot & disown
caffeine & disown
dunst & disown
gnome-keyring-daemon --start &> /dev/null
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown
dirmngr --daemon &> $LOG_DIR/xsetroot
picom --experimental-backends --daemon --log-level DEBUG --log-file $LOG_DIR/picom &> /dev/null
~/.config/qtile/scripts/xrandr-manager &

sleep 10
thunderbird &
kdeconnectd &
kdeconnect-indicator & 
setxkbmap -option compose:ralt &
pw-jack qjackctl &
copyq & disown
discord &
# LIBVA_DRIVER_NAME=i914 discord \
#       --ignore-gpu-blocklist \
#       --disable-features=UseOzonePlatform \
#       --enable-features=VaapiVideoDecoder \
#       --use-gl=desktop \
#       --enable-gpu-rasterization \ 
#       --enable-zero-copy &

qbittorrent-nox -d &
