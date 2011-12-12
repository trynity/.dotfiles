source ~/.bash/functions

# Reset PATH
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# rvm
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# nvm
[[ -r "${HOME}/.nvm/nvm.sh" ]] && source "${HOME}/.nvm/nvm.sh"

# perlbrew
[[ -s "${HOME}/.perlbrew" ]] && export PERLBREW_ROOT="${HOME}/.perlbrew"
[[ -r "${HOME}/.perlbrew/etc/bashrc" ]] && source "${HOME}/.perlbrew/etc/bashrc"

# pythonbrew
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

source ~/.bash/path

# prompt
export PS1="\h:\W \u [$(rvm-prompt i v )] \$ "
