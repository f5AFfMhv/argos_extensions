#!/bin/bash
# 2023-03-13
# Martynas J.
# https://github.com/f5AFfMhv
#
# Argos script for showing cpu usage.
# Requirements:
# -mpstat

CPU=$(mpstat | tail -1 | awk '{print 100-$13"%"}')    # Used cpu in percents
echo "${CPU} | font=monospace dropdown=false iconName=system-run"

if [ "$ARGOS_MENU_OPEN" == "true" ]; then
  # iostat info
  echo "---"
  IO_OUTPUT=$(iostat --human | awk 1 ORS="\\\\n")
  echo "$IO_OUTPUT | font=monospace bash=/usr/bin/htop terminal=true"
fi
