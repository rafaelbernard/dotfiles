# vi: tabstop=8 softtabstop=8
# rafael bernard rodrigues araujo - zsh config file

# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
[[ -f "${HOME}/.local/share/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/zshrc.pre.zsh"

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
export ZSH=$HOME/.oh-my-zsh

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
        git 
        fzf
        npm 
        terraform
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

# {{{{{ ===== My Stuff =====

# Local scripts and binaries
[ -d "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin"
[ -d "$HOME/bin" ] && PATH="$PATH:$HOME/bin:"
[ -d "$HOME/.bin" ] && PATH="$PATH:$HOME/.bin"
[ -d "$HOME/.dotfiles/bin" ] && PATH="$PATH:$HOME/.dotfiles/bin"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
        export EDITOR='vim'
else
        export EDITOR='nvim'
fi
# uncomment to force all vim
#export EDITOR='vim'

# -----------
# aliases
# -----------

source ~/.dotfiles/aliasesrc || echo "alias file not present"

# loading private setting
[ -f ~/.dotfiles-priv/aliases.priv ] && source ~/.dotfiles-priv/aliases.priv

# }}}}} ===== My Stuff END =====

# ssh-agent for all sessions
if [[ "$OSTYPE" != "darwin"* ]]; then
    # Linux: use XDG_RUNTIME_DIR
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
    fi
    if [[ ! "$SSH_AUTH_SOCK" ]]; then
        eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
    fi
fi
# macOS: uses native keychain via ~/.ssh/config

# nix
export NIX_REMOTE=daemon

# omarchy
export OMARCHY_PATH="$HOME/.local/share/omarchy"
export PATH="$PATH:$OMARCHY_PATH/bin"

# docker
export DOCKER_BUILDKIT=1

# flyctl
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$PATH:$FLYCTL_INSTALL/bin"

### aws
export AWS_CONFIGURE_SSO_DEFAULT_SSO_REGION=us-east-1
# only needed for mac -- tag
[[ -f "${HOME}/corporate-certs.pem" ]] && export AWS_CA_BUNDLE=~/corporate-certs.pem

sso(){
  unset AWS_PROFILE
  export AWS_PROFILE=$1
  aws sts get-caller-identity &> /dev/null || aws sso login || (unset AWS_PROFILE && aws-configure-sso-profile --profile $1)
  eval $(aws-export-credentials --env-export)
}

# kiro
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# OpenClaw Completion
[[ -f "${HOME}/.openclaw/completions/openclaw.sh" ]] && source "${HOME}/.openclaw/completions/openclaw.zsh"

### For programming languages

# bun
export PATH="$PATH:$HOME/.cache/.bun/bin"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# python
export UV_NATIVE_TLS=true

# php
# phpbrew - https://github.com/phpbrew/phpbrew
if [ -f ~/.phpbrew/bashrc ]; then
    # not setting prompt for now
    export PHPBREW_SET_PROMPT=0
    export PHPBREW_RC_ENABLE=1
    source ~/.phpbrew/bashrc
fi

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
[[ -f "${HOME}/.local/share/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/zshrc.post.zsh"
