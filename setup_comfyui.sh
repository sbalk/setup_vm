#!/bin/zsh

# apt-get install libgl1 -y.

source ~/.zshrc
mm create -n ai python=3.11 -y
mm activate ai

pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu124

git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt

cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
git clone https://github.com/crystian/ComfyUI-Crystools.git
git clone https://github.com/rgthree/rgthree-comfy.git
git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git
cd ..

pip install comfy-cli
comfy --install-completion
# comfy model download --url https://huggingface.co/mcmonkey/google_t5-v1_1-xxl_encoderonly

python main.py --port=8111

# open new local terminal
# ssh -p X root@sshX.vast.ai -L 8111:localhost:8111
# open http://127.0.0.1:8111/ in local browser

