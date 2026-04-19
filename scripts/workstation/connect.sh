#!/bin/bash
RG="respondlyai-rg"
VM="dev-workstation"
ADMIN_USER="respondlyai-dev"
KEY_PATH="../../dev-workstation_key.pem"

echo -e "\033[1;33mLocating server IP...\033[0m"
IP=$(az vm show -d -g "$RG" -n "$VM" --query publicIps -o tsv)

if [ -z "$IP" ]; then
    echo -e "\033[1;31mError: Could not find an IP address. Is the VM turned on? Run ./start.sh first.\033[0m"
    exit 1
fi

echo -e "\033[1;32mConnecting to $IP...\033[0m"
# The 'exec' command replaces the current script process with the SSH process
exec ssh -i "$KEY_PATH" "$ADMIN_USER@$IP"
