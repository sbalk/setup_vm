#!/bin/zsh

echo 'Installing Oh My Zsh...'
# Install Oh My Zsh unattended
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo 'Installing micromamba...'
# Set the necessary environment variables
export BIN_FOLDER="${HOME}/.local/bin"
export INIT_YES="yes"
export CONDA_FORGE_YES="yes"
export PREFIX_LOCATION="${HOME}/micromamba"
# Install micromamba using zsh
sh <(curl -L micro.mamba.pm/install.sh)  </dev/null
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

# Add mamba to path because above doesn't work for scripts
export PATH=$PATH:/root/.local/bin/

EOF

echo 'Setup complete. Please log out and log back in to start using zsh as your default shell.'
