#!/bin/bash
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
  PACKAGES_TO_INSTALL="\
    git \
    build-essential \
    speedtest-cli \
    source-highlight \
    zsh \
    cmake \
    vim-youcompleteme \
    python-dev \
    libboost-all-dev \
    tmux \
    curl \
    ruby-dev \
    net-tools \
    neofetch \
    xscreensaver \
    imagemagick \
    scrot \
    urlview
  "

  sudo apt-get update
  sudo apt-get -y dist-upgrade
  sudo apt-get install -y $PACKAGES_TO_INSTALL

elif [[ $platform == 'arch' ]]; then
  PACKAGES_TO_INSTALL="\
    git \
    rsync \
    man-pages \
    xscreensaver \
    tmux \
    neofetch \
    speedtest-cli \
    source-highlight \
    imagemagick \
    dolphin \
    chromium \
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
    "

  sudo pacman -Syy
  # uncomment this if keys are out of date - it is really slow
#  sudo pacman-key --refresh-keys
  gpg --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
  sudo pacman -S --noconfirm $PACKAGES_TO_INSTALL
  ln -sf /usr/bin/chromium /usr/local/bin/google-chrome
  if [[ ! -e ~/github/arch/yay ]]; then
    mkdir -p ~/github/arch
    cd ~/github/arch
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
  fi
  # install AUR packages
  yay -S --noconfirm unzip unrar hwinfo mhwd tree fontconfig-infinality checkupdates pacman-contrib thermald geekbench
  yay -S --noconfirm google-chrome slack-desktop htop glxinfo traceroute wavebox-bin rr-bin gometalinter python python2 python-pip

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
fi

#echo "tmux"

#if 

#echo "tmux"

#cd $HOME
#ln -sf ~/.dotfiles/tmux.conf .tmux.conf

# add kitty
# add ranger
