#!/bin/bash
# 2023-02-25
# Martynas J.
# https://github.com/f5AFfMhv
#
# Argos script for showing memory, cpu, disk information.
# mpstat should be installed.

# Short resource info to be rotated on main screen
CPU=$(mpstat | tail -1 | awk '{print 100-$13"%"}')    # Used cpu in percents
MEM=$(free -h --si | sed -n 2p | awk '{print $3}')    # Used memory in gigabytes
DISK=$(df /home --output=pcent | sed -n 2p)           # Home partition usage in percents
UPTIME=$(uptime | awk '{print $3}' | sed 's/,//g')    # Uptime

# Rotate short resource info. Use monospace font and always use consistent line width of 6 char.
for item in $CPU $MEM $DISK $UPTIME; do
  if [ ${#item} -lt 6 ]; then
      result="${item}˙˙˙˙˙˙"
  fi
  echo "${result:0:6} | font=monospace dropdown=false"
done

if [ "$ARGOS_MENU_OPEN" == "true" ]; then
  # uptime info
  UP_OUTPUT=$(uptime -p)
  echo "$UP_OUTPUT | font=monospace iconName=document-open-recent"

  # iostat info
  echo "---"
  #echo "CPU and I/O: | iconName=system-run"
  IO_OUTPUT=$(iostat --human | awk 1 ORS="\\\\n")
  echo "$IO_OUTPUT | font=monospace bash=/usr/bin/htop terminal=true"

  # mem info
  echo "---"
  #echo "Memory usage: | iconName=media-flash"
  MEM_OUTPUT=$(free -h --si | sed '1 s/./#&/' | awk 1 ORS="\\\\n")
  echo "$MEM_OUTPUT | font=monospace bash=gnome-system-monitor terminal=false"

  # Disk info
  echo "---"
  #echo "Disk usage: | iconName=drive-harddisk"
  DF_OUTPUT=$(df -h -T -x devtmpfs -x tmpfs -x squashfs -x overlay -x fuse.revokefs-fuse | awk 1 ORS="\\\\n")
  echo "$DF_OUTPUT | font=monospace bash=baobab terminal=false"

  # CPU temperature
  echo "---"
  #echo "CPU temperature: | iconName=emblem-important"
  T_OUTPUT=$(sensors k10temp-pci-00c3 | tail -n +2 | awk 1 ORS="\\\\n")
  echo "$T_OUTPUT | font=monospace"

else
  echo "Loading..."
fi
