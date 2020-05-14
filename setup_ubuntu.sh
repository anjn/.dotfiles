#!/usr/bin/env bash
set -xe

dir=$(dirname $(readlink -f $0))

# sudo apt update
# sudo apt upgrade -y
# sudo apt install -y git
# git clone https://github.com/anjn/.dotfiles.git

mkdir -p ~/tmp
cd ~/tmp

# ## Regolith Linux
# sudo add-apt-repository -y ppa://kgilmer/regolith-stable
# sudo apt update
# sudo apt install -y regolith-desktop

# TODO
# cp /etc/regolith/styles/root ~/.Xresources-regolith
# mkdir -p ~/.Xresources.d
# cp /etc/regolith/styles/* ~/.Xresources.d
# mkdir -p ~/.config/regolith
# cp -r /etc/regolith/i3* ~/.config/regolith

# Replace backend: https://github.com/chjj/compton/issues/152
# sudo sed -i 's/backend = "glx"/backend = "xrender"/' /etc/regolith/compton/config

# sudo apt install -y tree

# 
# sudo apt install -y build-essential valgrind
# sudo apt install -y htop keepass2 fio hddtemp smartmontools
# 
# sudo add-apt-repository -y ppa:alessandro-strada/ppa
# sudo apt update
# sudo apt install -y google-drive-ocamlfuse
# google-drive-ocamlfuse
# mkdir GoogleDrive
# google-drive-ocamlfuse GoogleDrive
# 
# # Linuxbrew
# sudo apt install -y linuxbrew-wrapper
# brew
# echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> ~/.bash_profile
# echo 'export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"' >> ~/.bash_profile
# echo 'export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"' >> ~/.bash_profile
# 
# wget https://repo.steampowered.com/steam/archive/precise/steam_latest.deb
# sudo apt install -y steam_latest.deb

# wget https://github.com/miiton/Cica/releases/download/v5.0.1/Cica_v5.0.1_with_emoji.zip
# unzip Cica_*.zip
# mkdir -p ~/.fonts  
# mv Cica-*.ttf ~/.fonts
# sudo fc-cache -fv  
# rm -f Cica_*.zip  

# sudo apt install -y tmux
# cp $dir/home_ubuntu/.tmux.conf $HOME

# # Neovim
# sudo apt-get install -y software-properties-common
# sudo add-apt-repository -y ppa:neovim-ppa/unstable
# sudo apt-get update
# sudo apt-get install -y neovim xsel
# rm -rf $HOME/.config/nvim
# ln -s $dir/home_ubuntu/.config/nvim $HOME/.config/nvim
# curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# sh ./installer.sh ~/.cache/dein

# cat $dir/home_ubuntu/.bashrc_history >> $HOME/.bashrc
# echo "export PATH=\$HOME/bin:\$PATH" >> $HOME/.bashrc

# peco
# wget https://github.com/peco/peco/releases/download/v0.5.7/peco_linux_amd64.tar.gz
# tar xf peco_linux_amd64.tar.gz
# mkdir -p $HOME/bin
# cp peco_linux_amd64/peco $HOME/bin

# # git config --global user.name ""
# # git config --global user.email 
# wget https://gist.githubusercontent.com/anjn/650e64455b3d20bbf0d9e96138a4d000/raw/2e4817e53954954bf80bf1ebf7f99e2cb232fe18/.gitconfg
# cp .gitconfg $HOME/.gitconfig

# IME
# sudo apt install fcitx-mozc
# # Restart, Add 'Mozc' to input method list

# enhancd
if [ ! -e ~/.cache/enhancd ] ; then
  pushd ~/.cache
  git clone https://github.com/b4b4r07/enhancd
  echo "source ~/.cache/enhancd/init.sh"  >> ~/.bash_profile
  popd
fi

