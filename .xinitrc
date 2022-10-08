#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
#-------
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
#-------
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
#-------
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
#-------
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

~/.scripts/multi

nitrogen --restore &
xsetroot -cursor_name left_ptr
picom -f &
nm-applet & 
flameshot &



item=$(xinput | grep "Synaptics TouchPad" | sed 's/.*id=//' | cut -c 1-2)

xinput set-prop "$item" $(xinput list-props "$item" | grep -m 1 "Tapping Enabled" | sed 's/.*[(]//;s/[)].*//') 1
xinput set-prop "$item" $(xinput list-props "$item" | grep -m 1 "Natural Scrolling Enabled" | sed 's/.*[(]//;s/[)].*//') 1

exec awesome
