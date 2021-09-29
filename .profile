# Java
# export PATH="${HOME}/.jenv/bin:${PATH}"
# export JAVA_HOME=$(/usr/libexec/java_home)
# eval "$(jenv init -)"

# VirtualBox
#############

alias showvm="VBoxManage showvminfo "
alias startvm="VBoxManage startvm --type headless "
alias listvm="VBoxManage list vms "

stopvm() {
        VBoxManage controlvm $@ poweroff;
}

showvm_ip() {
    VBoxManage guestproperty get $@ "/VirtualBox/GuestInfo/Net/0/V4/IP"
}

# Homebrew
# GNUBIN make export PATH="/usr/local/opt/make/libexec/gnubin:${PATH}"
export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"

# LLVM
export PATH="/usr/local/opt/llvm/bin:${PATH}"
alias lldb="PATH=/usr/bin /usr/bin/lldb"

# Ruby
eval "$(rbenv init -)"
export PATH="/usr/local/opt/ruby/bin:${PATH}"
export PATH="${HOME}/.rbenv/shims:${PATH}"

# OpenSSL
export OPENSSL_ROOT_DIR=`brew --prefix openssl`

# Python
export PATH="/usr/local/opt:${PATH}"

# Localization
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Git
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.lg-ascii "log --graph --pretty=format:'%h -%d %s (%cr) <%an>' --abbrev-commit"
alias gs="git status"
alias submodule="git submodule"
alias clone="git clone"
alias push="git push"
alias log="git log"

cdgr() {
  cd $(git rev-parse --show-toplevel)
}

# Docker
alias di="docker image"
alias dc="docker container"
alias dv="docker volume"
alias dn="docker network"

alias dcdown="docker-compose down --rmi all --remove-orphans"
alias dcup="docker-compose up --build"

dock_shell()
{
    docker run -it $1 $2
}

dock_attach()
{
     docker exec -it $1 /bin/bash
}

alias ussh="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "

code() {
	/Applications/Visual\ Studio\ Code.app/contents/Resources/app/bin/code -g "$@"
}

meld_cleanup() {
	rm -rf ${HOME}/.local/share/meld
	rm -f ${HOME}/Library/Preferences/org.gnome.meld.plist
	rm -rf "${HOME}/Library/Saved Application State/org.gnome.meld.savedState/"
}

meld() {
	meld_cleanup
	/Applications/Meld.app/Contents/MacOS/Meld "$@" &
}

webStorm() {
	open -na "WebStorm.app" --args "$@"
}

intelliJ() {
        open -na "IntelliJ IDEA CE.app" --args "$@"
}

AndroidStudio() {
	open -a Android\ Studio "$@"
}
