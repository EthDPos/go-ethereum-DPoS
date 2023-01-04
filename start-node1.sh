#!/usr/bin/env bash
node_index=1
node_rpc_port=8145
metrics_port=9160
personal_import_key="0xc823064b7b830472dac8dd553865a64b98ef833932c9f35dd4c1d6917f110aea"
personal_address="0x0942737e33b1AD9B028bb4FAb46677B1e5371D79"
password="@ujPj4!%vE6rVHH1"
nodekeyhex="00dd0f0f7deb88a9bfbfce254e12c943220c8e78c83891d83fc84da7ef976310"
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
