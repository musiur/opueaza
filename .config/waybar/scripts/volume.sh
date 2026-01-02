#!/bin/bash

case "$1" in
    up)
        # Get current volume
        current=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')
        
        # Calculate new volume (max 100)
        new_volume=$((current + 5))
        if [ $new_volume -gt 100 ]; then
            new_volume=100
        fi
        
        # Set the new volume
        pactl set-sink-volume @DEFAULT_SINK@ ${new_volume}%
        ;;
    down)
        # Get current volume
        current=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')
        
        # Calculate new volume (min 0)
        new_volume=$((current - 5))
        if [ $new_volume -lt 0 ]; then
            new_volume=0
        fi
        
        # Set the new volume
        pactl set-sink-volume @DEFAULT_SINK@ ${new_volume}%
        ;;
    toggle)
        # Toggle mute
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
esac