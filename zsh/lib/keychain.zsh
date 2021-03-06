if [[ -z $SSH_CLIENT ]]; then
  if (($+commands[keychain])); then
  	eval $(keychain --eval)

    KEYS=(github heroku aws bitbucket)

    for KEY in $KEYS; do
      eval $(ssh-add "${HOME}/.ssh/keys/${KEY}" &> /dev/null)
    done
  fi
fi

#SOCK="/tmp/ssh-agent-$USER-screen"

#if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]; then
#  rm -f /tmp/ssh-agent-$USER-screen
#  ln -sf $SSH_AUTH_SOCK $SOCK
#  export SSH_AUTH_SOCK=$SOCK
#fi
