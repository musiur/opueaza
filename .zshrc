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







[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
