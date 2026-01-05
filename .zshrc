# ========================================
# Powerlevel10k instant prompt (top of file)
# ========================================
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ========================================
# Oh My Zsh
# ========================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ========================================
# History & Defaults
# ========================================
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt autocd
setopt extendedglob
setopt histignorealldups
setopt sharehistory

autoload -Uz compinit
compinit

# ========================================
# Dotfiles alias
# ========================================
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ========================================
# Kiro shell integration (if using Kiro)
# ========================================
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# ========================================
# NVM
# ========================================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ========================================
# Fastfetch random image in Kitty
#   → AFTER Powerlevel10k is fully loaded
# ========================================
 [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ "$TERM" == "xterm-kitty" ]]; then
  sleep 0.5
  ~/.config/fastfetch/random-logo.sh
  fastfetch
fi




# ========================================
# Optional: Add more aliases here
# ========================================
# alias ll='ls -lah'
# alias gs='git status'

