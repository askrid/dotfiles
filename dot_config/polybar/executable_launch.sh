#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar workspace 2>&1 | tee -a /tmp/polybar.log & disown
polybar date 2>&1 | tee -a /tmp/polybar.log & disown
polybar monitor 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."

