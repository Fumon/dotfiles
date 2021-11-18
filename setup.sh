#!/bin/sh

dt=${HOME}/dotfiles

# Initialize any submodules
git submodule update --init --recursive

# Binaries
. bin/setup.sh

# Shell config
. zsh/setup.sh

# Windowmgmt
# TODO: Gate on interactive mac

#. windowmgt/macos/setup.sh
