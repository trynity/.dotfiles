if [[ $OSTYPE =~ linux-gnu ]]; then
	if-command-exists vim "export EDITOR=vim"

	RELEASE=$(cat /etc/*-release | tr '\n' ';' | sed 's/;/; /g')

	if [[ $RELEASE =~ Ubuntu ]]; then
		export LINUX_DISTRO=Ubuntu
		plugins+=(debian)
	fi
fi
