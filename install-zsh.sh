#!/usr/bin/bash

echo "Updating and install curl & git"
sudo apt update && sudo apt install curl git -y

echo "Installing zsh"
sudo apt install zsh -y

echo "Installing exa"
sudo apt install exa -y

echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Getting PowerLevel10k"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "Getting zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Getting zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Moving .zshrc to ~"
mv .zshrc ~/.zshrc

echo "Setting zsh as default shell"
chsh -s /usr/bin/zsh

echo "All done, log out and log in again to make changes take effect"
