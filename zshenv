# rvm
path+=("${HOME}/.rvm/bin")

# Add /usr/local/[s]bin to PATH
path=(/usr/local/bin $path)
path=(/usr/local/sbin $path)

# zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters