#!/bin/bash

GPU_INDEX=0

THRESHOLD=10

echo "Proxy server IP : "
read MINING_SERVER_IP
MINING_SERVER="stratum://$MINING_SERVER_IP:3333"

while true; do
  # GPU 사용량 확인
  GPU_USAGE=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits -i $GPU_INDEX)

  if [ $GPU_USAGE -lt $THRESHOLD ]; then
    cd quai-gpu-miner

    cd build

    ./ethcoreminer/ethcoreminer -G -P $MINING_SERVER
  else
    echo "GPU 사용량이 10% 이상이므로 명령을 실행하지 않습니다."
  fi

  sleep 5
done
