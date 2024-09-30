#!/bin/bash

# Setup script for Ubuntu
echo 'Installing zsh and nano...'
sudo apt-get install zsh -y
sudo apt-get install nano -y
sudo apt-get install ffmpeg -y

# Set scrolling on for tmux
echo "set -g mouse on" >> ~/.tmux.conf

# Change zsh to default shell
echo 'Changing default shell to zsh...'
chsh -s $(which zsh)
