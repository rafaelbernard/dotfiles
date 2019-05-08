#!/usr/bin/env /bin/bash
set -x

echo "Installing dotfiles"

BACKDIR="$HOME/.dotfiles-backup"

#if [[ -f $BACKDIR ]]
mkdir $BACKDIR

# zsh
ZSH_FILE=$HOME/.zsh
if [ -e $ZSH_FILE ]; then
fi

#echo "tmux"

#if 

echo "tmux"

cd $HOME
ln -sf ~/.dotfiles/tmux.conf .tmux.conf
