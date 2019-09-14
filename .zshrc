
# keyboard
# map caps to control
setxkbmap -option caps:ctrl_modifier

# Path to your oh-my-zsh installation.
export ZSH=/home/rafael/.oh-my-zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
        export EDITOR='vim'
else
        export EDITOR='nvim'
fi

# private setting
[ -f ~/.dotfiles-priv/zshrc.priv ]
source ~/.dotfiles-priv/zshrc.priv

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="superjarin"
ZSH_THEME="jispwoso"

# History file size
HISTSIZE=1000000

# Plugins
plugins=(
 git aws ubuntu
)

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# -----------
# aliases
# -----------
alias apt-upgrade='sudo apt-get update && sudo apt-get upgrade'
alias duh='du -h --max-depth=1'
alias dot='cd ~/.dotfiles'
alias cdot='cd ~/.dotfiles'
alias ez='vim ~/.dotfiles/zshrc'
alias ei3='vim ~/.dotfiles/.config/i3/config'
alias install='sudo aptitude install'
# get current background image
alias current_background_image='gsettings get org.gnome.desktop.background picture-uri | sed s/file://g'
alias ll='ls -l'
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


# fzf - https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh 
export FZF_DEFAULT_OPTS='--preview "(coderay {} || cat {}) 2> /dev/null | head -40"'


# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
export PATH="$PYENV_ROOT/completions/pyenv.bash:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)"
fi

