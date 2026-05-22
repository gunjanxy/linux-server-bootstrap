#!/bin/bash

set -e

echo "======================================"
echo " Fail2Ban Setup"
echo "======================================"

echo ""
echo "[1/5] Updating package list..."

sudo apt update

echo ""
echo "[2/5] Installing Fail2Ban..."

sudo apt install -y fail2ban

echo ""
echo "[3/5] Creating local jail configuration..."

sudo bash -c 'cat > /etc/fail2ban/jail.local <<EOF
[DEFAULT]
bantime = 10m
findtime = 10m
maxretry = 5

[sshd]
enabled = true
port = 22
EOF'

echo ""
echo "[4/5] Restarting Fail2Ban service..."

sudo systemctl restart fail2ban

echo ""
echo "[5/5] Enabling Fail2Ban..."

sudo systemctl enable fail2ban


echo ""
echo "Fail2Ban setup completed successfully!"