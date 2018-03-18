# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="col"

# Example aliases
alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast bundler history-substring-search)

source $ZSH/oh-my-zsh.sh

# Hack fixes to an annoying issue that make me quote command parameters.
alias rake="noglob rake"
alias bundle="noglob bundle"

setopt no_share_history

# Customize to your needs...
#zstyle ':completion:*:functions' ignored-patterns '_*'

export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias gpr='git pull --rebase';
alias gs='git status';
alias ll='ls -la';

alias      timestamp="ruby -e \"require 'date'; puts Time.now.utc.to_datetime.xmlschema"\"
alias urlencodeparam="ruby -e \"require 'erb';  ARGF.each_line { | line | puts ERB::Util.url_encode(line.strip) }\""
alias      urldecode="ruby -e \"require 'uri';  ARGF.each_line { | line | puts URI.decode(line.strip) }\""
alias      localtime="ruby -e \"require 'date'; ARGF.each_line { | line | puts DateTime.parse(line.strip).to_time.localtime.to_datetime.xmlschema}\""
alias            utc="ruby -e \"require 'date'; ARGF.each_line { | line | puts DateTime.parse(line.strip).to_time.utc.to_datetime.xmlschema}\""

alias coinflip="[[ 0 -eq $(($RANDOM % 2)) ]] && echo 'tailz' || echo 'headz'"
alias coin_flip="[[ 0 -eq $(($RANDOM % 2)) ]] && echo 'tailz' || echo 'headz'"

alias flip_table='echo "(╯°□°)╯︵ ┻━┻"';
alias table_flip='echo "(╯°□°)╯︵ ┻━┻"';
alias ft='echo "(╯°□°)╯︵ ┻━┻"';
alias tf='echo "(╯°□°)╯︵ ┻━┻"';
alias rtf='echo "┬─┬ ノ( ^_^ノ)"';

alias timestamp='ruby -e "require \"date\"; puts DateTime.now.xmlschema"'

alias edir='each-dir'

# Gradle Alias'
alias updateDB='./gradlew updateDB && APP_ENVIRONMENT=test ./gradlew updateDB'
alias dropDB='./gradlew dropDB && APP_ENVIRONMENT=test ./gradlew dropDB'
alias start='./gradlew startServer'

# CDPATH
# export CDPATH='.:/Users/Col/Projects:/Users/Col/github'

# Usage: sshdel <line_number>
function sshdel { perl -i -n -e "print unless (\$. == $1)" ~/.ssh/known_hosts; }

# Go Lang
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=~/GoProjects

# AWS CLI
source /usr/local/share/zsh/site-functions/_aws

# Gradle
export GRADLE_HOME=/usr/local/opt/gradle/libexec

# Scala
export SCALA_HOME=/usr/local/Cellar/scala/2.11.8

# Go Lang
export GOPATH=~/GoProjects
export GOVERSION=$(brew list go | head -n 1 | cut -d '/' -f 6)
export GOROOT=$(brew --prefix)/Cellar/go/${GOVERSION}/libexec
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# GoJek
export GOJEK_HOME=~/GoJek
export PATH=$PATH:$GOJEK_HOME/scripts/start_gopay_services
export GOPOINTS_PATH=~/GoPoints
export GOBUY_PATH=~/GoBuy

# thefuck
#alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1 | tail -n 1)) && eval $TF_CMD && print -s $TF_CMD'
eval "$(thefuck --alias)"

# rbenv
export PATH="/Users/col/.rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
source '/usr/local/Cellar/rbenv/1.0.0/libexec/../completions/rbenv.zsh'
command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/Col/.gvm/bin/gvm-init.sh" ]] && source "/Users/Col/.gvm/bin/gvm-init.sh"
