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
UPTIME=$(uptime | awk '{print $3}')                   # Uptime

# Disk usage by partition
PARTITION_ROOT=$(df / --output=pcent,target | sed -n 2p | awk '{print $1, " - ", $2}')
PARTITION_HOME=$(df /home --output=pcent,target | sed -n 2p | awk '{print $1, " - ", $2}')
PARTITION_ARCHIVE=$(df /mnt/archive --output=pcent,target | sed -n 2p | awk '{print $1, " - ", $2}')

# Rotate short resource info
echo "$CPU | iconName=system-run dropdown=false"
echo "$MEM | iconName=media-flash dropdown=false"
echo "$DISK | iconName=drive-harddisk dropdown=false"
echo "${UPTIME%?} | iconName=document-open-recent dropdown=false"

# Menu with partition info
echo ---
echo "Partition usage:"
echo "$PARTITION_ROOT | iconName=drive-harddisk"
echo "$PARTITION_HOME | iconName=drive-harddisk"
echo "$PARTITION_ARCHIVE | iconName=drive-harddisk"

# Menu for launching applications
echo ---
echo "htop | bash=/usr/bin/htop terminal=true"
echo "system monitor | bash=gnome-system-monitor terminal=false"
echo "gnome disks | bash=gnome-disks terminal=false"
echo "disk usage analyzer | bash=baobab terminal=false"
echo "gparted | bash=gparted terminal=false"