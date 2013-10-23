# Add /usr/local/[s]bin to PATH
path+=(/usr/local/bin)
path+=(/usr/local/sbin)

[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
