export LANG=en_us.UTF-8

alias lsd='ls -d --color */'
alias vi='vim'
alias ll='ls -l'
alias rmqrtn='xattr -d com.apple.quarantine' 

# for pyenv
eval "$(pyenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "~/.sdkman/bin/sdkman-init.sh" && -z $(which sdkman-init.sh | grep '/sdkman-init.sh') ]] && source "~/.sdkman/bin/sdkman-init.sh"