#!/usr/bin/env bash
set -e
echo "======================================" 
echo " Linux Server Bootstrap Script" 
echo "======================================"

echo "" 
echo "[1/5] Updating package list..."
sudo apt update

echo ""
echo "[2/5] Installing nginx..." 
sudo apt install -y nginx 

echo ""
echo "[3/5] Installing curl and git..." 
sudo apt install -y curl git

echo ""
echo "[4/5] Enabling nginx service..." 
sudo systemctl enable nginx 

echo "" 
echo "[5/5] Starting nginx..." 
sudo systemctl start nginx

echo "" 
echo "======================================" 
echo " Bootstrap Complete" 
echo "======================================"