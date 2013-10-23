source ~/.bash/completions
source ~/.bash/functions
source ~/.bash/path
source ~/.bash/homebrew
source ~/.bash/java
source ~/.bash/python
source ~/.bash/alias

# Allow ! in commands
export histchars=

# Change where we save .bash_history
export HISTFILE=~/.history/bash_history

# Disable less history
export LESSHISTFILE=/dev/null

# Linux
[[ $OSTYPE =~ linux ]] && alias brew=emerge

# rvm
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

# Sublime Text 2 as default editor on MacOSX
[[ $OSTYPE =~ darwin && $(which subl) ]] && export EDITOR="subl -n"

# kerl
[[ -f /usr/local/erlang/R15B01/activate ]] && . /usr/local/erlang/R15B01/activate

# prompt
source ~/.bash/prompt

# Deal with iTerm/SSH Tab Titles
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

# autoenv
command -v brew && [[ -f `brew --prefix autoenv`/activate.sh ]] && source `brew --prefix autoenv`/activate.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
