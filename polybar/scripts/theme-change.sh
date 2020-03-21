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

PDIR="$HOME/.config/polybar/"
color1='${colors.xcolor15}'
color2='${colors.xcolor15}'
lightcolor=xcolor15
darkcolor=xcolor15

white1() {
    sed -i -e "0,/^shade1/ s/shade1.*/shade1 = $color1/" "$PDIR/config.ini"
    sed -i -e "0,/^shade2/ s/shade2.*/shade2 = $color2/" "$PDIR/config.ini"
    sed -i -e "0,/^background/ s/background.*/background = $\{colors.white\}/" "$PDIR/config.ini"
    sed -i -e "0,/^current/ s/current.*/current=white1/"  "$PDIR/scripts/theme-change-prompt.sh"
    sed -i -e "0,/^lightcolor/ s/lightcolor.*/lightcolor=$lightcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
	sed -i -e "0,/^darkcolor/ s/darkcolor.*/darkcolor=$darkcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
}

white2() {
    sed -i -e "0,/^shade1/ s/shade1.*/shade1 = $color2/" "$PDIR/config.ini"
    sed -i -e "0,/^shade2/ s/shade2.*/shade2 = $color1/" "$PDIR/config.ini"
    sed -i -e "0,/^background/ s/background.*/background = $\{colors.white\}/" "$PDIR/config.ini"
    sed -i -e "0,/^current/ s/current.*/current=white2/"  "$PDIR/scripts/theme-change-prompt.sh"
    sed -i -e "0,/^lightcolor/ s/lightcolor.*/lightcolor=$lightcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
	sed -i -e "0,/^darkcolor/ s/darkcolor.*/darkcolor=$darkcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
}

clear1() {
    sed -i -e "0,/^shade1/ s/shade1.*/shade1 = $color1/" "$PDIR/config.ini"
    sed -i -e "0,/^shade2/ s/shade2.*/shade2 = $color2/" "$PDIR/config.ini"
    sed -i -e "0,/^background/ s/background.*/background = $\{colors.transparent\}/" "$PDIR/config.ini"
    sed -i -e "0,/^current/ s/current.*/current=clear1/"  "$PDIR/scripts/theme-change-prompt.sh"
    sed -i -e "0,/^lightcolor/ s/lightcolor.*/lightcolor=$lightcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
	sed -i -e "0,/^darkcolor/ s/darkcolor.*/darkcolor=$darkcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
}

clear2() {
    sed -i -e "0,/^shade1/ s/shade1.*/shade1 = $color2/" "$PDIR/config.ini"
    sed -i -e "0,/^shade2/ s/shade2.*/shade2 = $color1/" "$PDIR/config.ini"
    sed -i -e "0,/^background/ s/background.*/background = $\{colors.transparent\}/" "$PDIR/config.ini"
    sed -i -e "0,/^current/ s/current.*/current=clear2/"  "$PDIR/scripts/theme-change-prompt.sh"
    sed -i -e "0,/^lightcolor/ s/lightcolor.*/lightcolor=$lightcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
	sed -i -e "0,/^darkcolor/ s/darkcolor.*/darkcolor=$darkcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
}

black1() {
    sed -i -e "0,/^shade1/ s/shade1.*/shade1 = $color1/" "$PDIR/config.ini"
    sed -i -e "0,/^shade2/ s/shade2.*/shade2 = $color2/" "$PDIR/config.ini"
    sed -i -e "0,/^background/ s/background.*/background = $\{colors.black\}/" "$PDIR/config.ini"
    sed -i -e "0,/^current/ s/current.*/current=black1/"  "$PDIR/scripts/theme-change-prompt.sh"
    sed -i -e "0,/^lightcolor/ s/lightcolor.*/lightcolor=$lightcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
	sed -i -e "0,/^darkcolor/ s/darkcolor.*/darkcolor=$darkcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
}

black2() {
    sed -i -e "0,/^shade1/ s/shade1.*/shade1 = $color2/" "$PDIR/config.ini"
    sed -i -e "0,/^shade2/ s/shade2.*/shade2 = $color1/" "$PDIR/config.ini"
    sed -i -e "0,/^background/ s/background.*/background = $\{colors.black\}/" "$PDIR/config.ini"
    sed -i -e "0,/^current/ s/current.*/current=black2/"  "$PDIR/scripts/theme-change-prompt.sh"
    sed -i -e "0,/^lightcolor/ s/lightcolor.*/lightcolor=$lightcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
	sed -i -e "0,/^darkcolor/ s/darkcolor.*/darkcolor=$darkcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
}

gray1() {
    sed -i -e "0,/^shade1/ s/shade1.*/shade1 = $color1/" "$PDIR/config.ini"
    sed -i -e "0,/^shade2/ s/shade2.*/shade2 = $color2/" "$PDIR/config.ini"
    sed -i -e "0,/^background/ s/background.*/background = $\{colors.gray\}/" "$PDIR/config.ini"
    sed -i -e "0,/^current/ s/current.*/current=gray1/"  "$PDIR/scripts/theme-change-prompt.sh"
    sed -i -e "0,/^lightcolor/ s/lightcolor.*/lightcolor=$lightcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
	sed -i -e "0,/^darkcolor/ s/darkcolor.*/darkcolor=$darkcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
}

gray2() {
    sed -i -e "0,/^shade1/ s/shade1.*/shade1 = $color2/" "$PDIR/config.ini"
    sed -i -e "0,/^shade2/ s/shade2.*/shade2 = $color1/" "$PDIR/config.ini"
    sed -i -e "0,/^background/ s/background.*/background = $\{colors.gray\}/" "$PDIR/config.ini"
    sed -i -e "0,/^current/ s/current.*/current=gray2/"  "$PDIR/scripts/theme-change-prompt.sh"
    sed -i -e "0,/^lightcolor/ s/lightcolor.*/lightcolor=$lightcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
	sed -i -e "0,/^darkcolor/ s/darkcolor.*/darkcolor=$darkcolor/"  "$PDIR/scripts/theme-change-prompt.sh"
}


case $1 in
white1) white1 ;;
white2) clear2 ;;
clear1) clear1 ;;
clear2) black2 ;;
black1) black1 ;;
black2) white2 ;;
gray1) gray1 ;;
gray2) gray2 ;;
"") echo "No options provided. Exiting ..."; exit ;;
*) echo "Available optins are:
        -black1         -black2
        -white1         -white2
        -clear1         -clear2
        
        You entered $1" ;;
esac
