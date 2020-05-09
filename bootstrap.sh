#!/usr/bin/env bash

# Vim
ln -s "$(pwd)/.vimrc" ~/.vimrc
ln -s "$(pwd)/vim" ~/.vim
## Download plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Zsh
ln -s "$(pwd)/.zshrc" ~/.zshrc
## Download Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
