#!/bin/bash

. ~/.bashrc

set -o vi

# pyenv
if type -P pyenv > /dev/null 2>&1; then
	export PYENV_VIRTUALENV_DISABLE_PROMPT=1
	export PATH="/home/mwest/.pyenv/bin:$PATH"
 	eval "$(pyenv init - )"
fi

export PS1="($(pyenv version-name)) \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[33;1m\]\w\[\033[m\]$ "
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# now there is an executable that returns JAVA_HOME on OSX
[ -f /usr/libexec/java_home ] && export JAVA_HOME=$(/usr/libexec/java_home)

# initialize bash completion if exists
# where else should I look?  MacPorts and Homebrew put it here on OSX
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion
[ -f /usr/local/share/bash-completion/bash_completion ] && source /usr/local/share/bash-completion/bash_completion
