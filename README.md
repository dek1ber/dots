ARCH LINUX
==========
These dot files are intended for use on any linux distro, but all the dependencies are ARCH LINUX specific

> git clone https://github.com/KevinKusiak/dots.git

# Dependencies
	sudo pacman -Syy xorg-server xorg-xinit xorg-xsetroot xorg-xrandr firefox nitrogen picom git go bspwm neovim sxhkd terminator zsh  gcc make dmenu base-devel

## AUR Dependencies
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	yay -Syy ttf-joypixels ttf-jetbrains-mono nerd-fonts-hack noto-color-emoji-fontconfig gimp thunderbird sublime-text-3 libxft-bgra

## Cleaning Up
	cd 
	mkdir .config
	mv dots/bspwm/ .config/
	mv dots/dwm/ .config/
	mv dots/dwmblocks/ .config/
	mv dots/nvim/ .config/
	mv dots/polybar ./config
	mv dots/st/ ./config
	mv dots/sxhkd/ .config/
	mv dots./terminator/ ./config
	rm .bashrc
	mv dots/.bashrc .
	mv dots/.tmux.conf .
	mv dots/.xinitrc .
	mv dots/.zshrc .

## Setting up ZSH
	chsh -s $(which zsh)
From this point either reboot your computer (if you are in the tty), or reboot your terminal (if you are in the window manager)

## Installing Suckless Tools
	cd .config/dwm/
	sudo make clean install 
	cd ../dwmblocks/
	sudo make clean install 
	cd ../st/
	sudo make clean install 

# Usage
Once everything is setup, all that is needed to start the xorg window manager session is 
> startx

# DWM keybinds
	Super + Shift + Return	st(terminal)
	Super + p 				dmenu
	Super + b 				firefox
	Super + s 				sublime-text
	Super + Alt + q 		quit DWM and exit to the tty
	Super + [0-9]			change to workspace [0-9]
	Super + Return 			bring the current window to the front of the stack
	Super + j 				focus one window down
	Super + k 				focus one window up
	Super + h 				resize the current window leftwards
	Super + l 				resize the current window rightwards
	Super + t 				toggle to tiled mode
	Super + f 				toggle to floating mode
	Super + m 				toggle to monocle mode
	Super + w 				kill a window

# st keybinds
	Alt + Ctrl + k 			zoom in
	Alt + Ctrl + j 			zoom out
	Alt + Ctrl + c 			copy
	Alt + Ctrl + v 			paste

# BSPWM keybinds
	Super + Return 			st(terminal)
	Super + p 				dmenu
	Super + b 				firefox
	Super + Alt + q 		quit BSPWM and exit to the tty
	Super + Alt + r 		restart BSPWM
	Super + m 				toggle between tiled and monocole mode

# Troubleshooting
Sometimes all that is required is a reboot!
