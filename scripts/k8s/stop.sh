#!/bin/bash

echo -e "\033[1;36m==================================================\033[0m"
echo -e "\033[1;31m        STOPPING KUBERNETES CLUSTER\033[0m"
echo -e "\033[1;36m==================================================\033[0m"

minikube stop

echo -e "\n\033[1;32mCLUSTER STOPPED\033[0m"
echo -e "Docker containers associated with K8s have been paused."
echo -e "\033[1;36m==================================================\033[0m"
