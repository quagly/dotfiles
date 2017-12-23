#!/bin/bash

. ~/.bashrc

set -o vi

# pyenv
# either pyenv in git cloned in home or provided by system
if [ -e $HOME/.pyenv/bin/pyenv ] || type -P pyenv 2>&1 > /dev/null; then
	export PYENV_VIRTUALENV_DISABLE_PROMPT=1
	export PATH="$HOME/.pyenv/bin:$PATH"
 	eval "$(pyenv init - )"
	export PS1="($(pyenv version-name)) \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[33;1m\]\w\[\033[m\]$ "
  # activate pyenv-virtualenv if exists in git cloned or provided by system
  if [ -e $(pyenv root)/.pyenv/plugins/pyenv-virtualenv ] || type -P pyenv-virtualenv 2>&1 > /dev/null; then
    # auto enable pyenv-virtualenv virtual envionments
    eval "$(pyenv virtualenv-init -)"
  fi
else
	export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[33;1m\]\w\[\033[m\]$ "
fi


# if I have my on bin add it to my path
[ -d $HOME/bin ] && export PATH=$PATH:$HOME/bin

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# initialize bash completion if exists
# where else should I look?  MacPorts and Homebrew put it here on OSX
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion
[ -f /usr/local/share/bash-completion/bash_completion ] && source /usr/local/share/bash-completion/bash_completion

# use local bashrc if it exists
[[ -s ~/.bashrc_local ]] && source ~/.bashrc_local

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR=~/.sdkman
[[ -s ~/.sdkman/bin/sdkman-init.sh ]] && source ~/.sdkman/bin/sdkman-init.sh
