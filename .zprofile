
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/zprofile.pre.zsh"


# Keyboard {{{
# map caps to control
setxkbmap -option caps:ctrl_modifier

# }}}



# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/zprofile.post.zsh"
