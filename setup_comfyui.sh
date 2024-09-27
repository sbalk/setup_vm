#!/bin/zsh

# apt-get install libgl1 -y.

source ~/.zshrc
mm create -n ai python -y
mm activate ai

pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu124

git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt

cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
cd ..

pip install comfy-cli
comfy --install-completion
# comfy model download --url https://huggingface.co/mcmonkey/google_t5-v1_1-xxl_encoderonly

python main.py

# open new local terminal
# ssh -p XXXX root@sshX.vast.ai -L 8188:localhost:8188
# open http://127.0.0.1:8188/ in local browser

