# Atalhos
alias duh='du -h --max-depth=1'
alias install='sudo aptitude install'
alias curbac='gsettings get org.gnome.desktop.background picture-uri | sed s/file://g'
alias vi='vim'
alias ll='ls -l'
alias safe-upgrade='sudo aptitude update && sudo aptitude safe-upgrade'
alias apt-upgrade='sudo apt-get update && sudo apt-get upgrade'

# Atalhos GIT
alias gok='echo "git commit -a -m \"OK\"" && git commit -a -m "OK"'
alias gpa='echo "git pull --all" && git pull --all'
alias gpom='echo "git push -u origin master" && git push -u origin master'

# Execucao de aplicacao local em PHP
alias runphp='php -S localhost:8000'

# private setting
source /home/rafael/Dropbox/util/shell/rc.d/zshrc.priv

#nvm
export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# omz
source ~/.oh-my-zsh/plugins/git/git.plugin.zsh
source ~/.oh-my-zsh/plugins/ubuntu/ubuntu.plugin.zsh
