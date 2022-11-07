Arch LINUX
==========
I'm rocking an Arch Linux setup on both my stationary production machine, and my laptop. 

I've been a longtime DWM (https://dwm.suckless.org/) user but I recently switched to Awesome cause the DWM extensibility reached a peak for me and I wanted to try something else out. The scripts in the .scripts dir are mostly for my dwmblocks (https://github.com/torrinfail/dwmblocks) setup rip. I still use and LOVE the st by suckless.

The .config/nvim files are ALWAYS a work in progress but I've finally added some lsp stuff (and of course telescope) as well as turning my config files to lua (might add an init.vim file in there soon though). I'll start working on a neovim plugin soon so expect to see that in here soon as well.

> git clone https://github.com/dek1ber/dots.git

# Dependencies + Some Apps I Need and Like (BIG wip)
	sudo pacman -S nitrogen awesome alacritty firefox \
	neovim xorg-xrandr xorg-xsetroot xorg-server xorg-xinit \ 
	
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
From this point logout 

## Installing Suckless Tools
	cd ../st/
	sudo make clean install 
	cd ../slock/
	sudo make clean install

# Usage
Once everything is setup, all that is needed to start the xorg window manager session is 
> startx

# DWM keybinds
	Super + Shift + Return	st(terminal)
	Super + p 			dmenu
	Super + b 			brave
	Super + s 			sublime-text
	Super + Alt + q 		quit DWM and exit to the tty
	Super + [0-9]			change to workspace [0-9]
	Super + Return 			bring the current window to the front of the stack
	Super + j 			focus one window down
	Super + k 			focus one window up
	Super + h 			resize the current window leftwards
	Super + l			resize the current window rightwards
	Super + t 			toggle to tiled mode
	Super + f 			toggle to floating mode
	Super + m 			toggle to monocle mode
	Super + w 			kill a window

# st keybinds
	Alt + Ctrl + k 			zoom in
	Alt + Ctrl + j 			zoom out
	Alt + Ctrl + c 			copy
	Alt + Ctrl + v 			paste

# BSPWM keybinds
	Super + Return 			st(terminal)
	Super + p 			dmenu
	Super + b 			brave
	Super + Alt + q 		quit BSPWM and exit to the tty
	Super + Alt + r 		restart BSPWM
	Super + m 			toggle between tiled and monocole mode

# Troubleshooting
Sometimes all that is required is a reboot!
