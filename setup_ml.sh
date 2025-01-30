#!/bin/zsh

source ~/.zshrc
mm create -n ml python=3.8 jupyter ipykernel nb_conda_kernels -y
micromamba activate ml

python -m ipykernel install --user --name ai --display-name "ai"

jupyter notebook --no-browser --port=8118 --allow-root
