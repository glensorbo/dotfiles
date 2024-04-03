#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install nfs-common

sudo mkdir /mnt/servers

sudo echo " " > /etc/fstab
sudo echo "truenas.local.lan:/mnt/store/servers /mnt/servers nfs defaults,rw 0 0" > /etc/fstab
