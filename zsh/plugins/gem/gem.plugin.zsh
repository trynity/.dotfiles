function gem() {
	if [[ $1 == "rm" ]]; then
		command gem uninstall $*[1,-1];
	else
		command gem $*[1,-1];
	fi;
}
