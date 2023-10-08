#!/bin/bash

sudo apt update
sudo apt install git make jq wget -y
sleep 1

echo -e "y\n" | sudo ufw enable
sudo ufw allow 1:65535/tcp
sudo ufw allow 1:65535/udp
sleep 1

git clone https://github.com/dominant-strategies/go-quai.git
cd go-quai
NODE_LATEST_TAGS=$(curl -s https://api.github.com/repos/dominant-strategies/go-quai/tags | jq -r '.[0].name')
git checkout $NODE_LATEST_TAGS
cp network.env.dist network.env

echo ""

read -p "Please complete network.env configuration and press Enter."

make go-quai
#make run

cd
mkdir .quai
wget https://archive.quai.network/quai_colosseum_backup.tar.gz
tar -xzvf quai_colosseum_backup.tar.gz
cp -r quai_colosseum_backup ~/.quai
mv quai_colosseum_backup/* .quai/

cd go-quai
make run

sleep 3

cd
git clone https://github.com/dominant-strategies/go-quai-stratum
cd go-quai-stratum
PROXY_LATEST_TAGS=$(curl -s https://github.com/dominant-strategies/go-quai-stratum/tags | jq -r '.[0].name')
git checkout $PROXY_LATEST_TAGS
cp config/config.example.json config/config.json
make quai-stratum

echo ""
echo "cd go-quai-stratum && ./build/bin/quai-stratum --region=8583 --zone=8679"
