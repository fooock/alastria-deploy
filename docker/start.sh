#!/usr/bin/env bash

# Hack, to create folders in network dir we need to execute clean task first...
./bin/start_network.sh clean 0 0

./bin/start_node.sh $1 dockerfile
