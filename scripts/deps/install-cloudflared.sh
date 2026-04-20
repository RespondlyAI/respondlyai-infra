# Download the latest Linux package
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb

# Install it
sudo dpkg -i cloudflared.deb

# Clean up the installer file
rm cloudflared.deb
