#!/bin/zsh

curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
filebrowser config set --auth.method=noauth
filebrowser -p 8222 -r .

# open new local terminal
# ssh -p X root@sshX.vast.ai -L 8222:localhost:8222
# open http://127.0.0.1:8222/ in local browser