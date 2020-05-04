#!/usr/bin/env bash

# Vim
ln -s "$(pwd)/.vimrc" ~/.vimrc
ln -s "$(pwd)/vim" ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Zsh
ln -s "$(pwd)/.zshrc" ~/.zshrc
