### Homebrew

if [[ ($OSTYPE =~ darwin) ]] && (($+commands[brew])); then

    # Homebrew Casks
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"

    # OpenSSL Certs
    if [[ -s "/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt" ]]; then
      export SSL_CERT_FILE="/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt"
    fi

fi
