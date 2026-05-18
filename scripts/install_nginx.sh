#!/bin/bash 
set -e 
echo "Installing nginx..." 
sudo apt update 
sudo apt install -y nginx 
sudo systemctl enable nginx 
sudo systemctl start nginx 
echo "nginx installation complete."