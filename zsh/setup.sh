#!/bin/sh

# ZSH setup

ln -s ${dt}/zsh/.zshrc ${HOME}/.zshrc

# --- Setup neccessary directories and files

if [ -e ${HOME}/.config/zsh ]; then
    mkdir -p ${HOME}/.config/zsh
fi

if [ -e ${HOME}/.cache/zsh ]; then
    mkdir -p ${HOME}/.cache/zsh
fi
