
# Path to your oh-my-zsh installation.
export ZSH=/home/rafael/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="superjarin"
ZSH_THEME="jispwoso"

# History file size
HISTSIZE=100000

# Plugins
plugins=(
 git aws ubuntu
)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

source $ZSH/oh-my-zsh.sh

setxkbmap -option caps:ctrl_modifier

# -----------
# shortcuts
# -----------
# check folder size with max-depth of 1
alias duh='du -h --max-depth=1'
alias install='sudo aptitude install'
# get current background image
alias current_background_image='gsettings get org.gnome.desktop.background picture-uri | sed s/file://g'
alias vi='vim'
alias ll='ls -l'
alias safe-upgrade='sudo aptitude update && sudo aptitude safe-upgrade'
alias apt-upgrade='sudo apt-get update && sudo apt-get upgrade'
alias fcd='cd find . -type d | fzf'

# Atalhos GIT
alias gok='echo "git commit -a -m \"OK\"" && git commit -a -m "OK"'
alias gpa='echo "git pull --all" && git pull --all'
alias gpom='echo "git push -u origin master" && git push -u origin master'

alias runphp='php -S localhost:8000'

# private setting
source ~/.dotfiles-priv/zshrc.priv

#fzf - https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh 

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ssh agent
#if [ -f ~/.ssh/agent.env ] ; then
#    . ~/.ssh/agent.env > /dev/null
#    if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
#        echo "Stale agent file found. Spawning new agent… "
#        eval `ssh-agent | tee ~/.ssh/agent.env`
#        ssh-add
#    fi
#else
#    echo "Starting ssh-agent"
#    eval `ssh-agent | tee ~/.ssh/agent.env`
#    ssh-add
#fi
