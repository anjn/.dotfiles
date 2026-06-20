```
sudo apt install curl git ansible-core

curl https://mise.run | sh

echo "eval \"\$($HOME/.local/bin/mise activate bash)\"" >> ~/.bashrc
source ~/.bashrc

mise use -g rust
mise use -g uv

git clone git@github.com:anjn/.dotfiles.git
or
git clone https://github.com/anjn/.dotfiles.git

cd .dotfiles

sudo ansible-playbook -i inventory.yml ./playbook/root/utils-tui.yml
sudo ansible-playbook -i inventory.yml ./playbook/root/neovim.yml
ansible-playbook -i inventory.yml ./playbook/user/neovim.yml
ansible-playbook -i inventory.yml ./playbook/user/shell.yml
ansible-playbook -i inventory.yml ./playbook/user/config.yml

source ~/.bashrc

#optional
sudo ansible-playbook -i inventory.yml ./playbook/root/utils-fs.yml
sudo ansible-playbook -i inventory.yml ./playbook/root/chrome.yml
sudo ansible-playbook -i inventory.yml ./playbook/root/sway.yml

#ime
sudo ansible-playbook -i inventory.yml ./playbook/root/ime.yml
Add 'Fcitx 5' to Startup Applications using Tweaks app
Logout and login, open Fcitx 5 config, Add Mozc in input method tab
Disable a keyboard shortcut named "Switch windows of an application"
Add Alt+` hotkey to toggle input method
Set display scale 100%

#font
sudo ansible-playbook -i inventory.yml ./playbook/root/fonts.yml
https://fonts.google.com/share?selection.family=Noto+Sans+JP:wght@100..900|Noto+Serif+JP:wght@200..900
sudo mkdir /usr/share/fonts/noto
sudo mv Noto_Sans_JP Noto_Serif_JP/ /usr/share/fonts/noto/
sudo fc-cache -vf
```


```
atuin import bash

nvim
  :JetpackSync
```
