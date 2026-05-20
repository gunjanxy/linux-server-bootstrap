#!/bin/bash

set -e

echo "======================================"
echo " SSH Hardening"
echo "======================================"

SSH_CONFIG="/etc/ssh/sshd_config"

echo ""
echo "[1/5] Backing up SSH config..."

sudo cp $SSH_CONFIG ${SSH_CONFIG}.bak

echo ""
echo "[2/5] Changing SSH port to 2222..."

sudo sed -i 's/^#Port 22/Port 2222/' $SSH_CONFIG

echo ""
echo "[3/5] Disabling root login..."

sudo sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin no/' $SSH_CONFIG

echo ""
echo "[4/5] Disabling password authentication..."

sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' $SSH_CONFIG

echo ""
echo "[5/5] Restarting SSH service..."

sudo systemctl restart ssh

echo ""
echo "SSH hardening completed!"