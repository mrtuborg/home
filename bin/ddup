# $1 - source file
# $2 - destination device

[ -z "$1" ] && echo "Specify source file as 1st argument" && exit
[ -z "$2" ] && echo "Specify destination file as a 2nd argument" && exit

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if [[ "${1}" == "http://"* ]]; then
   wget --no-proxy ${1}
   file="$(basename ${1})"   
   [[ "${file##*.}" == "gz" ]] && echo "Extracting gz..." && gunzip "${file}"    
   file="${file%.*}"
else
   file=${1}
   echo "file: ${file}, extension: ${file##*.}"
   [[ "${file##*.}"    == "gz"  ]] && echo "Extracting gz..." && gunzip "${file}" && file="${file%.*}"
   echo "unzipped: ${file}, extension: ${file##*.}"
   [[ "${file##*.}" == "wic" ]] && extra_options="iflag=fullblock conv=fsync"
fi

diskutil list $2
read -p "Are you sure? " -n 1 -r
echo   
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

set -x
diskutil umountDisk $2
pv ${file} | dd of=$2 bs=1M ${extra_options}
diskutil umountDisk $2
set +x
