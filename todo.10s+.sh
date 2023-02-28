#!/bin/bash
# 2023-02-25
# Martynas J.
# https://github.com/f5AFfMhv
#
# Argos script for simple todo plugin. Plugin displays ~/Documents/todo file content.
ENTRY_COUNT=$(cat ~/Documents/todo | wc -l)
echo "($ENTRY_COUNT) | iconName=x-office-document font=monospace"

# Print each line from file individually. Clicking record will remove it from file 
echo "---"
if [ "$ARGOS_MENU_OPEN" == "true" ]; then
  index=1
  while read item; do
    echo "$item | iconName=list-remove font=monospace terminal=false bash='sed -i -e ${index}d ~/Documents/todo'"
    index=$((index+1))
  done < ~/Documents/todo

  echo "---"
  echo "Add record | bash='gnome-text-editor ~/Documents/todo' iconName=list-add terminal=false refresh=true"
else
  echo "Loading..."
fi
