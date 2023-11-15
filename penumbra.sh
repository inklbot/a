#!/bin/bash

# Update package list
sudo apt update

# Install required packages
sudo apt-get install jq build-essential pkg-config libssl-dev clang git-lfs -y

# Install Rust using rustup
sudo curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"

# Enable UFW and allow traffic
echo -e "y\n" | sudo ufw enable
sudo ufw allow 1:65535/tcp
sudo ufw allow 1:65535/udp

# Get the latest Penumbra release tag
LATEST_RELEASE=$(curl -s "https://api.github.com/repos/penumbra-zone/penumbra/releases/latest" | jq -r '.tag_name')
echo "The latest Penumbra release is: $LATEST_RELEASE"

# Clone Penumbra repository and build
git clone https://github.com/penumbra-zone/penumbra
cd penumbra && git fetch && git checkout $LATEST_RELEASE
cargo build --release --bin pcli

sudo apt install cargo -y
source $HOME/.cargo/env

echo "done."
