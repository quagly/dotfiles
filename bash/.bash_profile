#!/bin/bash

#. ~/.bashrc

set -o vi

# pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PATH="/home/mwest/.pyenv/bin:$PATH"
# rehash takes a few seconds and only needs to be run when changing install
eval "$(pyenv init - --no-rehash)"

export PS1="($(pyenv version-name)) \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[33;1m\]\w\[\033[m\]$ "
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# now there is an executable that returns JAVA_HOME on OSX
[ -f /usr/libexec/java_home ] && export JAVA_HOME=$(/usr/libexec/java_home)

# initialize bash completion if exists
# where else should I look?  MacPorts and Homebrew put it here on OSX
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/share/bash-completion/bash_completion ] && . /usr/local/share/bash-completion/bash_completion
