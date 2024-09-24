source $HOME/.aliasrc

export PATH=$HOME/.bin:$PATH
export HOSTNAME=`hostnamectl hostname`

set -o vi
stty -ixon
PS1=$(print '\033[32m>\033[00m ')

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

