#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias todo='nvim ~/k1berDOCS/resTasks.md'

alias cst='nvim ~/.config/st/config.h'
alias cdst='cd ~/.config/st'

alias cdwm='nvim ~/.config/dwm/config.h'
alias cddwm='cd ~/.config/dwm'

alias cblocks='nvim ~/.config/dwmblocks/blocks.h'
alias cdblocks='cd ~/.config/dwmblocks'

alias cls='cd ~/k1berDOCS/purdue/purdueClasses'
