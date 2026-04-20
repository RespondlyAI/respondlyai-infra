#!/bin/bash

echo -e "\033[1;36m==================================================\033[0m"
echo -e "\033[1;35m    GENERATING PUBLIC API TUNNEL (CLOUDFLARE)\033[0m"
echo -e "\033[1;36m==================================================\033[0m"

# Get the internal Minikube IP
MINIKUBE_IP=$(minikube ip)

if [ -z "$MINIKUBE_IP" ]; then
    echo -e "\033[1;31m❌ Error: Minikube is not running. Start the cluster first.\033[0m"
    exit 1
fi

echo -e "\033[1;33m[1/2] Locating Minikube Ingress Gateway...\033[0m"
echo -e "      Found Ingress at: \033[1m$MINIKUBE_IP:80\033[0m"

echo -e "\033[1;33m[2/2] Requesting secure public URL from Cloudflare...\033[0m"
echo -e "\n\033[1;32mTUNNEL IS ACTIVE\033[0m"
echo -e "--------------------------------------------------"
echo -e "Look for the URL ending in \033[1m.trycloudflare.com\033[0m below."
echo -e "Append \033[1m/swagger-ui.html\033[0m to the URL and share it with your team."
echo -e "Press \033[1mCtrl+C\033[0m to destroy the tunnel when finished."
echo -e "--------------------------------------------------"

# Start the tunnel pointing to Minikube's port 80
cloudflared tunnel --url http://$MINIKUBE_IP:80
