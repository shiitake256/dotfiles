# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment

# User specific aliases and functions
alias xclip='xclip -selection clipboard'

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
