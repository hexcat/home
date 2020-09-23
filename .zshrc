# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
#
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' menu select

ZSH_THEME="/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme"
if [[ -n "$DISPLAY" && -f "$ZSH_THEME" ]]; then
    source "$ZSH_THEME"
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
fi

alias ls='ls --color=auto'
alias diff='diff --color=auto -u'
alias dig='dig +short'

if [[ -n "$(whence rbenv)" ]]; then
    eval "$(rbenv init -)"
fi
