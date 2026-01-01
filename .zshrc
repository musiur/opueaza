# Starship prompt
eval "$(starship init zsh)"

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Better defaults
setopt autocd
setopt extendedglob
setopt histignorealldups
setopt sharehistory

# Completion
autoload -Uz compinit
compinit
# Dotfiles bare repo
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

