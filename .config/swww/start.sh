#!/bin/bash
swww-daemon --quiet &
sleep 0.5
WALLPAPER=$(find ~/Pictures/Wallpapers -type f | shuf -n1)
swww img "$WALLPAPER"


