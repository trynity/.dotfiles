source ~/.bash/functions
source ~/.bash/path
source ~/.bash/homebrew
source ~/.bash/java
source ~/.bash/alias

# Allow ! in commands
export histchars=

# Linux
[[ $OSTYPE =~ linux ]] && alias brew=emerge

# rvm
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm" && export RVM_LOADED=1
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
[[ -s "$HOME/.rvm/contrib/ps1_functions" ]] && source "$HOME/.rvm/contrib/ps1_functions"

# nvm
[[ -r "${HOME}/.nvm/nvm.sh" ]] && source "${HOME}/.nvm/nvm.sh" && export NVM_LOADED=1
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# perlbrew
[[ -s "${HOME}/.perlbrew" ]] && export PERLBREW_ROOT="${HOME}/.perlbrew" && export PERLBREW_LOADED=1
[[ -r "${HOME}/.perlbrew/etc/bashrc" ]] && source "${HOME}/.perlbrew/etc/bashrc"

# pythonbrew
[[ -s "{$HOME}/.pythonbrew/etc/bashrc" ]] && source "{$HOME}/.pythonbrew/etc/bashrc" && export PYTHONBREW_LOADED=1

# Google depot_tools
[[ -d ${HOME}/src/depot_tools ]] && export PATH="${HOME}/src/depot_tools:${PATH}"

# python
export PYTHONSTARTUP=~/.pythonrc

[[ $OSTYPE =~ darwin && $(which subl) ]] && export EDITOR="subl -wn"

# Homebrew
[[ -f `brew --prefix`/etc/bash_completion ]] && . `brew --prefix`/etc/bash_completion

# kerl
[[ -f /usr/local/erlang/R15B01/activate ]] && . /usr/local/erlang/R15B01/activate

# prompt
source ~/.bash/prompt

# Deal with iTerm/SSH Tab Titles
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

# autoenv
[[ -f `brew --prefix autoenv`/activate.sh ]] && source `brew --prefix autoenv`/activate.sh
