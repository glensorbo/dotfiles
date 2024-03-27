#!/usr/bin/bash

echo "Getting PowerLevel10k"
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Getting zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Getting zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Copying .zshrc to ~"
mv ~/.zshrc ~/.zshrc-bak
cp zshrc ~/.zshrc

echo "Setting zsh as default shell"
chsh -s /usr/bin/zsh

echo "All done, log out and log in again to make changes take effect"
