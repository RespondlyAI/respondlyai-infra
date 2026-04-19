#!/bin/bash

# Install Docker
sudo apt install -y docker.io

# Add your user to the Docker group
sudo usermod -aG docker $USER

# Activate the group change immediately (so you don't have to log out and log back in)
newgrp docker
