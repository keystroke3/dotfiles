#!/bin/bash
#==
#   NOTE      - full-screenshot.sh
#   Author    - Aru
#
#   Created   - 2023.05.17
#   Github    - https://github.com/aruyu
#   Contact   - vine9151@gmail.com
#/



function error_exit()
{
  notify-send --urgency critical "Scrot" "$1" --icon="accessories-screenshot"
  exit 1
}


TIME=`date +%b%d_%H%M%S`
SAVE_DIR=~/Pictures/

if [[ ! -d "${SAVE_DIR}" ]]; then
  mkdir ${SAVE_DIR}
fi

grim ${SAVE_DIR}${TIME}.png || error_exit "Canceled to capture Full ScreenShot."
wl-copy < ${SAVE_DIR}${TIME}.png || error_exit "Copying to clipboard failed."
notify-send --urgency low "Scrot" "Full ScreenShot successfully saved to\n${SAVE_DIR}${TIME}.png." --icon="accessories-screenshot"
