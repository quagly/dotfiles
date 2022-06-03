#!/bin/bash

. ~/.bashrc

set -o vi

# pyenv
# either pyenv in git cloned in home or provided by system
if [ -e $HOME/.pyenv/bin/pyenv ] || type -P pyenv 2>&1 > /dev/null; then
  # ensure PYENV_VERSION environment vairable is not set so that
  # .python_version files and pyenv local and global settings are honored
  unset PYENV_VERSION
	export PYENV_VIRTUALENV_DISABLE_PROMPT=1
	export PATH="$HOME/.pyenv/bin:$PATH"
 	eval "$(pyenv init --path)"
  # note backslash \$() for updates
	export PS1="(\$(pyenv version-name)) \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[33;1m\]\w\[\033[m\]$ "
  # activate pyenv-virtualenv if exists in git cloned or provided by system
  if [ -e $(pyenv root)/.pyenv/plugins/pyenv-virtualenv ] || type -P pyenv-virtualenv 2>&1 > /dev/null; then
    # auto enable pyenv-virtualenv virtual envionments
    eval "$(pyenv virtualenv-init -)"
  fi
else
	export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[33;1m\]\w\[\033[m\]$ "
fi

# if I have my own bin add it to my path
# put it ahead of the system
# this allows me to use my own version of tools such as tmux
[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH

# if I have gnubin from coreutils install from homebrew
# prefer those binaries to osx installed binaries
[ -d /usr/local/opt/coreutils/libexec/gnubin ] && export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

# if I have qt then add to path
[ -d /usr/local/opt/qt/bin ] && export PATH=/usr/local/opt/qt/bin:$PATH

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# initialize bash completion if exists
# where else should I look?  MacPorts and Homebrew put it here on OSX
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion
[ -f /usr/local/share/bash-completion/bash_completion ] && source /usr/local/share/bash-completion/bash_completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# this probably needs more checks.  Does complete exist?  bundle with above bash completion check
AWS_COMPLETER=$(which aws_completer 2>/dev/null)
if [ -z ${AWS_COMPLETER} ]; then
  echo "no aws completer found aws cli completion not set"
else
  complete -C ${AWS_COMPLETER} aws
fi

# test if running in a container
# not sure how generally this will work
CGROUP='/proc/1/cgroup'
if [ -r $CGROUP ] && head -1 $CGROUP | grep --quiet docker; then
  if [ -r $HOME/.docker-extras/.databrickscfg ];then
    cp $HOME/.docker-extras/.databrickscfg $HOME/.databrickscfg
  fi
fi

# use local bashrc if it exists
[[ -s ~/.bashrc_local ]] && source ~/.bashrc_local

# ssh passwordless login to git if.gitconfig says so
if [[ -s ~/.gitconfig ]] && grep --fixed-strings --quiet '[url "ssh://git@github.com/"]' ~/.gitconfig; then
  ssh -T git@github.com
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR=~/.sdkman
[[ -s ~/.sdkman/bin/sdkman-init.sh ]] && source ~/.sdkman/bin/sdkman-init.sh
