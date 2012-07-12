# rvm
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"

# nvm
[[ -r "${HOME}/.nvm/nvm.sh" ]] && source "${HOME}/.nvm/nvm.sh"

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mirell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

plugins=(git java rvm)

source $ZSH/oh-my-zsh.sh

# Disable autocorrection
unsetopt correct_all

# Add /usr/local/[s]bin to PATH
path=(/usr/local/bin /usr/local/sbin $path)

# TexLive
path+=$(texdist --current --expand)/bin/universal-darwin

# Default Editor for MacOSX: Sublime Text 2
if [[ $OSTYPE =~ darwin ]]; then 
  (($+commands[subl])) && export EDITOR="subl -n"
  path=(/usr/local/share/python $path)
fi
