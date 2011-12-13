source ~/.bash/functions
source ~/.bash/path
source ~/.bash/homebrew

# rvm
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm" && export RVM_LOADED=1
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# nvm
[[ -r "${HOME}/.nvm/nvm.sh" ]] && source "${HOME}/.nvm/nvm.sh" && export NVM_LOADED=1

# perlbrew
[[ -s "${HOME}/.perlbrew" ]] && export PERLBREW_ROOT="${HOME}/.perlbrew" && export PERLBREW_LOADED=1
[[ -r "${HOME}/.perlbrew/etc/bashrc" ]] && source "${HOME}/.perlbrew/etc/bashrc"

# pythonbrew
[[ -s "{$HOME}/.pythonbrew/etc/bashrc" ]] && source "{$HOME}/.pythonbrew/etc/bashrc" && export PYTHONBREW_LOADED=1

# Google depot_tools
[[ -d ${HOME}/src/depot_tools ]] && export PATH="${HOME}/src/depot_tools:${PATH}"

# python
export PYTHONSTARTUP=~/.pythonrc

[[ $OSTYPE =~ darwin && $(which subl) ]] && export EDITOR="subl -w"

# prompt
[[ -n $RVM_LOADED ]] && export PS1="\h:\W \u [$(rvm-prompt i v )] \$ "
