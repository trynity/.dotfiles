source ~/.profile

unsetopt correct_all 	# Disable autocorrection
setopt promptsubst
setopt promptpercent
setopt null_glob 		# Just return nothing for non-existant fileglob
setopt correct 			# Selective typo correction

source "${HOME}/.zsh.d/functions.zsh"

### RVM
add-path-if-exists "/usr/local/rvm/bin"
add-path-if-exists "${HOME}/.rvm/bin"

### perlbrew
if [[ -s "${HOME}/.perlbrew/etc/bashrc" ]]; then
  source "${HOME}/.perlbrew/etc/bashrc"
fi

### nvm
source-if-exists "${HOME}/.nvm/nvm.sh"

### python
[[ -f "${HOME}/.pythonrc" ]] && export PYTHONSTARTUP="${HOME}/.pythonrc"

### virtualenv
if [[ -s "/usr/local/share/python/virtualenvwrapper.sh" ]]; then
  source "/usr/local/share/python/virtualenvwrapper.sh"
fi

### DocBook
if [[ -s "/usr/local/etc/xml/catalog" ]]; then
	export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"
fi

### travis
source-if-exists "${HOME}/.travis/travis.sh"

### tmuxinator
source-if-exists "${HOME}/.tmuxinator/scripts/tmuxinator"

### autoenv
source-if-exists "/usr/local/opt/autoenv/activate.sh"

### vagrant
# Use a global vagrant install if we have access to it
[[ -w /var/lib/vagrant ]] && export VAGRANT_HOME="/var/lib/vagrant"

source "${HOME}/.zsh.d/google.zsh"
source "${HOME}/.zsh.d/path.zsh"
source "${HOME}/.zsh.d/aliases.zsh"
source "${HOME}/.zsh.d/keychain.zsh"
source "${HOME}/.zsh.d/osx.zsh"
source "${HOME}/.zsh.d/linux.zsh"
source "${HOME}/.zsh.d/aws.zsh"
source "${HOME}/.zsh.d/ccache.zsh"
source "${HOME}/.zsh.d/homebrew.zsh"
source "${HOME}/.zsh.d/plugins.zsh"

ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="mirell"

source "${ZSH}/oh-my-zsh.sh"

# Rehash completions
zstyle ':completion:*' rehash true

# TODO: Figure out why my magic PATH reordering isn't working
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# One final path cleanup
typeset -U path
