#!/bin/bash

# GPU 사용량을 모니터링할 GPU 인덱스 설정
GPU_INDEX=0  # 원하는 GPU 인덱스로 변경하세요

# 원하는 GPU 사용량 임계값 설정 (10% 미만)
THRESHOLD=10

while true; do
  # GPU 사용량 확인
  GPU_USAGE=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits -i $GPU_INDEX)

  # GPU 사용량이 임계값 미만인 경우 명령 실행
  if [ $GPU_USAGE -lt $THRESHOLD ]; then
    # quai-gpu-miner 디렉토리로 이동
    cd quai-gpu-miner

    # build 디렉토리로 이동
    cd build

    # ethcoreminer 실행
    ./ethcoreminer/ethcoreminer -G -P stratum://64.176.225.253:3333
  else
    echo "GPU 사용량이 10% 이상이므로 명령을 실행하지 않습니다."
  fi

  # 5초 동안 대기하고 다시 확인 (원하는 대기 시간으로 변경 가능)
  sleep 5
done
