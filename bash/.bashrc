export LANG=en_us.UTF-8
export EDITOR=vim
export TERM=xterm-256color

alias lsd='ls -d --color */'
alias vi='vim'
alias ll='ls -l'
alias rmqrtn='xattr -d com.apple.quarantine' 

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "~/.sdkman/bin/sdkman-init.sh" && -z $(which sdkman-init.sh | grep '/sdkman-init.sh') ]] && source "~/.sdkman/bin/sdkman-init.sh"
