#!/usr/bin/env sh 

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar kuz &

my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1-3')
if [[ $my_laptop_external_monitor = *connected* ]]; then
	polybar kuz-external &
fi
