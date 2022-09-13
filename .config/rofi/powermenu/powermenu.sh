#!/bin/bash
WM=$(cat /tmp/wm)
theme="neptune_card_alt.rasi"
dir="$HOME/.config/rofi/powermenu"
uptime=$(uptime -p | sed -e 's/up //g')
rofi_command="rofi -theme $dir/$theme"
apagado="⏻"
recargado=""
dormido=""
cerrado=""
salido=""
yes=""
no=""
confirm_exit() {
    echo -e "$yes\n$no" | $rofi_command -dmenu \
		-p "Are You Sure? : " \
        -theme-str '#window { width: 25%;}' \
        -selected-row 1
}
options="$apagado\n$recargado\n$dormido\n$cerrado\n$salido"
chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -m -1 -dmenu -selected-row 2)"
case $chosen in
    $apagado)
	ans=$(confirm_exit &)
	if [[ $ans == "" ]]; then
		poweroff
	elif [[ $ans == "" ]]; then
		exit 0
        fi
        ;;
    $recargado)
	ans=$(confirm_exit &)
	if [[ $ans == "" ]]; then
		reboot
	elif [[ $ans == "" ]]; then
		exit 0
        fi
        ;;
    $lock)
        /home/salvaje/.bin/lock -i ~/.config/i3lock/blue-wolf.jpg && systemctl suspend
        ;;
    $dormido)
        systemctl suspend
        ;;
    $salido)
	ans=$(confirm_exit &)
	if [[ $ans == "" ]]; then
		[[ $WM == "bspwm" ]] && bspc quit || 
            /usr/bin/python -c "from libqtile.command.client import InteractiveCommandClient as qtile; qtile.shutdown()"
	elif [[ $ans == "" ]]; then
		exit 0
        else
		msg
        fi
        ;;
esac
