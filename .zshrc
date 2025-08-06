# rafael bernard rodrigues araujo - zsh config file

# enable for zsh profiling
#zmodload zsh/zprof

# keyboard
# map caps to control
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    # do nothing
elif [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
    gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']" || echo 1 >> /dev/null
    setxkbmap -option caps:ctrl_modifier && setxkbmap -layout us -variant intl  || echo 1 >> /dev/null
else
    echo "Unknown session type: $XDG_SESSION_TYPE"
fi


# Path to your oh-my-zsh installation.
export ZSH=/home/rafael/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="jispwoso"

# History and cache
HISTSIZE=100000000
SAVEHIST=100000000
[ ! -f "~/.cache/zsh" ] && mkdir -p ~/.cache/zsh
HISTFILE=~/.cache/zsh/history

# Plugins
plugins=(
        aws 
        archlinux
        docker 
        docker-compose 
        git terraform
        npm 
        z
)

# Load zsh
source $ZSH/oh-my-zsh.sh

# Enable auto/tab completions
autoload -Uz compinit
compinit
_comp_options+=(globdots)       # Enable autocompleting hidden files

# Edit line in vim (ctrl+e)
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# bindkey -v

# fzf - https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh 
export FZF_DEFAULT_OPTS='--preview "(coderay {} || cat {}) 2> /dev/null | head -40"'

# Completion for kitty
#kitty + complete setup zsh | source /dev/stdin

# Local scripts and binaries
if [ -d "$HOME/.local/bin" ] ; then
        PATH="$HOME/.local/bin:$PATH"
fi

[ -d "$HOME/bin" ] && PATH="${HOME}/bin:${PATH}"

# my scripts to PATH
[ -d "$HOME/.dotfiles/scripts" ]
PATH="$PATH:$HOME/.dotfiles/scripts"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
        export EDITOR='vim'
else
        export EDITOR='nvim'
fi
# uncomment to force all vim
#export EDITOR='vim'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -----------
# aliases
# -----------

#[[ -f "$HOME/.dotfiles/aliasesrc" ]] && 
source ~/.dotfiles/aliasesrc || echo "alias file not present"

export DOCKER_BUILDKIT=1

# loading private setting
[ -f ~/.dotfiles-priv/aliases.priv ] && source ~/.dotfiles-priv/aliases.priv

# ssh-agent for all sessions? (trying)
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
fi

# go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# flyctl
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export AWS_CONFIGURE_SSO_DEFAULT_SSO_REGION=us-east-1
sso(){
  unset AWS_PROFILE
  export AWS_PROFILE=$1
  aws sts get-caller-identity &> /dev/null || aws sso login || (unset AWS_PROFILE && aws-configure-sso-profile --profile $1)
  eval $(aws-export-credentials --env-export)
}

# phpbrew - https://github.com/phpbrew/phpbrew
if [ -f ~/.phpbrew/bashrc ]; then
    # not setting prompt for now
    export PHPBREW_SET_PROMPT=0
    export PHPBREW_RC_ENABLE=1
    source ~/.phpbrew/bashrc
fi

# nix
export NIX_REMOTE=daemon

# vi: tabstop=8 softtabstop=8
