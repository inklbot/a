#! /usr/bin/bash

set -ex

cd $OPBNB_WORKSPACE/cd op-node-data

export L2_RPC=http://localhost:8551
# replace the p2p private key with yours
# you can generate a new one with `openssl rand -hex 32`
export P2P_PRIV_KEY=f71a175a259ecc446d31e3ba3e2f623626cb83bfa6ed6ecc24dd94e99f8a6cd5

# for testnet
# it's better to replace the L1_RPC with your own BSC Testnet RPC Endpoint for stability
#export L1_RPC=https://bsc-testnet.bnbchain.org
#export P2P_BOOTNODES="enr:-J24QGQBeMsXOaCCaLWtNFSfb2Gv50DjGOKToH2HUTAIn9yXImowlRoMDNuPNhSBZNQGCCE8eAl5O3dsONuuQp5Qix2GAYjB7KHSgmlkgnY0gmlwhDREiqaHb3BzdGFja4PrKwCJc2VjcDI1NmsxoQL4I9wpEVDcUb8bLWu6V8iPoN5w8E8q-GrS5WUCygYUQ4N0Y3CCIyuDdWRwgiMr,enr:-J24QJKXHEkIhy0tmIk2EscMZ2aRrivNsZf_YhgIU51g4ZKHWY0BxW6VedRJ1jxmneW9v7JjldPOPpLkaNSo6cXGFxqGAYpK96oCgmlkgnY0gmlwhANzx96Hb3BzdGFja4PrKwCJc2VjcDI1NmsxoQMOCzUFffz04eyDrmkbaSCrMEvLvn5O4RZaZ5k1GV4wa4N0Y3CCIyuDdWRwgiMr"

# for mainnet
export L1_RPC=https://bsc-dataseed.bnbchain.org
export P2P_BOOTNODES="enr:-J24QA9sgVxbZ0KoJ7-1gx_szfc7Oexzz7xL2iHS7VMHGj2QQaLc_IQZmFthywENgJWXbApj7tw7BiouKDOZD4noWEWGAYppffmvgmlkgnY0gmlwhDbjSM6Hb3BzdGFja4PMAQCJc2VjcDI1NmsxoQKetGQX7sXd4u8hZr6uayTZgHRDvGm36YaryqZkgnidS4N0Y3CCIyuDdWRwgiMs"

./bin/op-node \
  --l1=ws://localhost:8546 --l2=ws//localhost:9001 \
  --rollup.config=./rollup.json \
  --rpc.addr=127.0.0.1 \
  --l2.jwt-secret=./jwt.txt \
  --rpc.port=8546
