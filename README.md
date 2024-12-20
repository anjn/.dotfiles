```
sudo apt install ansible-core

sudo ansible-playbook -i inventory.yml ./playbook/root/*.yml
ansible-playbook -i inventory.yml ./playbook/user/*.yml

sudo ansible-playbook -i inventory.yml ./playbook/root/utils-tui.yml
sudo ansible-playbook -i inventory.yml ./playbook/root/neovim.yml
ansible-playbook -i inventory.yml ./playbook/user/config.yml
ansible-playbook -i inventory.yml ./playbook/user/neovim.yml

nvim
  :JetpackSync

```

