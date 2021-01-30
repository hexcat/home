# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install

zstyle :compinstall filename '~/.zshrc'

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix

# load completion system
autoload -Uz compinit && compinit

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
