sxhkd &
setxkbmap -option compose:ralt
xinput set-prop "Elan Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-button-map "Elan Touchpad" 1 3 2 4 5 6 7
xmodmap -e 'keycode 135 = Super_R'
xsetroot -cursor_name left_ptr
dirmngr --daemon
# exec tdm --xstart
exec bspwm
