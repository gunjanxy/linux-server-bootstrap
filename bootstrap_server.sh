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
echo "Running firewall setup..." 

bash scripts/firewall_setup.sh

echo ""
echo "Running SSH hardening..."

bash scripts/ssh_hardening.sh

echo ""
echo "Running Fail2Ban setup..."

bash scripts/fail2ban_setup.sh
 
echo "" 
echo "Bootstrap completed successfully."