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
```


```
atuin import bash

nvim
  :JetpackSync
```
