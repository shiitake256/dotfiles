# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/.poetry/bin:" ]]
then
    PATH="$HOME/.poetry/bin:$PATH"
fi

# krew
PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# go
PATH="${KREW_ROOT:-$HOME/go/bin}/bin:$PATH"

export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Pipenv
export PIPENV_VENV_IN_PROJECT=1

export EDITOR=vim

export MANPAGER="vim -M +MANPAGER +'set nomodified nomodifiable foldmethod=indent foldlevel=1000' -"

# AWS
export AWS_DEFAULT_REGION='ap-northeast-1'

# Homebrew
eval "$(~/.linuxbrew/bin/brew shellenv)"
