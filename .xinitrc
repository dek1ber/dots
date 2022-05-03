#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

~/.scripts/multi

nitrogen --restore &
xsetroot -cursor_name left_ptr
picom -f &

emacs --daemon &

item=$(xinput | grep "Synaptics TouchPad" | sed 's/.*id=//' | cut -c 1-2)

xinput set-prop "$item" $(xinput list-props "$item" | grep -m 1 "Tapping Enabled" | sed 's/.*[(]//;s/[)].*//') 1
xinput set-prop "$item" $(xinput list-props "$item" | grep -m 1 "Natural Scrolling Enabled" | sed 's/.*[(]//;s/[)].*//') 1

dwmblocks &
exec dwm
