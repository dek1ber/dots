# Prompt setup
PS1="%B%F{red}[%f%F{green}%n%f%F{blue}@%f%F{yellow}%M%f %F{magenta}%~%f%F{red}]%f%b$ "

# Auto complete
autoload -Uz compinit; compinit; _comp_options+=(globdots);

# Hist
HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
zstyle ':vcs_info:git:*' formats '%b'

# Aliases
alias /="cd /"
alias m="cd /home/k1ber/mechaDOCS"
alias rd="rmdir"
alias md="mkdir -p"
alias la="ls -al"

alias -s txt=nvim
alias -s py=nvim
alias -s c=subl
alias -s h=subl

# Keybinds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Randos
setopt autocd
stty stop undef

source /usr/share/zsh/plugins/sublime/sublime.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/safe-paste/safe-paste.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/git/git.plugin.zsh 2>/dev/null
