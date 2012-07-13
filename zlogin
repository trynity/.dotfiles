if [[ -z $SSH_CLIENT ]]; then
  (($+commands[keychain])) && eval $(keychain --eval)
fi

[[ -r "${HOME}/.nvm/nvm.sh" ]] && source "${HOME}/.nvm/nvm.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
