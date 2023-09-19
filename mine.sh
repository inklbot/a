#!/bin/bash

GPU_INDEX=0  

THRESHOLD=10

GPU_USAGE=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits -i $GPU_INDEX)

if [ $GPU_USAGE -lt $THRESHOLD ]; then
  cd quai-gpu-miner

  cd build

  ./ethcoreminer/ethcoreminer -G -P stratum://65.109.11.250:3333
else
  echo "10% up"
fi
