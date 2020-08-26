#!/bin/bash


PORT=$1
TEST_NAME=$2
TYPE=$3

TIME=1m

echo WARM UP
hey -c 768 -z $TIME http://node1-k8s:$PORT/$TEST_NAME
echo TEST START
CC=256
./load.sh $CC $TIME $PORT $TEST_NAME-lowest
CC=512
./load.sh $CC $TIME $PORT $TEST_NAME-lowest
CC=768 
./load.sh $CC $TIME $PORT $TEST_NAME-lowest
CC=960
./load.sh $CC $TIME $PORT $TEST_NAME-lowest
CC=1024
./load.sh $CC $TIME $PORT $TEST_NAME-lowest

echo TEST DONE
