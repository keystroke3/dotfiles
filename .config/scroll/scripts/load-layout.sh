#!/bin/bash
#==
#   NOTE      - load-layout.sh
#   Author    - Aru
#
#   Created   - 2024.03.19
#   Github    - https://github.com/aruyu
#   Contact   - vine9151@gmail.com
#/



case "$1" in
  1 )
    echo "layout preset 1"

    swaymsg "exec firefox"
    sleep 1.2s

    swaymsg "layout tabbed"
    swaymsg "exec foot -e tty-clock -c -B"
    sleep 0.4s

    swaymsg "move down"
    sleep 0.2s

    swaymsg "splith"
    swaymsg "exec foot -e htop"
    sleep 0.4s

    swaymsg "resize shrink height 450px"
    swaymsg "exec foot"
    sleep 0.4s

    swaymsg "move right"
    sleep 0.2s

    swaymsg "splitv"
    swaymsg "exec foot"
    sleep 0.4s

    swaymsg "layout tabbed"
    swaymsg "focus up"
    swaymsg "move down"
    sleep 0.2s

    swaymsg "kill"
    swaymsg "resize grow width 575px"

    swaymsg "focus left"
    swaymsg "resize grow width 175px"

    #swaymsg "layout tabbed"
    #swaymsg "exec foot -e sudo iftop"
    ;;

  2 )
    echo "layout preset 2"

    swaymsg "exec firefox"
    sleep 1.2s

    swaymsg "layout tabbed"
    swaymsg "exec foot -e tty-clock -c -B"
    sleep 0.4s

    swaymsg "move down"
    sleep 0.2s

    swaymsg "splith"
    swaymsg "exec foot -e htop"
    sleep 0.4s

    swaymsg "resize shrink height 450px"
    swaymsg "exec foot"
    sleep 0.4s

    swaymsg "move right"
    sleep 0.2s

    swaymsg "splitv"
    swaymsg "exec foot"
    sleep 0.4s

    swaymsg "layout tabbed"
    swaymsg "focus up"
    swaymsg "move down"
    sleep 0.2s

    swaymsg "kill"
    swaymsg "resize grow width 325px"

    swaymsg "focus left"
    swaymsg "resize grow width 100px"
    ;;

  3 )
    echo "layout preset 3"

    swaymsg "exec firefox"
    sleep 1.2s

    swaymsg "layout tabbed"
    swaymsg "exec foot"
    sleep 0.4s

    swaymsg "move right"
    sleep 0.2s

    swaymsg "splitv"
    swaymsg "exec foot"
    sleep 0.4s

    swaymsg "layout tabbed"
    swaymsg "focus up"
    swaymsg "move down"
    sleep 0.2s

    swaymsg "kill"
    swaymsg "resize grow width 75px"
    ;;

  * )
    ;;
esac




#swaymsg "exec firefox"
#sleep 0.5s
#swaymsg "exec foot"
#
#blowser_id=$(echo ${swaymsg -t get_tree | jq '.. | objects | select(.app_id=="firefox") | .id'} | awk '{print $1}')
#term_id=$(echo ${swaymsg -t get_tree | jq '.. | objects | select(.app_id=="foot") | .id'} | awk '{print $1}')
#
#swaymsg "[con_id=$term_id] move right"
#swaymsg "[con_id=$term_id] resize set width 440px"
#
#swaymsg "[con_id=$blowser_id] move left"
#swaymsg "[con_id=$blowser_id] splitv"
#swaymsg "[con_id=$blowser_id] focus"
#swaymsg "exec foot -e tty-clock -c -B"
#sleep 0.5s
#clock_id=$(echo ${swaymsg -t get_tree | jq '.. | objects | select(.app_id=="foot") | .id'} | awk '{print $2}')
#
#swaymsg "[con_id=$clock_id] splith"
#swaymsg "exec foot -e sudo iftop"
#iftop_id=$(echo ${swaymsg -t get_tree | jq '.. | objects | select(.app_id=="foot") | .id'} | awk '{print $3}')
#
#swaymsg "[con_id=$iftop_id] resize set width 100px"
