#!/bin/bash

if [ -e "~/.zshrc" ]; then
	rm ~/.zshrc
fi

stow . -t ~/
