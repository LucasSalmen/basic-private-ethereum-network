#!/bin/bash
set -u
set -e

#echo "[*] Cleaning up temporary data directories"
#rm -rf qdata
#mkdir -p qdata/logs

echo "[*] Configuring node 1"
#mkdir -p qdata/dd1/keystore
geth --datadir qdata/dd1 init genesis.json

echo "[*] Configuring node 2"
#mkdir -p qdata/dd2/keystore
geth --datadir qdata/dd2 init genesis.json

echo "[*] Configuring node 3"
#mkdir -p qdata/dd3/keystore
geth --datadir qdata/dd3 init genesis.json
