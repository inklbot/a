#!/bin/bash

sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
sudo apt-get install -y make
sudo apt-get install -y git
sudo apt-get install -y gcc
sudo apt-get install -y libc-dev
sudo apt-get install -y openssl

echo "Done."
