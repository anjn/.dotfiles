dir=$(dirname $(readlink -f $0))
dothome=$dir/home

# Create tmp directory
tmp=$(mktemp -d)
function rm_tmp {
  [[ -e "$tmp" ]] && rm -rf "$tmp"
}
trap rm_tmp EXIT
trap 'trap - EXIT; rm_tmp; exit -1' INT PIPE TERM
cd $tmp

# List installed packages
installed=$tmp/installed
apt list --installed > $installed

# Utilities
function not_installed {
  ! grep -e "^$1/" $installed > /dev/null
}
function apt_install {
  for arg; do
    if not_installed $arg ; then
      echo Install: $arg
      sudo DEBIAN_FRONTEND=noninteractive apt install -y $arg > /dev/null
    fi
  done
}
function link_file {
  for src; do
    local srcdir=$(dirname $src)
    local src=$dothome/$src
    local dst=$HOME/$srcdir
    if [[ -d "$dst" ]] ; then
      dst="$dst/$(basename $src)"
    fi
    if [[ ! -e "$dst" ]] ; then
      echo Create link: $dst
      rm -f "$dst"
      ln -s "$src" "$dst"
    fi
  done
}
function not_included {
  ! grep "$2" "$1" > /dev/null
}
function append_string {
  local file="$1"
  local code="$2"
  echo Append: $file
  echo "$code" >> "$file"
}
function append_if_not_included {
  local file="$1"
  local code="$2"
  if not_included "$file" "$code" ; then
    append_string "$file" "$code"
  fi
}

