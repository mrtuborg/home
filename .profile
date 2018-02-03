SDK_ver=2.1.3
poky_sdk_dir=${HOME}/sdk/${SDK_ver}
pwd_alias() { echo "$PWD" ;}
      cwd() { basename $(pwd_alias); }
     dock() { docker run -it -v${poky_sdk_dir}:/opt/poky/${SDK_ver} \
                                              -v $(pwd_alias)/..:/ws \
                             -w /ws/$(cwd) --env-file ${HOME}/fedora-23-dev.2.1.3.env fedora-23-dev $@; }



dock_volume() { docker volume create --name myvolume; \
                docker run -it --rm -v myvolume:/workdir busybox chown -R 1000:1000 /workdir }
# docker network create yocto_network
toaster_dock() { docker run -it --name=bitbake_server --rm -p 127.0.0.1:18000:8000 -p 127.0.0.1:18001:8001 \
                              -v $(pwd_alias)/..:/workdir \
                              -v ${HOME}/.ssh:/home/usersetup/.ssh \
			      --workdir /workdir/$(cwd) \
                              crops/toaster:Dockerfile.ubuntu ;  }

# docker create -t -p 445:445 --name samba -v myvolume:/workdir crops/samba
samba_dock() { docker start samba && sudo ifconfig lo0 127.0.0.2 alias up; } 
# mount -t smbfs //GUEST@127.0.0.2/workdir ; }
yocto_dock() { docker run -it --rm --name=bitbake_client -v $(pwd_alias)/..:/ws -v myvolume:/workdir -v ${HOME}/.ssh:/home/yoctouser/.ssh --workdir=/workdir crops/yocto:fedora-27-base $@; }

 poky_dock() { mkdir -p $(pwd_alias)/../poky_tmp; docker run -it --rm --name=poky -p 127.0.0.1:12340:1234 \
                              -v $(pwd_alias)/..:/ws \
			      -v myvolume:/workdir \
                              crops/poky:fedora-27 --workdir=/ws/$(cwd) --cmd $@; }


export PATH="${HOME}/bin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

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

