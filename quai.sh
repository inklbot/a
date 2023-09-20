#!/bin/bash

sudo apt update
sudo apt install git make jq wget -y

wget https://golang.org/dl/go1.21.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> ~/.bashrc
source ~/.bashrc
go version

echo -e "y\n" | sudo ufw enable
sudo ufw allow 1:65535/tcp
sudo ufw allow 1:65535/udp

git clone https://github.com/dominant-strategies/go-quai.git
cd go-quai
NODE_LATEST_TAGS=$(curl -s https://api.github.com/repos/dominant-strategies/go-quai/tags | jq -r '.[0].name')
git checkout $NODE_LATEST_TAGS
cp network.env.dist network.env

read -p "Please complete network.env configuration and press Enter."

make go-quai
make run

cd
git clone https://github.com/dominant-strategies/go-quai-stratum
cd go-quai-stratum
PROXY_LATEST_TAGS=$(curl -s https://github.com/dominant-strategies/go-quai-stratum/tags | jq -r '.[0].name')
git checkout $PROXY_LATEST_TAGS
cp config/config.example.json config/config.json
make quai-stratum

echo "./build/bin/quai-stratum --region=8583 --zone=8679"
