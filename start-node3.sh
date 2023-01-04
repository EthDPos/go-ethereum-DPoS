#!/usr/bin/env bash
node_index=3
node_rpc_port=8345
metrics_port=9360
personal_import_key="0x7cef9233e0ed0e83a500db4dab19ee74809130fc2418705c018412a772fa7894"
personal_address="0xd502b3B6B5D11C8E174FC21F7A2A0C980fEff930"
password="@ujPj4!%vE6rVHH1"
nodekeyhex="bf20b6119d1025a5d8a00d40a4edd0b42ac658845466ef0214439519d847a0c7"
echo -e "kill node$node_index \n";
kill -15 `lsof -t -i:$node_rpc_port`

echo -e "update node$node_index bin \n";
cp geth ./node$node_index/
cp ./genesis/genesis.json ./node$node_index/
cd ./node$node_index

if [ ! -d "./data/" ];then
  echo -e "init node$node_index data \n";
  ./geth --datadir ./data init genesis.json
  echo $password > ./.password
  echo $personal_import_key  > ./.privatekey
  ./geth --config ./geth.toml account import --password ./.password ./.privatekey
  rm -rf ./.privatekey
fi

echo -e "Starting node$node_index \n";
sleep 5
nohup ./geth --config geth.toml --mine --nodekeyhex $nodekeyhex --unlock $personal_address --cache 8192 --networkid 9528 --password ./.password --metrics --metrics.addr 0.0.0.0 --metrics.port $metrics_port --verbosity 3 2>> ./geth.log &

cd ..
