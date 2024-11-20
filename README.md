# dotfiles

## Bootstrap

1. Install [Ansible][ansible-installation]
2. Run:

    ```shell
    git clone git@github.com:kirillmorozov/dotfiles.git \
      && cd dotfiles \
      && ansible-playbook --ask-become-pass bootstrap.yml
    ```

## Bootstrap Vim only

Use this command to install vimrc on your machine:

```shell
curl https://raw.githubusercontent.com/kirillmorozov/dotfiles/main/vim/vimrc \
  -o ~/.vimrc
```

[ansible-installation]: https://docs.ansible.com/ansible/latest/installation_guide/index.html
