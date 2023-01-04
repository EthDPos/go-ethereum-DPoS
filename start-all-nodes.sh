#!/bin/bash
echo -e "Starting report \n";
#./report_start_run.sh

echo -e "Starting all nodes \n";
echo -e "Starting node1 \n";
./start-node1.sh
#./report_data_node1.sh

echo -e "Starting node2 \n";
./start-node2.sh
#./report_data_node2.sh

echo -e "Starting node3 \n";
./start-node3.sh
#./report_data_node3.sh

echo -e "Starting node4 \n";
./start-node4.sh
#./report_data_node4.sh

echo -e "Starting node5 \n";
./start-node5.sh
#./report_data_node5.sh

echo -e "successful start completed \n";
