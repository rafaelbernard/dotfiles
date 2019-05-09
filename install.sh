#!/usr/bin/env /bin/bash
set -x

echo "Installing dotfiles"

# =========================
# PLATFORM
# =========================

#!/bin/bash

platform_type=`uname -m`
unamestr=`uname`
platform='unknown'
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
    if [[ -e "/etc/arch-release" ]]; then
	platform='arch'
    fi
elif [[ "$unamestr" == 'armv7' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='macos'
    install() {
      if [[ -e "/usr/local/bin/$1" ]]; then
        brew upgrade $1
      else
        brew install $1
      fi
    }
fi
export platform_type
export platform
export hostname=`hostname -s`

backup_dir="$HOME/.dotfiles-backup"

#if [[ -f $backup_dir ]]
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
