#!/bin/bash
#==
#   NOTE      - screen-lock.sh
#   Author    - Aru
#
#   Created   - 2024.03.29
#   Github    - https://github.com/aruyu
#   Contact   - vine9151@gmail.com
#/



# lock the current screen session
#loginctl lock-session

# do sync
sync ; sync ; sync ; sync ;

# tell gdm to switch session
gdbus call \
  --system \
  --object-path /org/gnome/DisplayManager/LocalDisplayFactory \
  --dest org.gnome.DisplayManager \
  --method org.gnome.DisplayManager.LocalDisplayFactory.CreateTransientDisplay \
  > /dev/null

# suspend option
if [[ "$1" == 'suspend' ]]; then
  systemctl suspend
fi
