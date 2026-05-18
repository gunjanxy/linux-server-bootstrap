#!/bin/bash 

set -e 

echo "======================================" 
echo " Linux Server Bootstrap Automation" 
echo "======================================" 

echo "" 
echo "Running nginx installation script..." 

bash scripts/install_nginx.sh echo "" 
echo "" echo "Running Docker installation..."
 
bash scripts/install_docker.sh 

echo ""
echo "Bootstrap completed successfully."