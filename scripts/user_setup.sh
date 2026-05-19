#!/bin/bash 

set -e 

echo "======================================" 
echo " User Setup Automation" 
echo "======================================" 

USERS=("deploy" "devops")

for user in "${USERS[@]}" 
do 
    echo "" 
    echo "Creating user: $user"
    
     if id "$user" &>/dev/null 
     then 
          echo "User already exists: $user" 
     else 
           sudo useradd -m -s /bin/bash "$user" 
           echo "Setting password for $user" 
           sudo passwd "$user" 
           echo "Adding $user to sudo group"
           sudo usermod -aG sudo "$user" 
           echo "User created successfully: $user" 
     fi 
done 
echo "" 
echo "User setup completed."