SDK_ver=2.1.3
poky_sdk_dir=${HOME}/sdk/${SDK_ver}
pwd_alias() { echo "$PWD" ;}
      cwd() { basename $(pwd_alias); }
     dock() { docker run -it -v${poky_sdk_dir}:/opt/poky/${SDK_ver} \
                                              -v $(pwd_alias)/..:/ws \
                             -w /ws/$(cwd) --env-file ${HOME}/fedora-23-dev.2.1.3.env fedora-23-dev $@; }



dock_volume() { docker volume create --name myvolume; \
                docker run -it --rm -v myvolume:/workdir busybox chown -R 1000:1000 /workdir }

toaster_dock() { docker run -it --rm -p 127.0.0.1:18000:8000 -v myvolume:/workdir -v ${HOME}/.ssh:/home/toasteruser/.ssh toaster }
samba_dock() { docker start samba && sudo ifconfig lo0 127.0.0.2 alias up }
yocto_dock() { docker run -it --rm -v myvolume:/workdir -v ${HOME}/.ssh:/home/yoctouser/.ssh --workdir=/workdir crops/yocto:ubuntu-16.04-base $@; }

export PATH="/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
