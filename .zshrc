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
HISTSIZE=100000000
SAVEHIST=100000000
HISTFILE=~/.cache/zsh/history

# Plugins
plugins=(
        archlinux aws git terraform z
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
#function zle-keymap-select {
#  if [[ ${KEYMAP} == vicmd ]] ||
#     [[ $1 = 'block' ]]; then
#    echo -ne '\e[1 q'
#  elif [[ ${KEYMAP} == main ]] ||
#       [[ ${KEYMAP} == viins ]] ||
#       [[ ${KEYMAP} = '' ]] ||
#       [[ $1 = 'beam' ]]; then
#    echo -ne '\e[5 q'
#  fi
#}
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

[ -f "$HOME/.dotfiles/aliasesrc" ]
source ~/.dotfiles/aliasesrc

export DOCKER_BUILDKIT=1

# pyenv
#if command -v pyenv 1>/dev/null 2>&1; then
#        export PYENV_ROOT="$HOME/.pyenv"
#        export PATH="$PYENV_ROOT/bin:$PATH"
#        export PATH="$PYENV_ROOT/shims:$PATH"
#        export PATH="$PYENV_ROOT/completions/pyenv.bash:$PATH"
#        eval "$(pyenv init -)"
#fi

#if which pyenv-virtualenv-init > /dev/null; then
#    eval "$(pyenv virtualenv-init -)"
#fi

# loading private setting
[ -f ~/.dotfiles-priv/aliases.priv ]
source ~/.dotfiles-priv/aliases.priv

# enable for zsh startup profiling
#zprof

# ssh-agent for all sessions? (trying)
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
fi

# Android SDK
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/21.3.6528147"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# vim: tabstop=8 softtabstop=8
