# Atalhos
alias duh='du -h --max-depth=1'
alias devfirefox='sh ~/Dropbox/util/shell/devfirefox'
alias edit-money='sh ~/Dropbox/util/shell/edit-money '
alias install='sudo aptitude install'
alias curbac='gsettings get org.gnome.desktop.background picture-uri | sed s/file://g'
alias vi='vim'
alias ll='ls -l'
alias safe-upgrade='sudo aptitude update && sudo aptitude safe-upgrade'

# Atalhos GIT
alias gok='echo "git commit -a -m \"OK\"" && git commit -a -m "OK"'
alias gpa='echo "git pull --all" && git pull --all'
alias gpom='echo "git push -u origin master" && git push -u origin master'

# Execucao de aplicacao local em PHP
alias runphp='php -S localhost:8000'

# private setting
source /home/rafael/Dropbox/util/shell/rc.d/zshrc.priv
# omz
source ~/.oh-my-zsh/plugins/git/git.plugin.zsh
source ~/.oh-my-zsh/plugins/svn/svn.plugin.zsh
source ~/.oh-my-zsh/plugins/ubuntu/ubuntu.plugin.zsh

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
export ZZPATH=/home/rafael/Dropbox/util/shell/funcoeszz
# private settings
source /home/rafael/Dropbox/util/shell/rc.d/zzzshrc
