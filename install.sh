#!/usr/bin/env /bin/bash

echo "Installing dotfiles"

#BACKDIR="$HOME/.dotfiles-backup"

#if [[ -f $BACKDIR ]]

#echo "tmux"

#if 

echo "tmux"

cd $HOME
ln -sf ~/.dotfiles/tmux.conf .tmux.conf
