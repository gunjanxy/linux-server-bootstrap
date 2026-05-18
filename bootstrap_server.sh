#!/bin/bash 

set -e 

echo "======================================" 
echo " Linux Server Bootstrap Automation" 
echo "======================================" 

echo "" 
echo "Running nginx installation script..." 

bash scripts/install_nginx.sh echo "" 

echo "Bootstrap completed successfully."