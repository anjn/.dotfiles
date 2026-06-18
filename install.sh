#!/usr/bin/env bash

curl https://mise.run | sh

echo "eval \"\$($HOME/.local/bin/mise activate bash)\"" >> ~/.bashrc
source ~/.bashrc

# mise trust mise.toml

mise use -g rust
mise use -g uv

sudo ansible-playbook -i inventory.yml ./playbook/root/utils-tui.yml
sudo ansible-playbook -i inventory.yml ./playbook/root/neovim.yml
ansible-playbook -i inventory.yml ./playbook/user/neovim.yml
ansible-playbook -i inventory.yml ./playbook/user/shell.yml
ansible-playbook -i inventory.yml ./playbook/user/config.yml

source ~/.bashrc

