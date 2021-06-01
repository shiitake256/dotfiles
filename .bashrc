# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/.poetry/bin:" ]]
then
    PATH="$HOME/.poetry/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#HISTSIZE
HISTSIZE=100000

shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r; "$PROMPT_COMMAND; 

# direnv
eval "$(direnv hook bash)"

# kubectl
source <(kubectl completion bash)

# kubectl
source <(kompose completion bash)

# crictl
source <(crictl completion bash)

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
