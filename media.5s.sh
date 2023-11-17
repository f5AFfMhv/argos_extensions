#!/bin/bash
# 2023-02-25
# Martynas J.
# https://github.com/f5AFfMhv
#
# Argos script for showing media that is currently playing.
# Requirements:
# - playerctl

# Show title of current media that is playing
MEDIA=$(playerctl metadata --format '{{title}}')
echo "$MEDIA | length=30 font=monospace dropdown=false"

# Show all media sources
echo ---
MEDIA_OUTPUT=$(playerctl -a metadata --format '{{lc(status)}}: {{artist}} - {{title}}' | awk 1 ORS="\\\\n")
echo "$MEDIA_OUTPUT | font=monospace bash='flatpak run com.spotify.Client' terminal=false"