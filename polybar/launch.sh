#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/config.ini"

# Terminate already running bar instances
killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example --config=$DIR &
  done
else
  polybar --reload example &
fi
