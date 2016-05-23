# Atalhos
alias duh='du -h --max-depth=1'
alias devfirefox='sh ~/Dropbox/util/shell/devfirefox'
#alias datagrip='sh ~/Dropbox/util/shell/datagrip'
alias edit-money='sh ~/Dropbox/util/shell/edit-money '
alias install='sudo aptitude install'
alias psqlcetreina='psql -h 152.92.197.125 -U adm_cetreina -d cetreina'
alias psqlddesenv='psql -h pgdev.dsea.uerj.br -U ADM_DSEA -d dsea'
alias psqldprod='psql -h pg.dsea.uerj.br -U ADM_DSEA -d dsea'
alias psqlsrv1='psql -h srv1.oservidor.com -U rafael -d econrio_bd'
alias psqlsrv2='psql -h srv2.oservidor.com -U rafael -d postgres'
alias curbac='gsettings get org.gnome.desktop.background picture-uri | sed s/file://g'
alias vi='vim'
alias ll='ls -l'
alias safe-upgrade='sudo aptitude update && sudo aptitude safe-upgrade'

# Atalhos ECONRIO
alias er_carregar_cartoes='sh /home/rafael/Dropbox/util/econrio/carregar_cartoes'

# Atalhos GIT
alias gok='echo "git commit -a -m \"OK\"" && git commit -a -m "OK"'
alias gpa='echo "git pull --all" && git pull --all'
alias gpom='echo "git push -u origin master" && git push -u origin master'

# Execucao de aplicacao local em PHP
alias runphp='php -S localhost:8000'

# DSEA
alias baixar_cap2014='sh /home/rafael/Dropbox/util/impl/baixar_cap2014'
alias baixar_cap2015='sh /home/rafael/Dropbox/util/impl/baixar_cap2015'
alias idsea='sh /home/rafael/Dropbox/util/impl/implementar_dsea_desenvolvimento'

#Util
alias sincmusicasdsea='sh /home/rafael/Dropbox/util/shell/sinc_musicas_dsea'

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
