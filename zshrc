fpath=(~/.zsh/completion $fpath)

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mirell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Removed plugins:
# (none)
plugins=(brew bundler cpanm gem git github git-extras heroku knife nanoc npm pip rvm vagrant perl)

if [[ -s $(which virtualenvwrapper_lazy.sh) ]]; then
  plugins=(virtualenvwrapper $plugins)
fi

if [[ $OSTYPE =~ darwin ]]; then 
  # export PERL5LIB="/Applications/Xcode.app/Contents/Developer/Library/Perl/5.12/darwin-thread-multi-2level"
  plugins=(osx $plugins)
fi

source $ZSH/oh-my-zsh.sh

# Disable autocorrection
unsetopt correct_all

# jenv (Java Environment Switcher) support
eval "$(jenv init -)"

# Default Editor for MacOSX: Sublime Text 2
if [[ $OSTYPE =~ darwin ]]; then 
  (($+commands[subl])) && export EDITOR="subl -n"
fi

if [[ -z $SSH_CLIENT ]]; then
  (($+commands[keychain])) && eval $(keychain --eval)
fi

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
[[ -s /usr/local/share/python/virtualenvwrapper.sh ]] && source /usr/local/share/python/virtualenvwrapper.sh

# Rehash completions
zstyle ':completion:*' rehash true

# Python
export PYTHONSTARTUP=~/.pythonrc

# Homebrew Casks
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Use .history for zsh's history
export HISTFILE="${HOME}/.history/zsh_history"

# Disable less history
export LESSHISTFILE=/dev/null

# Use bash completion scripts
# autoload bashcompinit
# bashcompinit

# if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
#   bash_source $(brew --prefix)/etc/bash_completion
# fi

# RVM
[[ -d "/usr/local/rvm/bin" ]] && PATH=$PATH:/usr/local/rvm/bin
[[ -d "$HOME/.rvm/bin" ]] && PATH=$PATH:$HOME/.rvm/bin
