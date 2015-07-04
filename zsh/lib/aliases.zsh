alias sha256='shasum -a 256'
alias sha512='shasum -a 512'

alias whereis='type -p'

alias -s git='git clone'

if [[ $OSTYPE =~ darwin ]]; then
  # Markdown Editor
  alias mou="open /Applications/Mou.app"

  # SQLite Editor
  alias base='open /Applications/Base.app'

  # Linux way of listing USB devices
  alias lsusb='system_profiler SPUSBDataType'

  # We're in the land of otool
  alias ldd='otool -L'

  alias tempdir="$(mktemp -d -t $(random_string))"

  # Easier way to find the routes
  alias routes="netstat -nr"

  # Sublime Text Editor
  (($+commands[subl])) && export EDITOR="subl -n"

  # Mac OS X moved updatedb
  alias updatedb="/usr/libexec/locate.updatedb"
fi
