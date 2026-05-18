#!/bin/bash 
set -e echo "======================================" 
echo " Installing Docker" 
echo "======================================"
echo "" 
echo "[1/6] Removing old Docker versions..." 
sudo apt remove -y docker docker-engine docker.io containerd runc || true
echo "" 
echo "[2/6] Updating package list..." 
sudo apt update
echo "" echo "[3/6] Installing required packages..." 
sudo apt install -y \ 
ca-certificates \ 
curl \ 
gnupg
echo "" echo "[4/6] Adding Docker GPG key..." 
sudo install -m 0755 -d /etc/apt/keyrings 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \ 
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg 
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "" 
echo "[5/6] Adding Docker repository..." 
echo \ "deb [arch=$(dpkg --print-architecture) \ 
signed-by=/etc/apt/keyrings/docker.gpg] \ 
https://download.docker.com/linux/ubuntu \ 
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \ 
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update 
echo "" 
echo "[6/6] Installing Docker..." 
sudo apt install -y \ 
docker-ce \ 
docker-ce-cli \ 
containerd.io \ 
docker-buildx-plugin \ 
docker-compose-plugin
echo "" 
echo "Enabling Docker service..." 
sudo systemctl enable docker 
sudo systemctl start docker 
echo "" 
echo "Docker installation completed successfully!"