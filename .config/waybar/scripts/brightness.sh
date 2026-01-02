#!/usr/bin/env bash
DEVICE=$(brightnessctl -m | cut -d',' -f1)
CUR=$(brightnessctl -m | cut -d',' -f4 | tr -d '%')
case "$1" in
  up) brightnessctl set +5% ;;
  down) brightnessctl set 5%- ;;
esac
ICON="󰃠"
echo "$ICON $CUR%"

