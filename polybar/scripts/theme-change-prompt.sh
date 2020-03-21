#!/bin/bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  _                  _             _         _____                     #
# | |                | |           | |       |____ |                    #
# | | _____ _   _ ___| |_ _ __ ___ | | _____     / /                    #
# | |/ / _ \ | | / __| __| '__/ _ \| |/ / _ \    \ \                    #
# |   <  __/ |_| \__ \ |_| | | (_) |   <  __/.___/ /                    #
# |_|\_\___|\__, |___/\__|_|  \___/|_|\_\___|\____/                     #
#            __/ |                                                      #
#           |___/                                                       #
#                                                                       #
# Github: https://github.com/keystroke3                                 #
# Reddit: u/SiliconRaven                                                #
# Twitter: @SiliconRaven                                                #
# License: GPLv3 https://www.gnu.org/licenses/gpl-3.0.en.html           #
#                                                                       #
#                                                                       #
# Useful resources:                                                     #
# https://github.com/polybar/polybar-scripts                            #
# https://github.com/davatorium/rofi                                    #
# https://github.com/jordansissel/xdotool                               #
# https://github.com/dylanaraps/pywal                                   #
# https://www.gnu.org/software/sed/manual/sed.html                      #
#                                                                       #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


SDIR="$HOME/.config/polybar/scripts"

lightcolor=xcolor15
darkcolor=xcolor15
current=black1
UPDATE="$SDIR/theme-change.sh $current" 

# Get the display dimensions and where pointer is.
eval "$(xdotool getmouselocation --shell)"
eval "$(xdotool getdisplaygeometry --shell)"

# Checks the postion of the mouse and determines where the popup should be.
# If the user's rofi theme has set dimensions and position, the user's configs are maintained
if [ "$Y" -lt "$((HEIGHT/2))" ]; then
	YSET=35
	if [ "$X" -gt "$(((WIDTH*2)/3))" ]; then #Right side
			LOC=3
			XSET=-10
		elif [ "$X" -lt "$((WIDTH/3))" ]; then #Left side
			LOC=1
			XSET=10
		else #Center
			LOC=2
	fi

elif [ "$Y" -gt "$((HEIGHT/2))" ]; then
	YSET=-35

	if [ "$X" -gt "$(((WIDTH*2)/3))" ]; then #Right side
				LOC=5
				XSET=-10
			elif [ "$X" -lt "$((WIDTH/3))" ]; then #Left side
				LOC=7
				XSET=10
			else #Center
				LOC=6
	fi
fi

position="rofi -sep | -dmenu -i  -location $LOC -xoffset $XSET -yoffset $YSET -hide-scrollbar"
colors="👕 pywal|👕 black|👕 white|👕 red|👕 lime|👕 blue|👕 yellow|👕 orange|👕 aqua|👕 fuchsia|👕 silver|👕 gray|👕 maroon|👕 olive|👕 green|👕 purple|👕 darkPurple|👕 teal|👕 navy|👕 midnightBlue|👕 pink|👕 chocolate|👕 indigo"
pywal=" xcolor0| xcolor1| xcolor2| xcolor3| xcolor4| xcolor5| xcolor6| xcolor7| xcolor8| xcolor9 | xcolor10| xcolor11| xcolor12| xcolor13| xcolor14| xcolor15"

empty_string_test(){
	if [ "$MENU" == "" ]; then
	echo "No color selected. No changes made"
	exit
	fi
}

# This part sets a user specified Pywal color and makes it the first color.
select_pywal1(){
	MENU="$($position -p Pywal_Color -columns 2 -width 30 <<<"$pywal")"	
	empty_string_test
	choice=${MENU#" "}
	sed -i -e "0,/^color1/ s/color1.*/color1='$\{colors.$choice}'/" "$SDIR/theme-change.sh"
	sed -i -e "0,/^lightcolor/ s/lightcolor.*/lightcolor=$choice/" "$SDIR/theme-change.sh"
	$UPDATE
}

# This does the same thing as select_pywal1 but with the second color
select_pywal2(){
	MENU="$($position -p Pywal_Color -columns 2 -width 30 <<<"$pywal")"
	empty_string_test
	choice=${MENU#" "}
	sed -i -e "0,/^color2/ s/color2.*/color2='$\{colors.$choice}'/" "$SDIR/theme-change.sh"
	sed -i -e "0,/^darkcolor/ s/darkcolor.*/darkcolor=$choice/" "$SDIR/theme-change.sh"
	$UPDATE
}

# Same as the above but with prespecified colors
select_color1(){
	MENU="$($position -p Light_Color -columns 2 -width 30 <<<"$colors")"
	empty_string_test
	choice=${MENU#"👕 "}
	if [ "$choice" == "pywal" ]; then
	select_pywal1
	else
	sed -i -e "0,/^color1/ s/color1.*/color1='$\{colors.$choice}'/" "$SDIR/theme-change.sh"
	sed -i -e "0,/^lightcolor/ s/lightcolor.*/lightcolor=$choice/" "$SDIR/theme-change.sh"
	fi
	$UPDATE
}

select_color2(){
	MENU="$($position -p Dark_Color -columns 2 -width 30 <<<"$colors")"
	empty_string_test
	choice=${MENU#"👕 "}
	if [ "$choice" == "pywal" ]; then
	select_pywal2
	else
	sed -i -e "0,/^color2/ s/color2.*/color2='$\{colors.$choice}'/" "$SDIR/theme-change.sh"
	sed -i -e "0,/^darkcolor/ s/darkcolor.*/darkcolor=$choice/" "$SDIR/theme-change.sh"
	fi
	$UPDATE
}


# Prompt for the user to choose.
popup(){
	MENU="$($position -columns 1 -width 20 -lines 2 <<<"👕 First_Color ($lightcolor) |👕 Second_Color ($darkcolor)")"
	empty_string_test
	case "$MENU" in
		*First_Color*) select_color1 ;;
		*Second_Color*) select_color2 ;;
	esac
}


# This part waits for instructions from the polybar module. When --show is supplied,
# it shows the selection menu. When --switch is supplied, it cycles through the varous
# configurations 
case "$1" in
	--show)
	python /home/ted/.config/polybar/scripts/carousel.py ;;
	*) echo "running" ;;
esac

