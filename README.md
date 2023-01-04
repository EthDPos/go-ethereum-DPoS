## EthDPos private chain automatic deployment environment
### Environment Usage

Mainly consists of two general entry shells

1. reset-chain.sh
    Reset the chain environment and clean up all the accumulated data of the previous version (if necessary, back up in advance!)

2. start-all-nodes.sh
    Automatically start the test chain, currently there are 5 block producing nodes, if reset-chain.sh is not executed, it will continue to run based on the last chain data.
    Before starting, each node will be automatically updated with geth in the root directory.

3. add-peer-chain.sh
    Automatically obtain the admin_nodeInfo of each node and automatically add to each node (this shell will be automatically run by start-all-nodes.sh)

## Supplementary information
#### Chain ID: 9528
### Node connection

| | RPC | WS | |
| ----- | -------------- | -------------- | ---- |
| BP1 Node | 127.0.0.1:8145 | 127.0.0.1:8146 | |
| BP2 Node | 127.0.0.1:8245 | 127.0.0.1:8246 | |
| BP3 Node | 127.0.0.1:8345 | 127.0.0.1:8346 | |
| Boot Node | 127.0.0.1:8445 | 127.0.0.1:8446 | |
| RPC Node | 127.0.0.1:8545 | 127.0.0.1:8546 | |

### Special account address

| address name | address | private key | |
| ------ | ------------------------------------------ | ------------------------------------------------------------- | ---- |
| Total pool | 0x57446F599c35d2C40Aa3B284de3c0fCF51032135 | 0x96d879183dc4645441a9d05e6c4e5441e95a224fa299709c3103353b5d1b27a5 ||
| BP1 | 0x908F983D8D156Ec0c44319Ea2f39aaBD01d90CAD | 0xc823064b7b830472dac8dd553865a64b98ef833932c9f35dd4c1d6917f110aea ||
| BP2 | 0xA973B5248CcD9a3befBB87AC507cd4F8fD546877 | 0x48ed87089dc7d69121f912d06d8b1281a5dd375e66ec05e0a11d68bd346c2353 ||
| BP3 | 0x90b7a04AF89Fb99a9bc3aF3D19169D93A00d47F8 | 0x7cef9233e0ed0e83a500db4dab19ee74809130fc2418705c018412a772fa7894 ||


### View program log

```shell
cd node1/
tail -f ./geth.log
```

### View the latest block producers

eth.getBlock(eth.blockNumber).miner


#### tool address

https://www.myetherwallet.com/

https://tool.lu/timestamp/

https://tool.lu/hexconvert/

#### Required extensions

MetaMask

#### Initialize Node

```shell
./geth --datadir ./data init genesis.json
./geth --config geth.toml --nodiscover

./geth attach ipc:./data/geth.ipc
```

#### Start mining

```shell
miner.start()
```
#### Contract address

| Contract Name | Contract Address | Remarks |
| ---------- | ---------------------------------------- |---------|
| SystemContract | 0x0000000000000000000000000000000000000F000 | System Contract |
| OnChainDaoContract | 0x000000000000000000000000000000000000F001 | Governance contract |
| AddressListContract | 0x000000000000000000000000000000000000F002 | Blacklist address contract |
| CommunityPoolContract | 0x000000000000000000000000000000000000F003 | Provident fund contract |
