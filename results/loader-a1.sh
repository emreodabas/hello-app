#!/bin/bash


PORT=$1
TEST_NAME=$2
TYPE=$3
TIME=1m
echo WARM UP
hey -c 3072 -z $TIME http://node1-k8s:$PORT/$TEST_NAME
echo TEST START

CC=1024
./load.sh $CC $TIME $PORT $TEST_NAME-a1
CC=2048
./load.sh $CC $TIME $PORT $TEST_NAME-a1
CC=3072 
./load.sh $CC $TIME $PORT $TEST_NAME-a1
CC=4096
./load.sh $CC $TIME $PORT $TEST_NAME-a1
CC=6144
./load.sh $CC $TIME $PORT $TEST_NAME-a1

echo TEST DONE
