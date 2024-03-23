#!/bin/bash

echo "Installing dependencies"
sudo apt update && sudo apt install curl gcc fuse libfuse2 unzip -y

echo "Getting nvim latest"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

echo "Setting permissions"
chmod u+x nvim.appimage

echo "Moving nvim into /usr/local/bin/nvim"
sudo mv nvim.appimage /usr/local/bin/nvim

echo "Copying nvim folder into ~/.config/"
mkdir -p ~/.config/nvim && cp -r config/* ~/.config/nvim/

echo "Setup complete, start hacking!"
