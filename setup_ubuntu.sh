#!/usr/bin/env bash
#set -xe
set -e

dir=$(dirname $(readlink -f $0))
dothome=$dir/home_ubuntu

# Update
sudo apt update
sudo apt upgrade -y

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

# Disable capslock
sudo sed -i 's/\(XKBOPTIONS\).*/\1="ctrl:nocaps"/' /etc/default/keyboard

# Git
apt_install git curl

# .dotfiles
if [[ ! -e ~/.dotfiles ]] ; then
  pushd ~
  git clone https://github.com/anjn/.dotfiles.git
  popd
fi

# python
apt_install python3-pip
pip3 install neovim

# Neovim
apt_install software-properties-common xsel
if not_installed neovim ; then
  sudo add-apt-repository -y ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get install -y neovim
fi
link_file .config/nvim
if [[ ! -e ~/.cache/dein ]] ; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  sh ./installer.sh ~/.cache/dein
fi

sudo update-alternatives --set editor /usr/bin/nvim || true
sudo apt purge -y nano || true

# Fonts
if [[ ! -e ~/.fonts/Cica-Regular.ttf ]] ; then
  wget https://github.com/miiton/Cica/releases/download/v5.0.2/Cica_v5.0.2_with_emoji.zip
  unzip Cica_*.zip
  mkdir -p ~/.fonts  
  mv Cica-*.ttf $HOME/.fonts
  sudo fc-cache -fv  
fi

# tmux
apt_install tmux
link_file .tmux.conf

# peco
if [[ ! -e $HOME/bin/peco ]] ; then
  wget https://github.com/peco/peco/releases/download/v0.5.7/peco_linux_amd64.tar.gz
  tar xf peco_linux_amd64.tar.gz
  mkdir -p $HOME/bin
  cp peco_linux_amd64/peco $HOME/bin
fi
link_file .config/peco

# IME
apt_install fcitx-mozc
# Restart, Add 'Mozc' to input method list

# enhancd
if [ ! -e ~/.cache/enhancd ] ; then
  pushd ~/.cache
  git clone https://github.com/b4b4r07/enhancd
  popd
fi
append_if_not_included $HOME/.bash_profile "source ~/.cache/enhancd/init.sh"

## Regolith Linux
if not_installed regolith-desktop-standard ; then
  sudo add-apt-repository -y ppa:regolith-linux/release
  sudo apt update
  sudo apt install -y regolith-desktop-standard

  #link_file .Xresources.d
  #link_file .Xresources-regolith
  #link_file .config/regolith

  # Replace backend: https://github.com/chjj/compton/issues/152
  #sudo sed -i 's/backend = "glx"/backend = "xrender"/' /etc/regolith/compton/config

  apt_install i3xrocks-battery

  mkdir -p ~/.config/regolith
  link_file .config/regolith/Xresources
fi

# Google Chrome
if not_installed google-chrome-stable ; then
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install -y ./google-chrome-stable_current_amd64.deb
fi

#apt_install gnome-icon-theme
apt_install tree
apt_install build-essential valgrind
apt_install htop keepass2 fio hddtemp smartmontools

# # Google drive
# if not_installed google-drive-ocamlfuse ; then
#   sudo add-apt-repository -y ppa:alessandro-strada/ppa
#   sudo apt update
#   sudo apt install -y google-drive-ocamlfuse
# fi
# 
# if [[ ! -e ~/GoogleDrive ]] ; then
#   google-drive-ocamlfuse
#   mkdir ~/GoogleDrive
# fi

# Linuxbrew
#if not_installed linuxbrew-wrapper ; then
#  sudo apt install -y linuxbrew-wrapper
#  brew
#  append_if_not_included $HOME/.bash_profile 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"'
#  append_if_not_included $HOME/.bash_profile 'export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"'
#  append_if_not_included $HOME/.bash_profile 'export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"'
#fi

#if not_installed steam-launcher ; then
#  wget https://repo.steampowered.com/steam/archive/precise/steam_latest.deb
#  sudo apt install -y ./steam_latest.deb
#fi

# imwheel
#apt_install imwheel
#link_file .imwheelrc
#link_file .config/autostart/imwheel.desktop

# # git config --global user.name ""
# # git config --global user.email 
if [ ! -e $HOME/.gitconfig ] ; then
  wget https://gist.githubusercontent.com/anjn/650e64455b3d20bbf0d9e96138a4d000/raw/2e4817e53954954bf80bf1ebf7f99e2cb232fe18/.gitconfg
  cp .gitconfg $HOME/.gitconfig
fi

# bashrc
append_if_not_included $HOME/.bashrc "source $dir/home_ubuntu/.bashrc"

# Vitis
apt_install opencl-headers

# nodejs
if ! which n ; then
  apt_install nodejs npm
  sudo npm install -g n
fi
sudo n lts
sudo apt purge -y nodejs npm || true
sudo apt autoremove -y
