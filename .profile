# To change user and hostname
# sudo scutil --set ComputerName "newname"
# sudo scutil --set LocalHostName "newname"
# sudo scutil --set HostName "newname"

export BASH_SILENCE_DEPRECATION_WARNING=1

# brew install bash-completion
source /usr/local/etc/profile.d/bash_completion.sh

# brew install bash
# For git, shows the current branch
source /usr/local/etc/bash_completion.d/git-prompt.sh
PS1='\[\033[01;31m\]dk\[\033[01;33m\]@\[\033[01;32m\]\h \[\033[01;33m\]\w$(__git_ps1 " (%s)") \[\033[01;35m\]\$ \[\033[00m\]'

umask 022

export LS_OPTIONS='-G'

alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias ..='cd ..'
alias ...='cd ../..'
alias off='shutdown -h now'
export EDITOR=vi
export GREP_OPTIONS="--color=always"

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

alias k='kubectl'
complete -F __start_kubectl k
source <(kubectl completion bash)

export LC_ALL=en_US.UTF-8
