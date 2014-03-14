alias sha256='shasum -a 256'
alias sha512='shasum -a 512'

if [[ $OSTYPE =~ darwin ]]; then
  # Markdown Editor
  alias mou="open /Applications/Mou.app"

  # SQLite Editor
  alias base='open /Applications/Base.mou'

  # Linux way of listing USB devices
  alias lsusb='system_profiler SPUSBDataType'

  # We're in the land of otool
  alias ldd='otool -L'

  alias cd-tempdir="cd $(mktemp -d -t cd-tempdir)"

  # Easier way to find the routes
  alias routes="netstat -nr"

  # Sublime Text Editor
  (($+commands[subl])) && export EDITOR="subl -n"

  # Mac OS X moved updatedb
  alias updatedb="/usr/libexec/locate.updatedb"
fi
