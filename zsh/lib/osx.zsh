if [[ $OSTYPE =~ darwin ]]; then
  if-command-exists subl 'export EDITOR="subl -n"'

  # export PERL5LIB="/Applications/Xcode.app/Contents/Developer/Library/Perl/5.12/darwin-thread-multi-2level"

  # HFS+ xattr
  zmodload zsh/attr # Builtins for manipulating extended attributes (xattr)

  # I'm not even sure this works
  defaults write ~/.MacOSX/environment PATH $PATH &> /dev/null
fi
