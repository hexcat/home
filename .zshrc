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

if [[ -n "$DISPLAY" ]]; then
    zsh_theme="/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme"
    if [[ -f "$zsh_theme" ]]; then
        source "$zsh_theme"
        # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
        [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    fi
    unset zsh_theme
fi

# Load common configuration
[[ -f "$HOME/.commonrc" ]] && . "$HOME/.commonrc"

# Run function at the end of interactive login
if [[ -o login ]]; then
    on_interactive_login
else
    return 0 # eat failed condition's return value
fi
