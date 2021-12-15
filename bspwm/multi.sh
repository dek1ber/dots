#!/bin/bash

my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1-3')
if [[ $my_laptop_external_monitor = *connected* ]]; then
	xrandr --output HDMI-1-3 --primary --mode 1920x1080 --rotate normal --output eDP-1 --mode 1920x1080 --rotate normal --right-of HDMI-1-3
fi
