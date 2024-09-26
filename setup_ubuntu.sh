#!/bin/bash

# Setup script for Ubuntu
echo 'Installing zsh and nano...'
sudo apt-get install zsh -y
sudo apt-get install nano -y

echo 'Changing default shell to zsh...'
chsh -s $(which zsh)

# Switch to zsh
zsh << EOF

echo 'Installing Oh My Zsh...'
# Install Oh My Zsh unattended
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'Installing micromamba...'
# Install micromamba using zsh
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
source ~/.zshrc
EOF

echo 'Adding aliases to ~/.zshrc...'
cat << 'EOF' >> ~/.zshrc

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/root/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/root/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

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
