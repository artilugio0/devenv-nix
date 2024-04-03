#!/usr/bin/env bash

SESSION_NAME="$(pwd | awk -F'/' '{print $NF}').$$"

zellij --layout devmux --session "$SESSION_NAME"

if zellij ls |grep "$SESSION_NAME" |grep EXITED >/dev/null
then
	zellij delete-session "$SESSION_NAME"
fi
