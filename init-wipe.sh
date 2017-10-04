#!/bin/bash
set -u
set -e

echo "[*] Cleaning up temporary data directories"
rm -rf qdata
mkdir -p qdata/logs

echo "[*] Creating account"
geth --datadir=./qdata/dd2 --password pswd/pass1 account new > account1.txt

echo "[*] Updating Genesis JSON to use the address created"
cp genesis_template.json genesis.json
partialAddress1="0x"
partialAddress2="$(cat account1.txt | cut -d "{" -f2 | cut -d "}" -f1)"
finalAddress=$partialAddress1$partialAddress2
sed -i "s/address/${finalAddress}/g" genesis.json

echo "[*] Configuring node 1"
mkdir -p qdata/dd1/keystore
geth --datadir qdata/dd1 init genesis.json

echo "[*] Configuring node 2"
mkdir -p qdata/dd2/keystore
geth --datadir qdata/dd2 init genesis.json

echo "[*] Configuring node 3"
mkdir -p qdata/dd3/keystore
geth --datadir qdata/dd3 init genesis.json
