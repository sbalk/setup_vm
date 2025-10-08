#!/bin/zsh

source ~/.zshrc
mm create -n ai python=3.8 jupyter ipykernel nb_conda_kernels -y
micromamba activate ai

python -m ipykernel install --user --name ai --display-name "ai"

jupyter notebook --no-browser --port=8333 --allow-root

# open new local terminal
# ssh -p X root@sshX.vast.ai -L 8333:localhost:8333
# open http://127.0.0.1:8333/ in local browser