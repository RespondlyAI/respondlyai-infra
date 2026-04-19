#!/bin/bash

# Configuration
CPUS=3
MEMORY=12288

echo -e "\033[1;36m==================================================\033[0m"
echo -e "\033[1;32m     BOOTING KUBERNETES CLUSTER (MINIKUBE)\033[0m"
echo -e "\033[1;36m==================================================\033[0m"

# Boot the cluster with specific guardrails
echo -e "\033[1;33m[1/3] Provisioning Control Plane and Worker Nodes...\033[0m"
minikube start --cpus=$CPUS --memory=$MEMORY --driver=docker

# Enable essential addons
echo -e "\033[1;33m[2/3] Enabling Nginx Ingress Controller...\033[0m"
minikube addons enable ingress > /dev/null

echo -e "\033[1;33m[3/3] Verifying Cluster Health...\033[0m"
kubectl get nodes

echo -e "\n\033[1;32mKUBERNETES IS READY\033[0m"
echo -e "You can now apply your YAML manifests."
echo -e "\033[1;36m==================================================\033[0m"
