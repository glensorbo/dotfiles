#!/bin/bash

sudo mkdir -p /opt/stacks /opt/dockge

sudo chown -R $USER:$USER /opt/stacks
sudo chown -R $USER:$USER /opt/dockge

cp dockge.yaml /opt/dockge/compose.yaml

cd /opt/dockge && docker compose up -d

