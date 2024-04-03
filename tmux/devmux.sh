#!/usr/bin/env bash

SESSION_NAME="$(pwd | awk -F'/' '{print $NF}' |sed 's/\./_/g' )_$$"

# Create tmux session in the background
tmux new -s "$SESSION_NAME" -d

# Create tmux windows
tmux rename-window -t "${SESSION_NAME}":0 "terminal" 
if [ -e "flake.nix" ] && grep devShell flake.nix >/dev/null
then
	tmux send-keys -t "${SESSION_NAME}:terminal" "nix develop" C-m
elif [ -e "shell.nix" ]
then
	tmux send-keys -t "${SESSION_NAME}:terminal" "nix-shell" C-m
fi
tmux send-keys -t "${SESSION_NAME}:terminal" "clear" C-m

tmux new-window -n "editor" -t "$SESSION_NAME"
if [ -e "flake.nix" ] && grep devShell flake.nix >/dev/null
then
	tmux send-keys -t "${SESSION_NAME}:editor" "nix develop --command nvim" C-m
elif [ -e "shell.nix" ]
then
	tmux send-keys -t "${SESSION_NAME}:editor" "nix-shell --command nvim" C-m
else
	tmux send-keys -t "${SESSION_NAME}:editor" "nvim" C-m
fi

tmux new-window -n "test" -t "$SESSION_NAME"

tmux new-window -n "git" -t "$SESSION_NAME"
tmux send-keys -t "$SESSION_NAME:git" "git status" C-m

# Attach to the tmux session
tmux attach -t "$SESSION_NAME:editor"
