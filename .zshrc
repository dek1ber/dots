PS1='%B%F{red}[%f%F{green}%n%f%F{blue}@%f%F{yellow}%M%f %F{magenta}%~%f%F{red}]%f%b$ '

setopt autocd
setopt nonomatch

# Keybinds ONLY for emacs
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


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

# Aliases
alias /="cd /"
alias rd="rmdir"
alias md="mkdir -p"
alias ls="ls --color"
alias la="ls -al"
alias ll="ls -l"
alias msi="sudo make clean install"
alias n="nvim"
alias i="nvim ~/.config/nvim/init.lua"
alias k="cd /home/k1ber/k1berDOCS/"
alias vol="pactl get-sink-volume @DEFAULT_SINK@"

# Editor Aliases
alias -s md=nvim
alias -s py=nvim
alias -s c=nvim
alias -s cpp=nvim
alias -s h=nvim
alias -s rs=nvim
alias -s go=nvim
alias -s lua=nvim

# Fun
export AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36"
alias curl="curl -A '$AGENT'"
alias wget="wget -U '$AGENT'"
alias nmap="nmap --script-args=\"http.useragent='$AGENT'\""

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
