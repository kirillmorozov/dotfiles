#!/usr/bin/env bash

echo "Bootstraping dotfiles..."
# Vim
ln -s "$(pwd)/.vimrc" ~/.vimrc
ln -s "$(pwd)/vim" ~/.vim
echo "Done."
