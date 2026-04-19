#!/bin/bash

# Configuration Variables
RG="respondlyai-rg"
VM="dev-workstation"
ADMIN_USER="respondlyai-dev"
KEY_PATH="../dev-workstation_key.pem"

echo -e "\033[1;36m==================================================\033[0m"
echo -e "\033[1;32m     STARTING RESPONDLYAI CLOUD WORKSTATION\033[0m"
echo -e "\033[1;36m==================================================\033[0m"
echo -e "\033[1;33m[1/3]\033[0m Waking up virtual machine in Azure..."

# Start the VM
az vm start --resource-group "$RG" --name "$VM" > /dev/null

echo -e "\033[1;33m[2/3]\033[0m Fetching dynamic network configuration..."
# Get the IP Address
IP=$(az vm show -d -g "$RG" -n "$VM" --query publicIps -o tsv)

echo -e "\033[1;33m[3/3]\033[0m Retrieving hardware profile..."
# Get the VM Size
SIZE=$(az vm show -g "$RG" -n "$VM" --query hardwareProfile.vmSize -o tsv)

echo -e "\n\033[1;32mSYSTEM IS ONLINE\033[0m"
echo -e "--------------------------------------------------"
echo -e "\033[1mPublic IP\033[0m    : $IP"
echo -e "\033[1mHardware\033[0m     : $SIZE"
echo -e "\033[1mAdmin User\033[0m   : $ADMIN_USER"
echo -e "--------------------------------------------------"
echo -e "\033[1mYOUR EXACT SSH COMMAND:\033[0m"
echo -e "ssh -i $KEY_PATH $ADMIN_USER@$IP"
echo -e "\n\033[1;36mShare the IP ($IP) with your team!\033[0m"
echo -e "\033[1;36m==================================================\033[0m"
