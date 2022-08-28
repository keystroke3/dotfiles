lxsession &> ~/logs/lxsession &
eval $(gnome-keyring-daemon --start) 
export SSH_AUTH_SOCK
xrdb -load ~/.Xresources &> ~/logs/xrdb &
# exec bspwm &> ~/logs/bspwm
exec qtile start -c /home/salvaje/.config/qtile/config.py
