#!/bin/bash
RG="respondlyai-rg"
VM="dev-workstation"

echo -e "\033[1;36m==================================================\033[0m"
echo -e "\033[1;31m     STOPPING RESPONDLYAI CLOUD WORKSTATION\033[0m"
echo -e "\033[1;36m==================================================\033[0m"
echo -e "\033[1;33mDeallocating hardware to pause billing...\033[0m"

az vm deallocate --resource-group "$RG" --name "$VM" > /dev/null

echo -e "\n\033[1;32mSERVER STOPPED\033[0m"
echo -e "Compute billing is now frozen."
echo -e "\033[1;36m==================================================\033[0m"
