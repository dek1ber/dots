PS1='%B%F{white}${vim_mode}%f%F{red}[%f%F{green}%n%f%F{blue}@%f%F{yellow}%M%f %F{magenta}%~%f%F{red}]%f%b$ '

#####
vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
# Thanks Ron! (see comments)
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
} 
#####

setopt autocd
setopt nonomatch

bindkey -v

# Keybinds ONLY for emacs
#bindkey "^[[1;5C" forward-word
#bindkey "^[[1;5D" backward-word


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
