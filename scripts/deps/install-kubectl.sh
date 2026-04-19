#!/bin/bash

# Download the latest release
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Install it to your system path
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Clean up the downloaded file
rm kubectl

