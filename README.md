# dotfiles

## Bootstrap

0. Install [Task][task]
1. Run:

    ```shell
    git clone git@github.com:kirillmorozov/dotfiles.git \
      && cd dotfiles \
      && task bootstrap
    ```

## Bootstrap Vim only

Use this command to install vimrc on your machine:

```shell
curl https://raw.githubusercontent.com/kirillmorozov/dotfiles/main/vim/.vimrc -o ~/.vimrc
```

[task]: https://taskfile.dev/installation/
