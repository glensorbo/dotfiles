#!/usr/bin/bash

sudo apt remove fprintd
sudo add-apt-repository ppa:uunicorn/open-fprintd
sudo apt-get update
sudo apt-get install fprintd libfprint-2-2 libpam-fprintd

echo "fprint-enroll should be available now. Enroll your fingerprint and then run 'sudo pam-auth-update' after"
