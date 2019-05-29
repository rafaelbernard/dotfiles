
# Path to your oh-my-zsh installation.
export ZSH=/home/rafael/.oh-my-zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#fzf - https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh 
export FZF_DEFAULT_OPTS='--preview "(coderay {} || cat {}) 2> /dev/null | head -40"'

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
 git aws ubuntu vi-mode
)

source $ZSH/oh-my-zsh.sh

setxkbmap -option caps:ctrl_modifier

autoload -Uz compinit
compinit

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# -----------
# aliases
# -----------
# check folder size with max-depth of 1
alias apt-upgrade='sudo apt-get update && sudo apt-get upgrade'
alias duh='du -h --max-depth=1'
alias dot='cd ~/.dotfiles'
alias install='sudo aptitude install'
# get current background image
alias current_background_image='gsettings get org.gnome.desktop.background picture-uri | sed s/file://g'
alias ll='ls -l'
alias safe-upgrade='sudo aptitude update && sudo aptitude safe-upgrade'

alias vi='vim'
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d" # Use neovim for vim if present.
command -v nvim >/dev/null && alias vi="nvim" vidiff="nvim -d" # Use neovim for vim if present.

# docker
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'

# fzfz
alias fcd='cd find . -type d | fzf'

# GIT
alias gok='echo "git commit -a -m \"OK\"" && git commit -a -m "OK"'
alias gpa='echo "git pull --all" && git pull --all'
alias gpom='echo "git push -u origin master" && git push -u origin master'

alias runphp='php -S localhost:8000'

# private setting
[ -f ~/.dotfiles-priv/zshrc.priv ]
source ~/.dotfiles-priv/zshrc.priv


