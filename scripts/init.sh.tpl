#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
echo "User data script is running"
sudo apt-get update -y
sudo apt-get install zip -y 
sudo apt-get install -y python3-pip
sudo pip3 install ansible
pip3 --version
ansible --version
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

