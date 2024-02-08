#!/bin/bash

sudo apt update

sudo apt install -y curl git wget jq make gcc nano tmux htop clang bsdmainutils ncdu unzip
sudo apt install -y make git-core libssl-dev pkg-config libclang-12-dev build-essential
sudo apt install -y libudev-dev libc6

sudo curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"

#-----------------------------------------------------------------------------

PROTOBUF_TAG="v24.4"
curl -L -o protobuf.zip "https://github.com/protocolbuffers/protobuf/releases/download/$PROTOBUF_TAG/protoc-${PROTOBUF_TAG#v}-linux-x86_64.zip"
mkdir protobuf_temp && unzip protobuf.zip -d protobuf_temp/
sudo cp protobuf_temp/bin/protoc /usr/local/bin/
sudo cp -r protobuf_temp/include/* /usr/local/include/
rm -rf protobuf_temp protobuf.zip

#-----------------------------------------------------------------------------

export GO_VER="1.21.1" 
cd $HOME 
wget "https://golang.org/dl/go$GO_VER.linux-amd64.tar.gz" 
sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf "go$GO_VER.linux-amd64.tar.gz" 
rm "go$GO_VER.linux-amd64.tar.gz" 

echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
source $HOME/.bash_profile

go version

export COMETBFT_TAG="v0.37.2"

curl -L -o cometbft.tar.gz "https://github.com/cometbft/cometbft/releases/download/$COMETBFT_TAG/cometbft_${COMETBFT_TAG#v}_linux_amd64.tar.gz"
mkdir cometbft_temp && tar -xvf cometbft.tar.gz -C cometbft_temp/
sudo mv cometbft_temp/cometbft /usr/local/bin/
rm -rf cometbft_temp cometbft.tar.gz

export NAMADA_TAG=v0.31.2
curl -L -o namada.tar.gz "https://github.com/anoma/namada/releases/download/$NAMADA_TAG/namada-${NAMADA_TAG}-Linux-x86_64.tar.gz"
tar -xvf namada.tar.gz
sudo mv namada-${NAMADA_TAG}-Linux-x86_64/* /usr/local/bin/
rm -rf namada-${NAMADA_TAG}-Linux-x86_64 namada.tar.gz

export CHAIN_ID="shielded-expedition.88f17d1d14"
NAMADA_NETWORK_CONFIGS_SERVER="https://github.com/anoma/namada-shielded-expedition/releases/download/shielded-expedition.88f17d1d14" namada client utils join-network --chain-id $CHAIN_ID

protoc --version
cometbft version
namada --version

echo "Done."
