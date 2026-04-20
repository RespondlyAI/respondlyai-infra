#!/bin/bash
RG="respondlyai-rg"
VM="dev-workstation"
ADMIN_USER="respondlyai-dev"
KEY_PATH="../../dev-workstation_key.pem"

echo -e "\033[1;33mLocating server IP...\033[0m"
IP=$(az vm show -d -g "$RG" -n "$VM" --query publicIps -o tsv)

if [ -z "$IP" ]; then
    echo -e "\033[1;31m❌ Error: Could not find an IP address. Run ./start-dev.sh first.\033[0m"
    exit 1
fi

echo -e "\033[1;32mConnecting to Cloud Workstation ($IP)...\033[0m"
# Pure SSH connection. No messy port forwarding.
exec ssh -i "$KEY_PATH" "$ADMIN_USER@$IP"
