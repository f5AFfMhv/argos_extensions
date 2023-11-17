#!/bin/bash
# 2023-03-13
# Martynas J.
# https://github.com/f5AFfMhv
#
# Argos script for showing memory usage.

MEM=$(free -h --si | sed -n 2p | awk '{print $3}')    # Used memory in gigabytes
echo "${MEM} | font=monospace dropdown=false iconName=media-flash"

if [ "$ARGOS_MENU_OPEN" == "true" ]; then
  # mem info
  echo "---"
  MEM_OUTPUT=$(free -h --si | sed '1 s/./#&/' | awk 1 ORS="\\\\n")
  echo "$MEM_OUTPUT | font=monospace bash=gnome-system-monitor terminal=false"
fi