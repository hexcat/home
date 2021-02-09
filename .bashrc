# Load common configuration
[[ -f "$HOME/.commonenv" ]] && . "$HOME/.commonenv"

# If not running interactively, don't do anything else
# https://unix.stackexchange.com/questions/257571
[[ $- != *i* ]] && return

# Load common configuration
[[ -f "$HOME/.commonrc" ]] && . "$HOME/.commonrc"

# Update window size when in GUI terminal
[[ -n "$DISPLAY" ]] && shopt -s checkwinsize

# History options
HISTCONTROL=ignoreboth # ignore duplicate lines or ones starting with space
HISTSIZE=1000          # size of the in-memory history
HISTFILESIZE=1000      # size of the history file
shopt -s histappend    # append to the history file instead of overwriting it

PS1='[\u@\h \W]\$ '
if [[ -n "$SSH_CONNECTION" ]]; then
    PROMPT_COMMAND='echo -en "\033]0;$(hostname)\a"'
fi

completion_file="/usr/share/bash-completion/bash_completion"
[[ -r "$completion_file" ]] && . "$completion_file"
unset completion_file

# Run function at the end of interactive login
shopt -q login_shell && on_interactive_login
