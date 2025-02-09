#!/usr/bin/bash

sudo mkdir -p /usr/share/fonts/truetype/MesloNF
sudo cp ./MesloNF/* /usr/share/fonts/truetype/MesloNF
sudo fc-cache -fv
