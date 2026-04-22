#!/bin/bash

echo -e "\033[1;36m=====================================================\033[0m"
echo -e "\033[1;35m    GENERATING UNIFIED GATEWAY TUNNEL (CLOUDFLARE)\033[0m"
echo -e "\033[1;36m=====================================================\033[0m"

MINIKUBE_IP=$(minikube ip)

if [ -z "$MINIKUBE_IP" ]; then
    echo -e "\033[1;31m❌ Error: Minikube is not running. Start the cluster first.\033[0m"
    exit 1
fi

echo -e "\033[1;33m[1/2] Locating Nginx Edge Ingress...\033[0m"
echo -e "      Found Ingress at: \033[1m$MINIKUBE_IP:80\033[0m"

echo -e "\033[1;33m[2/2] Requesting secure public URL from Cloudflare...\033[0m"

LOGFILE=$(mktemp)

cloudflared tunnel --url http://$MINIKUBE_IP:80 > "$LOGFILE" 2>&1 &
TUNNEL_PID=$!

echo -e "      Waiting for tunnel to initialize..."
sleep 4

CF_URL=$(grep -o 'https://[-a-zA-Z0-9]*\.trycloudflare\.com' "$LOGFILE" | head -n 1)

trap "echo -e '\n\033[1;31mShutting down tunnel...\033[0m'; kill $TUNNEL_PID 2>/dev/null; rm -f $LOGFILE; exit 0" SIGINT SIGTERM

if [ -n "$CF_URL" ]; then
    echo -e "\n\033[1;32mTUNNEL IS ACTIVE\033[0m"
    echo -e "--------------------------------------------------"
    echo -e "Share this exact link with the frontend team:"
    echo -e " \033[1;36m${CF_URL}/swagger-ui.html\033[0m"
    echo -e "--------------------------------------------------"
    echo -e "Press \033[1mCtrl+C\033[0m to destroy the tunnel when finished."
else
    echo -e "\033[1;31m❌ Could not extract the Cloudflare URL. Here are the raw logs:\033[0m"
    cat "$LOGFILE"
fi

wait $TUNNEL_PID
