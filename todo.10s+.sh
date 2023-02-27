#!/bin/bash
# 2023-02-25
# Martynas J.
# https://github.com/f5AFfMhv
#
# Argos script for simple todo plugin. Plugin displays ~/Documents/todo file content.
ENTRY_COUNT=$(cat ~/Documents/todo | wc -l)
echo "($ENTRY_COUNT) | iconName=emblem-documents font=monospace"
echo "---"
cat ~/Documents/todo
echo "---"
echo "EDIT | bash='gnome-text-editor ~/Documents/todo' iconName=media-floppy terminal=false refresh=true"
echo "---"