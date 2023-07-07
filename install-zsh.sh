#!/usr/bin/bash

echo "Updating and install curl & exa"
sudo apt update && sudo apt install curl exa -y

echo "Installing zsh"
sudo apt install zsh -y

echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
