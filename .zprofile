# If connected through SSH and tmux is installed
if [[ -n "$SSH_CLIENT" && -n "$(whence tmux)" ]]; then
    # try to attach to an existing tmux session, or create new
    [[ -z "$TMUX" ]] && (tmux attach || tmux new-session)
fi
