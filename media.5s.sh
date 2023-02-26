#!/bin/bash
# 2023-02-25
# Martynas J.
# https://github.com/f5AFfMhv
#
# Argos script for showing media that is currently playing.
# playerctl should be installed.

MEDIA=$(playerctl -a metadata | grep title | awk '{$1=$2=""; print $0}')
echo "$MEDIA | length=30"
# Menu for launching applications
echo ---
echo "Youtube | bash='/usr/lib64/firefox/firefox --class WebApp-youtube9835 --profile /home/mj/.local/share/ice/firefox/youtube9835 --no-remote https://youtube.com' terminal=false"
echo "Spotify | bash='flatpak run com.spotify.Client' terminal=false"
echo "Plex | bash='flatpak run tv.plex.PlexDesktop' terminal=false"
echo "VLC | bash='flatpak run org.videolan.VLC' terminal=false"