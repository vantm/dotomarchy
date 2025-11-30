#!/bin/bash
d=$1

if [ "$(hyprctl activewindow -j | jq -r '.floating')" = "false" ]; then
  hyprctl dispatch -q swapwindow "$d"
else
  w="0"
  h="0"
  case $d in
    l) w="-10%" ;;
    r) w="10%" ;;
    u) h="-8%" ;;
    d) h="8%" ;;
  esac
  hyprctl dispatch -q moveactive "$w" "$h"
fi
