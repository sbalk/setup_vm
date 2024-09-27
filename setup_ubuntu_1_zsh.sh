#!/bin/bash

# Setup script for Ubuntu
echo 'Installing zsh and nano...'
sudo apt-get install zsh -y
sudo apt-get install nano -y

echo 'Changing default shell to zsh...'
chsh -s $(which zsh)
