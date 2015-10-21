# Atalhos
alias duh='du -h --max-depth=1'
alias devfirefox='sh ~/Dropbox/util/shell/devfirefox'
#alias devfirefox='cd /home/rafael/prg/local/firefox/ && nohup sh firefox & && cd -'
#alias edit-money='cd /tmp && nohup gedit /home/rafael/Dropbox/pessoal/documentos/money.html & && cd - '
alias edit-money='sh ~/Dropbox/util/shell/edit-money '
alias install='sudo aptitude install'
alias psqlcetreina='psql -h 152.92.197.125 -U adm_cetreina -d cetreina'
alias psqlddesenv='psql -h 152.92.197.123 -U ADM_DSEA -d dsea'
alias psqldprod='psql -h 152.92.4.88 -U ADM_DSEA -d dsea'
alias psqlsrv1='psql -h srv1.oservidor.com -U rafael -d econrio_bd'
alias psqlsrv2='psql -h srv2.oservidor.com -U rafael -d postgres'
alias curbac='gsettings get org.gnome.desktop.background picture-uri | sed s/file://g'
alias gmoney='gedit ~/Dropbox/pessoal/documentos/money.html &'
alias vi='vim'
alias ll='ls -l'
alias safe-upgrade='sudo aptitude update && sudo aptitude safe-upgrade'
alias sok='svn commit -m " "'

# Atalhos ECONRIO
alias er_carregar_cartoes='sh /home/rafael/Dropbox/util/econrio/carregar_cartoes'

# Atalhos GIT
alias gok='echo "git commit -a -m \"OK\"" && git commit -a -m "OK"'
alias gpa='echo "git pull --all" && git pull --all'
alias gpom='echo "git push -u origin master" && git push -u origin master'

# Atalhos SVN
alias scm='svn commit -m '

alias tunel_vivomais_hom='ssh -f root@db1.vms.icons4u.com.br -L 55432:db1.vms.icons4u.com.br:5432 -N'

# Execucao de aplicacao local em PHP
alias runphp='php -S localhost:8000'

# DSEA
alias baixar_cap2014='sh /home/rafael/Dropbox/util/impl/baixar_cap2014'
alias baixar_cap2015='sh /home/rafael/Dropbox/util/impl/baixar_cap2015'
alias idsea='sh /home/rafael/Dropbox/util/impl/implementar_dsea_desenvolvimento'
alias sinc_bd-exec='rsync -Cravzp ~/Copy/DSEA/informatica/ ~/centauro/informatica/'

#Util
alias sincmusicasdsea='sh /home/rafael/Dropbox/util/shell/sinc_musicas_dsea'

source ~/.oh-my-zsh/plugins/git/git.plugin.zsh
source ~/.oh-my-zsh/plugins/svn/svn.plugin.zsh
source ~/.oh-my-zsh/plugins/ubuntu/ubuntu.plugin.zsh

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
export ZZPATH=/home/rafael/Dropbox/util/shell/funcoeszz
source /home/rafael/Dropbox/util/shell/rc.d/zzzshrc


