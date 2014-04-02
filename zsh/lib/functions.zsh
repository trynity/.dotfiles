function source-if-exists {
  if [[ -s $1 ]] then
    source $1
  fi
}

function prepend-path {
  remove-path $1
  export PATH=$1:$PATH
}

function append-path {
  remove-path $1
  export PATH=$PATH:$1
}

function if-command-exists {
	if (($+commands[$1])); then
		eval $2
	fi
}

function add-path-if-exists {
	if [[ -d $1 ]] then
		path+=$1
	fi
}

# DO NOT USE FOR PASSWORDS
function random_string {
  echo $(cat /dev/random | LC_CTYPE=C tr -dc "[:alpha:]" | head -c 8)
}
