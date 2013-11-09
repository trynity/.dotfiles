# rvm
path+=("${HOME}/.rvm/bin")

# Add /usr/local/[s]bin to PATH
path=(/usr/local/bin $path)
path=(/usr/local/sbin $path)
