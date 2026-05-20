#!/bin/bash

set -e

echo "======================================"
echo " SSH Hardening"
echo "======================================"

SSH_CONFIG="/etc/ssh/sshd_config"
BACKUP_CONFIG="/etc/ssh/sshd_config.bak"

echo ""
echo "[1/7] Backing up SSH config..."

sudo cp "$SSH_CONFIG" "$BACKUP_CONFIG"

echo "Backup created at: $BACKUP_CONFIG"

echo ""
echo "[2/7] Changing SSH port to 2222..."

sudo sed -i 's/^#Port 22/Port 2222/' $SSH_CONFIG

echo ""
echo "[3/7] Disabling root login..."

sudo sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin no/' $SSH_CONFIG

echo ""
echo "[4/7] Checking if SSH keys are configured..."

if [ ! -d "$HOME/.ssh" ]; then
    echo "WARNING: No SSH keys detected!"
    echo "Password authentication should NOT be disabled yet."
else
    echo "SSH keys detected."
    
    echo ""
    echo "[5/7] Disabling password authentication..."

    sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' "$SSH_CONFIG"
fi

echo ""
echo "[6/7] Validating SSH configuration..."

sudo sshd -t

echo "SSH configuration is valid."

echo ""
echo "[7/7] Restarting SSH service..."


sudo systemctl restart ssh

echo ""
echo "SSH hardening completed!"
echo ""
echo "IMPORTANT:"
echo "Use the new SSH port:"
echo "ssh -p 2222 username@server"