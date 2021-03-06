#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# column_circle     column_square     column_rounded     column_alt
# card_circle     card_square     card_rounded     card_alt
# dock_circle     dock_square     dock_rounded     dock_alt
# drop_circle     drop_square     drop_rounded     drop_alt
# full_circle     full_square     full_rounded     full_alt
# row_circle      row_square      row_rounded      row_alt

theme="neptune_card_alt.rasi"
dir="$HOME/.config/rofi/powermenu"

# random colors
#styles=($(ls -p --hide="colors.rasi" $dir/styles))
#color="${styles[$(( $RANDOM % 8 ))]}"

# comment this line to disable random colors
#sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

# comment these lines to disable random style
#themes=($(ls -p --hide="powermenu.sh" --hide="styles" --hide="confirm.rasi" --hide="message.rasi" $dir))
# theme="${themes[$(( $RANDOM % 24 ))]}"

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/$theme"

# Options
shutdown=""
reboot=""
suspend=""
lock=""
logout=""
yes=""
no=""
# Confirmation
confirm_exit() {
    echo -e "$yes\n$no" | $rofi_command -dmenu \
		-p "Are You Sure? : " \
        -theme-str '#window { width: 25%;}' \
        -selected-row 1
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend\n$lock\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -m -1 -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
		ans=$(confirm_exit &)
		if [[ $ans == "" ]]; then
			systemctl poweroff
		elif [[ $ans == "" ]]; then
			exit 0
        fi
        ;;
    $reboot)
		ans=$(confirm_exit &)
		if [[ $ans == "" ]]; then
			systemctl reboot
		elif [[ $ans == "" ]]; then
			exit 0
        fi
        ;;
    $lock)
        /home/ted/.bin/lock -i ~/.config/i3lock/blue-wolf.jpg && systemctl suspend
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
		ans=$(confirm_exit &)
		if [[ $ans == "" ]]; then
				bspc quit
		elif [[ $ans == "" ]]; then
			exit 0
        else
			msg
        fi
        ;;
esac
