#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.01; done

# Set proper MONITOR variable
MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g') polybar main &
# Launch Polybar, using default config location ~/.config/polybar/config
polybar secondary &

echo "Polybar launched..."
