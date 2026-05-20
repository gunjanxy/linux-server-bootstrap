set -e 
echo "======================================" 
echo " Firewall Setup" 
echo "======================================" 
echo "" 
echo "[1/5] Installing UFW..." 
sudo apt update 
sudo apt install -y ufw 
echo "" 
echo "[2/5] Setting default firewall policies..." 
sudo ufw default deny incoming 
sudo ufw default allow outgoing
echo "" 
echo "[3/5] Allowing SSH..." 
sudo ufw allow 22/tcp 
echo "" 
echo "[4/5] Allowing HTTP and HTTPS..." 
sudo ufw allow 80/tcp 
sudo ufw allow 443/tcp 
echo "" 
echo "[5/5] Enabling firewall..." 
# sudo ufw --force enable 
echo "" 
echo "Firewall configuration completed!"