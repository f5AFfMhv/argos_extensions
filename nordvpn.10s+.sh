#!/bin/bash
# 2023-11-17
# Martynas J.
# https://github.com/f5AFfMhv
#
# Argos script for nordvpn status
# Requirements:
# -nordvpn

MY_COUNTRY="LT"

# Alternatively country can be found from one of public IP info providers.
# ipinfo.io has request limits.
#COUNTRY=$(curl -s ipinfo.io | jq -r .country)

# Show public IP location
COUNTRY=$(nordvpn status | grep Country | awk '{print $2}')
if [ -z "$COUNTRY" ]; then
	echo "$MY_COUNTRY | iconName=flag font=monospace"
else
	echo "$COUNTRY | iconName=flag font=monospace"
fi

# Display nordvpn connection status when menu is open
if [ "$ARGOS_MENU_OPEN" == "true" ]; then
	nordvpn status
fi
