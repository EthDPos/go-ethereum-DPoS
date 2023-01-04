#!/bin/bash
node_index=2
node_rpc_port=8245
metrics_port=9260
personal_import_key="0x48ed87089dc7d69121f912d06d8b1281a5dd375e66ec05e0a11d68bd346c2353"
personal_address="0x7D63E9587ad75D73793a8384Dfc8f54ccdbE0CB7"
password="@ujPj4!%vE6rVHH1"
nodekeyhex="c46177d287f7c84853bebb57d45a97006ff85721a2939370d7eb8da29747b199"
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
