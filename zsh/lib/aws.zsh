# AWS Tools

# This is a really ugly way to find JAVA_HOME. But cross-platform support!
export JAVA_HOME="$(java -XshowSettings 2>&1 | grep "java.home" | sed "s/.* = \(.*\)\/jre/\1/")"

if [[ -n $(echo ${HOME}/.ec2/pk-*.pem) ]]; then
	export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem | /usr/bin/head -1)"
fi

if [[ -n $(echo ${HOME}/.ec2/cert-*.pem) ]]; then
	export EC2_CERT="$(/bin/ls ${HOME}/.ec2/cert-*.pem | /usr/bin/head -1)"
fi

if [[ -d "/usr/local/opt/ec2-ami-tools/libexec" ]]; then
	export EC2_AMITOOL_HOME="/usr/local/opt/ec2-ami-tools/libexec"
fi

if [[ -d "/usr/local/opt/ec2-api-tools/libexec" ]]; then
	export EC2_HOME="/usr/local/opt/ec2-api-tools/libexec"
fi
