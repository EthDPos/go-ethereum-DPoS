#!/bin/bash
node_index=4
node_rpc_port=8445
metrics_port=9460
nodekeyhex="d2992b0c56ceacb3e3cadb802a5e27bc72466b772ce689867f1b7c23c979669b"
echo -e "kill node$node_index \n";
kill -15 `lsof -t -i:$node_rpc_port`

echo -e "update node$node_index bin \n";
cp geth ./node$node_index/
cp ./genesis/genesis.json ./node$node_index/
cd ./node$node_index

if [ ! -d "./data/" ];then
  echo -e "init node$node_index data \n";
  ./geth --datadir ./data init genesis.json
fi

echo -e "Starting node$node_index \n";
sleep 5
nohup ./geth --config geth.toml --nodekeyhex $nodekeyhex --cache 8192 --networkid 9528 --metrics --metrics.addr 0.0.0.0 --metrics.port $metrics_port --verbosity 3 2>> ./geth.log &

cd ..
