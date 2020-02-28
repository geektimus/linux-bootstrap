export USERBIN=$HOME/.bin
export PATH=$PATH:$USERBIN

export JAVA_HOME=/usr/lib/jvm/default
export PATH=$PATH:$JAVA_HOME/bin

export SBT_HOME=/usr/local/share/development/sbt/latest
export PATH=$PATH:$SBT_HOME/bin

export HADOOP_HOME=/tmp/hadoop/

export AMMONITE_HOME=/usr/local/share/development/ammonite
export PATH=$PATH:$AMMONITE_HOME

export KUBECTL_HOME=/usr/local/share/development/kubernetes
export PATH=$PATH:$KUBECTL_HOME

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/geektimus/.sdkman"
[[ -s "/home/geektimus/.sdkman/bin/sdkman-init.sh" ]] && source "/home/geektimus/.sdkman/bin/sdkman-init.sh"

export GOPATH=$HOME/Projects/personal/language/go

export PATH=$PATH:$GOPATH/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Config location for bspwm
XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME
