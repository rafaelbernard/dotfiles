# vi=zsh
# rafael bernard rodrigues araujo - zsh config file

# enable for zsh profiling
#zmodload zsh/zprof

# keyboard
# map caps to control
setxkbmap -option caps:ctrl_modifier

# Path to your oh-my-zsh installation.
export ZSH=/home/rafael/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="jispwoso"

# History and cache
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/history

# Plugins
plugins=(
        git aws ubuntu 
)

# Load zsh
source $ZSH/oh-my-zsh.sh

# Enable auto/tab completions
autoload -Uz compinit
compinit
_comp_options+=(globdots)       # Enable autocompleting hidden files

# Enable vi mode
#bindkey -v
#export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
# Credits for Luke Smith: https://gist.githubusercontent.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52/raw/2a93cca1ea82cecfc2bd6dcd2eff700a95c7581e/zshrc
: <<CMM
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
CMM
#zle -N zle-keymap-select
#zle-line-init() {
#    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#    echo -ne "\e[5 q"
#}
#zle -N zle-line-init
#echo -ne '\e[5 q' # Use beam shape cursor on startup.
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
#CMM

# Edit line in vim (ctrl+e)
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# fzf - https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh 
export FZF_DEFAULT_OPTS='--preview "(coderay {} || cat {}) 2> /dev/null | head -40"'

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# Local scripts and binaries
if [ -d "$HOME/.local/bin" ] ; then
        PATH="$HOME/.local/bin:$PATH"
fi

# my scripts to PATH
[ -d "$HOME/.dotfiles/scripts" ]
PATH="$PATH:$HOME/.dotfiles/scripts"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
        export EDITOR='vim'
else
        export EDITOR='nvim'
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -----------
# aliases
# -----------
alias apt-upgrade='sudo apt-get update && sudo apt-get upgrade'
alias duh='du -h --max-depth=1'
alias dot='cd ~/.dotfiles'
alias cdot='cd ~/.dotfiles'
alias ei3='vim ~/.dotfiles/.config/i3/config'
alias evim='vim ~/.dotfiles/.vimrc'
alias ez='vim ~/.dotfiles/.zshrc'
alias install='sudo aptitude install'
# get current background image
alias current_background_image='gsettings get org.gnome.desktop.background picture-uri | sed s/file://g'
alias ll='ls -l'
alias kbus='setxkbmap -layout us -variant intl'
alias kbbr='setxkbmap -layout pt_br'
alias safe-upgrade='sudo aptitude update && sudo aptitude safe-upgrade'
alias szsh='source ~/.zshrc'
alias yt='youtube-dl -ic' # Download youtube link
alias yta='youtube-dl -xic' # Download youtube link audio only

alias vi='vim'
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d" # Use neovim for vim if present.
command -v nvim >/dev/null && alias vi="nvim" vidiff="nvim -d" # Use neovim for vim if present.

# docker
alias dcua='docker-compose up'
alias dcu='docker-compose up -d'
alias dcs='docker-compose stop'

# fzfz
alias fcd='cd find . -type d | fzf'

# GIT
alias gok='echo "git commit -a -m \"OK\"" && git commit -a -m "OK"'
alias gpa='echo "git pull --all" && git pull --all'
alias gpom='echo "git push -u origin master" && git push -u origin master'

#kitty
alias icat="kitty +kitten icat"

# php
alias runphp='php -S localhost:8000'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
export PATH="$PYENV_ROOT/completions/pyenv.bash:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)"
fi

# loading private setting
[ -f ~/.dotfiles-priv/zshrc.priv ]
source ~/.dotfiles-priv/zshrc.priv

# enable for zsh startup profiling
#zprof
