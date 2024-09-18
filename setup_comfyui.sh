#!/bin/zsh

echo "${SHELL}"

micromamba create -n ai python -y
micromamba activate ai

pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu124

git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt

cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
cd ..

python main.py

# open new local terminal
# ssh -p XXXX root@sshX.vast.ai -L 8188:localhost:8188
# open http://127.0.0.1:8188/ in local browser

