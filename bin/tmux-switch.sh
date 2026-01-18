#!/usr/bin/env bash
SESSION=$(tmux list-sessions -F '#{session_name}' 2>/dev/null | fzf)

[ -z "$SESSION" ] && exit 0

if [ -n "$TMUX" ]; then
	tmux switch-client -t "$SESSION"
else
	tmux attach -t "$SESSION"
fi
