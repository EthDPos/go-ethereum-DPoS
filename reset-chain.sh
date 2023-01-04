#!/bin/bash
echo -e "Reset Geth \n";

# start node1
echo -e "Wait 10 seconds for the geth process to end \n";
pkill geth
sleep 10

echo -e "Start cleaning and resetting node 1 \n";
cd ./node1
rm -rf ./data
rm ./geth.log
rm ./nohup.out
rm ./geth
rm ./genesis.json

echo -e "Start cleaning and resetting node 2 \n";
cd ../node2
rm -rf ./data
rm ./geth.log
rm ./nohup.out
rm ./geth
rm ./genesis.json

echo -e "Start cleaning and resetting node 3 \n";
cd ../node3
rm -rf ./data
rm ./geth.log
rm ./nohup.out
rm ./geth
rm ./genesis.json

echo -e "Start cleaning and resetting node 4 \n";
cd ../node4
rm -rf ./data
rm ./geth.log
rm ./nohup.out
rm ./geth
rm ./genesis.json

echo -e "Start cleaning and resetting node 5 \n";
cd ../node5
rm -rf ./data
rm ./geth.log
rm ./nohup.out
rm ./geth
rm ./genesis.json

cd ..
echo -e "All nodes cleaned and reset completed \n";
