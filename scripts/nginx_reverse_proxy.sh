#!/bin/bash

set -e

echo "======================================"
echo " Nginx Reverse Proxy Setup"
echo "======================================"

echo ""
echo "[1/5] Creating nginx reverse proxy config..."

sudo bash -c 'cat > /etc/nginx/sites-available/myapp <<EOF
server {
    listen 80;

    server_name localhost;

    location / {
        proxy_pass http://127.0.0.1:3000;

        proxy_http_version 1.1;

        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";

        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF'

echo ""
echo "[2/5] Enabling site..."

sudo ln -sf /etc/nginx/sites-available/myapp /etc/nginx/sites-enabled/

echo ""
echo "[3/5] Testing nginx configuration..."

sudo nginx -t

echo ""
echo "[4/5] Restarting nginx..."

sudo systemctl restart nginx

echo ""
echo "[5/5] Checking nginx status..."

sudo systemctl status nginx --no-pager

echo ""
echo "Nginx reverse proxy configured successfully!"
       