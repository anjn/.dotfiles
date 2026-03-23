```
curl https://mise.run | sh
mise i

mise use rust -g rust
mise use uv

sudo ansible-playbook -i inventory.yml ./playbook/root/utils-tui.yml
sudo ansible-playbook -i inventory.yml ./playbook/root/neovim.yml
ansible-playbook -i inventory.yml ./playbook/user/config.yml
ansible-playbook -i inventory.yml ./playbook/user/neovim.yml

nvim
  :JetpackSync

```

