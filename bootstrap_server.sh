#!/bin/bash 

set -e 

echo "======================================" 
echo " Linux Server Bootstrap Automation" 
echo "======================================" 

echo "" 
echo "Running user setup..." 

bash scripts/user_setup.sh 

echo "" 
echo "Running nginx installation..." 

bash scripts/install_nginx.sh 

echo "" 
echo "Running Docker installation..."

bash scripts/install_docker.sh
 
echo "" 
echo "Bootstrap completed successfully."