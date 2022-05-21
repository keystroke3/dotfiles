#/usr/bin/prime-offload
sxhkd &
lxsession &
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
xrdb -load ~/.Xresources &
# exec tdm --xstart
exec bspwm
#sudo /usr/bin/prime-switch
