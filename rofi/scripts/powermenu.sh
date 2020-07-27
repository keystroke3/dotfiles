#!/bin/bash

rofi_command="rofi -theme themes/bluepower.rasi"

### Options ###
power_off="襤"
reboot=""
lock=""
suspend=""
log_out=""
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        sh ~/.bin/blueprompt --yes-command "systemctl poweroff" --query "Shutdown?"
        ;;
    $reboot)
        sh ~/.bin/blueprompt --yes-command "systemctl reboot" --query "Reboot?"
        ;;
    $lock)
        mantablockscreen -sc
        ;;
    $suspend)
        mantablockscreen -sc &
        systemctl suspend
        ;;
    $log_out)
        kill -9 -1
        ;;
esac

