export LANG="en_US.UTF-8"

unsetopt correct_all # Disable autocorrection

setopt promptsubst
setopt promptpercent
setopt null_glob # Just return nothing for non-existant fileglob
setopt correct # Selective typo correction

fpath+=(~/.zsh/completion)

ZSH="${HOME}/.oh-my-zsh"
ZSH_CUSTOM="${HOME}/.zsh.d"
ZSH_THEME="mirell"

DISABLE_AUTO_UPDATE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

for file in $(tree -i -n --noreport -f "${HOME}"/.dotfiles/zsh.d); do
	[[ -f $file ]] && source $file
done

source "${ZSH}/oh-my-zsh.sh"

# Rehash completions
zstyle ':completion:*' rehash true

# One final path cleanup
typeset -U path
