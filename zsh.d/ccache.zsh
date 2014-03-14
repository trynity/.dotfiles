# ccache configuration
# Per:
# * http://petereisentraut.blogspot.com/2011/05/ccache-and-clang.html
# * http://petereisentraut.blogspot.com/2011/09/ccache-and-clang-part-2.html

if (($+commands[ccache])); then
  export CCACHE_LOGFILE="${HOME}/.log/ccache.log"
  export CCACHE_CPP2=yes # Run cpp twice
fi
