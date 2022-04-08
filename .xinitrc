#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

~/.config/bspwm/multi.sh

nitrogen --restore &
xsetroot -cursor_name left_ptr
picom -f &

emacs --daemon &

dwmblocks &
exec dwm
