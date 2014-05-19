
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Add MySQL to the path
export PATH="$PATH:/usr/local/mysql/bin"

### Add node to the path
export PATH="/usr/local/share/npm/bin:$PATH"
export NODE_PATH="/usr/local/lib/node"

### Add users bin folder
export PATH="~/bin:$PATH"

export GPG_TTY='tty'

#
# Custom Aliases
#
alias b='bundle';
alias be='bundle exec';
alias gpr='git pull --rebase';
#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/charris/.gvm/bin/gvm-init.sh" ]] && source "/Users/charris/.gvm/bin/gvm-init.sh"
