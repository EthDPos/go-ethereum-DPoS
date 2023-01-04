## EthDPos 私链自动部署环境
### 环境使用

主要由两个总入口shell

1. reset-chain.sh
   重置链环境，清理掉之前版本运行的所有积累数据（有需要，提前自行备份！）

2. start-all-nodes.sh
   自动启动测试链，当前为5个出块节点，如果不执行reset-chain.sh，则为基于上次链数据，继续运行。
   启动前，会自动使用根目录下的geth更新各个节点。

3. add-peer-chain.sh
   自动获取各个节点的admin_nodeInfo，并自动添加到各个节点（此shell会被start-all-nodes.sh自动运行）

## 辅助信息
#### 链ID：9528
### 节点连接

|       | RPC            | WS             |      |
| ----- | -------------- | -------------- | ---- |
| BP1 Node | 127.0.0.1:8145 | 127.0.0.1:8146 |      |
| BP2 Node | 127.0.0.1:8245 | 127.0.0.1:8246 |      |
| BP3 Node | 127.0.0.1:8345 | 127.0.0.1:8346 |      |
| Boot Node | 127.0.0.1:8445 | 127.0.0.1:8446 |      |
| RPC Node | 127.0.0.1:8545 | 127.0.0.1:8546 |      |

### 特殊账户地址

| 地址名 | 地址                                       | 私钥                                                         |      |
| ------ | ------------------------------------------ | ------------------------------------------------------------ | ---- |
| 总池   | 0x57446F599c35d2C40Aa3B284de3c0fCF51032135 | 0x96d879183dc4645441a9d05e6c4e5441e95a224fa299709c3103353b5d1b27a5 |      |
| BP1   | 0x908F983D8D156Ec0c44319Ea2f39aaBD01d90CAD | 0xc823064b7b830472dac8dd553865a64b98ef833932c9f35dd4c1d6917f110aea |      |
| BP2   | 0xA973B5248CcD9a3befBB87AC507cd4F8fD546877 | 0x48ed87089dc7d69121f912d06d8b1281a5dd375e66ec05e0a11d68bd346c2353 |      |
| BP3   | 0x90b7a04AF89Fb99a9bc3aF3D19169D93A00d47F8 | 0x7cef9233e0ed0e83a500db4dab19ee74809130fc2418705c018412a772fa7894 |      |


### 查看程序日志

```shell
cd node1/
tail -f ./geth.log
```

### 查看最新出块者

eth.getBlock(eth.blockNumber).miner


#### 工具地址

https://www.myetherwallet.com/

https://tool.lu/timestamp/

https://tool.lu/hexconvert/

#### 所需扩展

MetaMask

#### 初始化节点

```shell
./geth --datadir ./data init genesis.json
./geth --config geth.toml  --nodiscover

./geth attach ipc:./data/geth.ipc
```

#### 启动挖矿

```shell
miner.start()
```
#### 合约地址

| 合约名     | 合约地址                                 | 备注      |
| ---------- | ---------------------------------------- |---------|
| SystemContract | 0x000000000000000000000000000000000000F000 | 系统合约    |
| OnChainDaoContract     | 0x000000000000000000000000000000000000F001 | 治理合约    |
| AddressListContract   | 0x000000000000000000000000000000000000F002 | 黑名单地址合约 |
| CommunityPoolContract   | 0x000000000000000000000000000000000000F003 | 公积金合约   |
