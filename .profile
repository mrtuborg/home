## export GOROOT=${HOME}/go
## export GOPATH=${GOROOT}/packages

export GOPATH=${HOME}/go
export PATH=$PATH:${GOPATH}/bin

notify() {
	osascript -e "display notification \"$2\" with title \"$1\"";
	spotifyPause $3
}

export PATH="/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PATH="/usr/local/opt/pcsc-lite/bin:$PATH"
export PATH="/usr/local/opt/pcsc-lite/sbin:$PATH"

git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.lg-ascii "log --graph --pretty=format:'%h -%d %s (%cr) <%an>' --abbrev-commit"

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

export PATH="/usr/local/opt/libiconv/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$(brew --prefix)/sbin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"

HISTFILE="${HOME}/.tty_history_$(basename $(tty))"

export PATH="/usr/local/toolchains/gcc-arm-atsam4e-eabi/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

export JAVA_HOME=`/usr/libexec/java_home`

PATH=${PATH}:/usr/local/Cellar/volatility/2.6_1/bin
export PATH="/usr/local/opt/texinfo/bin:$PATH"
export PATH=${PATH}:/usr/local/Cellar/plantuml/1.2018.9/bin
export PATH=${HOME}/bin:${PATH}

export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

alias ussh="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "
alias showvm="VBoxManage showvminfo "
alias startvm="VBoxManage startvm --type headless "
alias listvm="VBoxManage list vms "

stopvm() {
 	VBoxManage controlvm $@ poweroff;
}

showvm_ip() {
    VBoxManage guestproperty get $@ "/VirtualBox/GuestInfo/Net/0/V4/IP"
}

export PATH=${PATH}:/usr/local/opt/go/libexec/bin:${HOME}/go/bin
export PATH=${PATH}:${HOME}/go/src/github.com/privacybydesign/irmago

node_path() {
	export PATH="/usr/bin:/usr/local/opt/node@8/bin:$PATH"
}

use_gnu_gcc() {
    export CC=/usr/local/bin/gcc-8
    export CXX=/usr/local/bin/g++-8
    export CPP=/usr/local/bin/cpp-8
    export LD=/usr/local/bin/gcc-8
    
    alias c++=/usr/local/bin/c++-8
    alias g++=/usr/local/bin/g++-8
    alias gcc=/usr/local/bin/gcc-8
    alias cpp=/usr/local/bin/cpp-8
    alias ld=/usr/local/bin/gcc-8
    alias cc=/usr/local/bin/gcc-8
    alias find=/usr/local/bin/gfind
    alias ar=libtool -static -a -o
}

use_apple_gcc()
{
    export CC=/usr/bin/gcc
    export CXX=/usr/bin/g++
    export CPP=/usr/bin/cpp
    export LD=/usr/bin/ld

    alias c++=/usr/bin/c++
    alias g++=/usr/bin/g++
    alias gcc=/usr/bin/gcc
    alias cpp=/usr/bin/cpp
    alias cc=/usr/bin/gcc
    alias ld=/usr/bin/ld
    alias find=/usr/bin/find
}

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

export NODE_BINARY="/usr/local/opt/node@8/bin/node"

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

export PATH="${PATH}:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="${PATH}:/Users/vn/.cargo/bin"
# export PATH="/usr/bin:${PATH}"

alias meld="/Applications/Meld.app/Contents/MacOS/Meld"
alias lldb="PATH=/usr/bin /usr/bin/lldb"

dock_shell()
{
    docker run -it $1 $2
}

dock_attach()
{
     docker exec -it $1 /bin/bash
}

# alias tmux="tmux source-file ~/bin/tmux.conf"

export PATH="/opt/metasploit-framework/bin:${PATH}"

