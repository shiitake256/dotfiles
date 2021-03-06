# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment

# User specific aliases and functions
alias xclip='xclip -selection clipboard'
alias ej='trans en:ja -b -j --'
alias je='trans ja:en -b -j --'
alias aws='AWS_ACCESS_KEY_ID=$(secret-tool lookup env aws-access-key-id) AWS_SECRET_ACCESS_KEY=$(secret-tool lookup env aws-secret-access-key) aws'

load-secrets(){
    export GITEA_API_TOKEN=$(secret-tool lookup env GITEA_API_TOKEN)
    export GITEA_ROOT_URL=$(secret-tool lookup env GITEA_ROOT_URL)
}

#HISTSIZE
HISTSIZE=100000

shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r; "$PROMPT_COMMAND; 

# direnv
# eval "$(direnv hook bash)"

# kubectl
source <(kubectl completion bash)

# kompose
source <(kompose completion bash)

# crictl
# source <(crictl completion bash)

# helm
source <(helm completion bash)

# podman
source <(podman completion bash)

# PowerLine
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

alias vim='gvim -v'

# AWS
complete -C /usr/local/bin/aws_completer aws

# Homebrew
if type ~/.linuxbrew/bin/brew &>/dev/null
then
    HOMEBREW_PREFIX="$(~/.linuxbrew/bin/brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi
