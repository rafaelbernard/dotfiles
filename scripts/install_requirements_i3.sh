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

        #PACKAGES_TO_UNINSTALL="\
        #        i3 i3-wm
        #"

        #sudo apt-get remove -y $PACKAGES_TO_UNINSTALL

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
    echo "exists"
fi

#echo "tmux"

#if 

#echo "tmux"

#cd $HOME
#ln -sf ~/.dotfiles/tmux.conf .tmux.conf

# add kitty
# add ranger
