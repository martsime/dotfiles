#!/usr/bin/env zsh

# Terminate already running bar instances
killall -q polybar

# Wait until processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch
polybar top &
polybar bottom &
