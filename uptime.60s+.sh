#!/bin/bash
# 2023-03-13
# Martynas J.
# https://github.com/f5AFfMhv
#
# Argos script for showing pc uptime.

UPTIME=$(uptime | awk '{print $3}' | sed 's/,//g')    # Uptime
echo "${UPTIME} | font=monospace dropdown=false iconName=document-open-recent"

if [ "$ARGOS_MENU_OPEN" == "true" ]; then
  # uptime info
  echo "---"
  UP_OUTPUT=$(uptime -p)
  echo "$UP_OUTPUT | font=monospace iconName=document-open-recent"
fi
