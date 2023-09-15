#!/bin/bash
. platform.sh

set -x

echo "Installing dotfiles"

# =========================
# PLATFORM
# =========================

# {{{

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

# }}}



backup_do ">>> INSTALLING PREREQUISITES FOR $platform"
if [[ $platform == 'linux' ]]; then

    # TODO: check if file exists

    #if [[ (find /etc/apt/sources.listd./kgilmer* -type f) != "" ]] ; then
    #        echo "exists";
    #fi

    sudo add-apt-repository -y ppa:kgilmer/speed-ricer

  	PACKAGES_TO_INSTALL="\
    	brightnessctl \
                compton \
    		suckless-tools \
                i3-gaps \
                i3-gaps-wm \
    		i3blocks \
                i3lock \
    		feh \
                python-tzlocal \
                mupdf \
    		scrot \
                xautolock \
    		zsh
  "

  sudo apt-get update
  sudo apt-get -y dist-upgrade
  sudo apt-get install -y $PACKAGES_TO_INSTALL

elif [[ $platform == 'arch' ]]; then
    PACKAGES_TO_INSTALL="\
        alacritty \
        brightnessctl \
        git \
        i3-gaps \
        i3blocks \
        i3lock \
        kitty \
        picom \
    feh \
    python-tzlocal \
    mupdf \
    scrot \
    xautolock \
    zsh
    rsync \
    man-pages \
    xscreensaver \
    tmux \
    neofetch \
    speedtest-cli \
    source-highlight \
    imagemagick \
    dolphin \
    firefox \
    ranger \
    scrot \
    ntp \
    tlp \
    wget \
    pass \
    gnupg \
    w3m \
    notmuch \
    abook \
    cronie \
    cmake \
    clang \
    rust \
    hub \
    fakeroot \
    make \
    go \
    "

    # Install minimum to compile what we need
    sudo pacman -Syy --noconfirm \
        automake \
        make

  #sudo pacman -Syy $PACKAGES_TO_INSTALL

  # YAY
  if [[ ! -e ~/github/arch/yay ]]; then
    mkdir -p ~/github/arch
    cd ~/github/arch
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
  fi
  # install AUR packages
  yay -S --noconfirm --cleanafter $PACKAGES_TO_INSTALL
  yay -S --noconfirm unzip unrar hwinfo mhwd tree fontconfig-infinality checkupdates pacman-contrib thermald geekbench
  yay -S --noconfirm slack-desktop htop glxinfo traceroute wavebox-bin rr-bin gometalinter python python2 python-pip
  yay -S --noconfirm bumblebee-status-git 

  # enable services
  sudo systemctl enable thermald.service
  sudo systemctl enable tlp.service

fi

git config --global user.email	"rafael.araujo@initd.info"
git config --global user.name 	"Rafael Bernard Araújo"

back_dir="$HOME/.dotfiles-backup"

if [[ -f $backup_dir ]]; then
    echo "{$backup_dir} exists";
    ls $backup_dir
fi

mkdir $backup_dir

# zsh
ZSH_FILE=$HOME/.zsh
if [ -e $ZSH_FILE ]; then
    # do nothing
    echo "exists"
fi

#echo "tmux"

#if 

#echo "tmux"

#cd $HOME
#ln -sf ~/.dotfiles/tmux.conf .tmux.conf

# add kitty
# add ranger
	
# vi:set tabspaces=8
