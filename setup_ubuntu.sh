#!/bin/bash

# Setup script for Ubuntu
echo 'Installing zsh and nano...'
sudo apt-get install zsh -y
sudo apt-get install nano -y

echo 'Changing default shell to zsh...'
chsh -s $(which zsh)

echo 'Installing Oh My Zsh...'
# Install Oh My Zsh unattended using zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh -s -- --unattended

echo 'Installing micromamba...'
# Install micromamba using zsh
zsh <(curl -L micro.mamba.pm/install.sh) </dev/null
source ~/.zshrc

echo 'Adding aliases to ~/.zshrc...'
cat << 'EOF' >> ~/.zshrc

# Micromamba aliases
alias mm='micromamba'
alias mma='mm activate'
alias mmi='mm install -c conda-forge'
alias mmremove='mm env remove -n'  # might need to use --all
alias mml='mm env list'
alias mmd='mm deactivate'

# Git aliases
alias gs='git status'
alias gp='git push'
alias gcam='git commit -am'
alias gcm='git commit -m'

EOF

echo 'Setup complete. Please log out and log back in to start using zsh as your default shell.'
