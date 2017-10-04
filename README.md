# Basic Private Ethereum Network

This is a basic Ethereum test network and it has 3 nodes, and one account is created in the second node (with some ether).

#### Requirements

Install Geth - https://github.com/ethereum/go-ethereum/wiki/geth

#### How to run?
In order to run the network:
1. Run the script `./init-wipe.sh` (there's another script called init-continue, which continues a previous network);
2. Run the script `./start.sh`;
3. Connect to one node using `geth attach qdata/dd1/geth.ipc`;
4. Once there, use the following command `admin.nodeInfo`;
5. Copy enode;
6. Connect to another node using `geth attach qdata/dd2/geth.ipc`;
7. Use this command, `admin.addPeer("enode from step 5")`;
8. Finished!

#### Contents of the folder
  * Genesis.json - Is the genesis block configuration for the network;
  * Genesis_template.json - The template to use before adapting the genesis json file in order to create the network;
  * Init-wipe.sh - The script for initializing the network from the beginning;
  * Init-continue.sh - Script for initializing the network without erasing a former network;
  * start.sh - script to start the network, use it after the network is already initialized;
  * pswd - Folder to store passwords (in this case there's only one password);
  * qdata - Folder that store information about the blockchain and nodes (once a network is initialized).
