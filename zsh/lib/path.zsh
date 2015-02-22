# Add /usr/local/[s]bin to PATH
path=(/usr/local/bin $path)
path=(/usr/local/sbin $path)

# Add Haskell's cabal bin directory to PATH
path=("${HOME}/.cabal/bin" $path)

# Add Haskell Platform bin directory to PATH
path=("${HOME}/Library/Haskell/bin" $path)

# XQuartz
path=(/opt/X11/bin $path)

# Go
path=("${GOPATH}/bin" $path)

# TexLive
function textdist-init {
	textdist_prefix=$(texdist --current --expand)
	path=("${textdist_prefix}/bin/universal-darwin" $path)
}

if-command-exists texdist textdist-init

# Local bin directoies
path=(${HOME}/.bin $path)
path=(${HOME}/.local/bin $path)

# ccache for Homebrew
if [[ -e /usr/local/bin/brew ]]; then
	path+=("$(brew --prefix)/opt/ccache/libexec")
	export CCACHE_DIR="/Library/Caches/ccache"
fi

# nvm/rvm/perlbrew path reodering

nvm_paths=()
rvm_paths=()
perlbrew_paths=()

for i in $path; do
	if [[ $i  =~ ".nvm" ]]; then
		nvm_paths+=$i
	elif [[ $i =~ ".rvm" ]]; then
		rvm_paths+=$i
	elif [[ -n $PERLBREW_ROOT && $i =~ $PERLBREW_ROOT ]]; then
		perlbrew_paths+=$i
	fi
done

path=($rvm_paths $nvm_paths $perlbrew_paths $path)

# rvm
path=("${HOME}/.rvm/bin" $path)
path=("/usr/local/rvm/bin" $path)

typeset -U path

# Nifty Trick. Remove directories in PATH that don't exist!
path=($^path(N))

