#!/bin/bash


PORT=$1
TEST_NAME=$2
TYPE=$3


TIME=1m

echo WARM UP
hey -c 1536 -z $TIME http://node1-k8s:$PORT/$TEST_NAME
echo TEST START
CC=512
./load.sh $CC $TIME $PORT $TEST_NAME-t2
CC=1024
./load.sh $CC $TIME $PORT $TEST_NAME-t2
CC=1536
./load.sh $CC $TIME $PORT $TEST_NAME-t2
CC=2048
./load.sh $CC $TIME $PORT $TEST_NAME-t2
CC=3072
./load.sh $CC $TIME $PORT $TEST_NAME-t2

echo TEST DONE
