export LANG=en_us.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export EDITOR=vim
export TERM=xterm-256color

alias ls='ls --color'
alias lsd='ls -d --color */'
alias vi='vim'
alias ll='ls --color -l'
alias rmqrtn='xattr -d com.apple.quarantine'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# shellcheck source=/dev/null
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
