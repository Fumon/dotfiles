#!/bin/sh

dt=${HOME}/dotfiles

# Initialize any submodules
git submodule update --init --recursive

# Binaries
. bin/setup.sh

# Shell config
. zsh/setup.sh
