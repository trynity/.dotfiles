# make targets : For "rake -T" similar functionality

read -r -d '' MAKE_TARGETS << 'EOF'
make --question --print-data-base | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}'
EOF

function make() {
	if [[ $1 == "--targets" ]]; then
		eval ${MAKE_TARGETS}
	else
		command make $*[1,-1];
	fi;
}
