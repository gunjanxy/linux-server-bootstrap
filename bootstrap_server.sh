#!/bin/bash
echo "Updating system..."
sudo apt update
echo "Installing nginx..."
sudo apt install -y nginx
echo "Starting nginx..."
sudo systemctl enable nginx
sudo systemctl start nginx
echo "Bootstrap complete!"