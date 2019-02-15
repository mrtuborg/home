# HomeBrew in home directory
##############################
export PATH=${HOME}/brew/bin:${PATH}
export PATH="$(brew --prefix)/sbin:${PATH}"

export HISTFILE="${HOME}/.tty_history_$(basename $(tty))"

notify() {
	osascript -e "display notification \"$2\" with title \"$1\"";
	spotifyPause $3
}


## DELETE? export PATH="/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
## DELETE? export MANPATH="/usr/local/opt/findutils/libexec/gnuman:/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
## DELETE? export PATH="/usr/local/opt/pcsc-lite/bin:$PATH"
## DELETE? export PATH="/usr/local/opt/pcsc-lite/sbin:$PATH"
## DELETE? export PATH="/usr/local/opt/openssl/bin:$PATH"
## DELETE? PATH=${PATH}:/usr/local/Cellar/volatility/2.6_1/bin
## DELETE? export PATH="/usr/local/opt/texinfo/bin:$PATH"


# PlantUML
###########
export PATH=${PATH}:/usr/local/Cellar/plantuml/1.2018.9/bin

# Git customization
#####################
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.lg-ascii "log --graph --pretty=format:'%h -%d %s (%cr) <%an>' --abbrev-commit"

# JAVA
#########
export JAVA_HOME=$(/usr/libexec/java_home)

# GOLANG
##########
export GOPATH="${HOME}/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="${HOME}/bin:${PATH}:${GOPATH}/bin:${GOROOT}/bin"
export PATH=${PATH}:/usr/local/opt/go/libexec/bin:${HOME}/go/bin

# VirtualBox
#############

alias showvm="VBoxManage showvminfo "
alias startvm="VBoxManage startvm --type headless "
alias listvm="VBoxManage list vms "

stopvm() {
        VBoxManage controlvm $@ poweroff;
}

# VS Code
###########
export PATH="${PATH}:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Aliases
###########
alias di="docker image"
alias dc="docker container"
alias dv="docker volume"
alias dn="docker network"

alias gs="git status"
alias gsc="git rev-parse --short HEAD"
alias gsb="git branch -avv"

alias fzf="fzf -m"
alias glog="git lg | fzf"

alias dcdown="docker-compose down --rmi all --remove-orphans"
alias dcup="docker-compose up --build"

alias ussh="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "

## node_path() {
## 	export PATH="/usr/bin:/usr/local/opt/node@8/bin:$PATH"
## }
## 
## export PATH="/usr/local/opt/icu4c/bin:$PATH"
## export PATH="/usr/local/opt/icu4c/sbin:$PATH"
## export NODE_BINARY="/usr/local/opt/node@8/bin/node"

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

