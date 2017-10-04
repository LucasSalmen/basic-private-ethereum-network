#!/bin/bash
set -u
set -e
NETID=1234
GLOBAL_ARGS=" --networkid $NETID --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum"

echo "[*] Starting node 1"
geth --datadir qdata/dd1 $GLOBAL_ARGS --rpcport 22000 --port 21000 --rpccorsdomain "*" 2>>qdata/logs/1.log &

echo "[*] Starting node 2"
geth --datadir qdata/dd2 $GLOBAL_ARGS --rpcport 22001 --port 21001 --rpccorsdomain "*" --mine --gasprice 0 2>>qdata/logs/2.log &

echo "[*] Starting node 3"
geth --datadir qdata/dd3 $GLOBAL_ARGS --rpcport 22002 --port 21002 --rpccorsdomain "*" 2>>qdata/logs/3.log &
