#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

~/.config/bspwm/multi.sh

nitrogen --restore &
xsetroot -cursor_name left_ptr
xinput --set-prop 'SynPS/2 Synaptics TouchPad' 336 1
xinput --set-prop 'SynPS/2 Synaptics TouchPad' 344 1
picom -f &

dwmblocks &
exec dwm
