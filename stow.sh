#!/bin/bash

if [ -e "~/.zshrc" ]; then
	mv ~/.zshrc ~/.zshrc.bak
fi

stow . -t ~/
