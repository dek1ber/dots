PS1='%B%F{red}[%f%F{green}%n%f%F{green}@%f%F{green}%M%f %F{green}%~%f%F{red}]%f%b$ '

setopt autocd
setopt nonomatch

# Keybinds ONLY for emacs
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

set -o vi

# Hist
HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_expire_dups_first

# Completion 
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle  ':completion:*' rehash true
compinit
_comp_options+=(globdots)

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
zstyle ':vcs_info:git:*' formats '%b'

# Navigation aliases
alias rd="rmdir"
alias md="mkdir -p"
alias ls="ls --color"
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"
alias lr="ls -alr"

# Docker Aliases
alias docke="docker exec -it"
alias dockps="docker ps -a"
alias dockls="docker image ls"

# Useful Aliases
alias cht="curl cheat.sh/$"
alias msi="sudo make clean install"
alias vol="pactl get-sink-volume @DEFAULT_SINK@"
alias sdu="sudo dnf update -y"
alias n="nvim"

# Editor Aliases
alias -s py=python3

# Fun
export AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36"
alias curl="curl -A '$AGENT'"
alias wget="wget -U '$AGENT'"
alias nmap="nmap --script-args=\"http.useragent='$AGENT'\""

# Exports
export EDITOR=vim

. "$HOME/.cargo/env" 
