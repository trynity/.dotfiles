unsetopt correct_all 	# Disable autocorrection
setopt promptsubst
setopt promptpercent
setopt null_glob 		# Just return nothing for non-existant fileglob
setopt correct 			# Selective typo correction

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

ZSH_LIB="${HOME}/.zsh/lib/"

source "${ZSH_LIB}/google.zsh"
source "${ZSH_LIB}/aliases.zsh"
source "${ZSH_LIB}/keychain.zsh"
source "${ZSH_LIB}/osx.zsh"
source "${ZSH_LIB}/linux.zsh"
source "${ZSH_LIB}/aws.zsh"
source "${ZSH_LIB}/ccache.zsh"
source "${ZSH_LIB}/homebrew.zsh"
source "${ZSH_LIB}/plugins.zsh"

ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="mirell"

# oh-my-zsh
export DISABLE_UPDATE_PROMPT=true

source "${ZSH}/oh-my-zsh.sh"

# Rehash completions
zstyle ':completion:*' rehash true

# One final path cleanup
typeset -U path

export PUPPETSERVERS=( 'puppet0001.prn.parsec.apple.com' 'puppet0002.prn.parsec.apple.com' 'puppet0003.prn.parsec.apple.com' )
export OPS=ops0001.prn.parsec.apple.com
per() {
       [[ $# -ne 2 ]] && return 1
   for ps in ${PUPPETSERVERS[@]}; do
           ssh -n -o BatchMode=yes $ps "pbr $1 $2" 2>&1 &
   done
   wait
   echo "Puppet branch reset completed"
       return 0
}
esp() {
       ssh $OPS "esp"
}

puppet_noop() {
       local host="$1"
       [[ -z $host ]] && return 1
       ssh "$host" "puppet_noop tmirell"
}
