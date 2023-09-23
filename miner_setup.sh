#!/bin/bash

# Install necessary packages
apt install sudo ufw wget curl -y
sleep 1
apt install screen -y
sleep 1
apt install build-essential libssl-dev clang pkg-config cmake -y
sleep 1
apt install git nvidia-cuda-toolkit -y
sleep 1

# Clone the repository and build
git clone https://github.com/dominant-strategies/quai-gpu-miner
cd quai-gpu-miner
git submodule update --init --recursive
mkdir build
cd build
cmake ..
cmake --build .

# Download mine.sh and run it
wget https://raw.githubusercontent.com/inklbot/a/main/mine.sh
bash mine.sh
