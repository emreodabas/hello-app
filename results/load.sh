#!/bin/bash


CC=$1
TIME=$2
PORT=$3
NAME=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo '')
TEST_NAME=$4

echo "folder creating " $TEST_NAME
mkdir -p $TEST_NAME

echo "first load started for" $TEST_NAME " to http://node1-k8s:$PORT/$NAME  to $CC.out" 
hey -c $CC -z $TIME http://node1-k8s:$PORT/$NAME > $TEST_NAME/$CC.out
echo "second load started for" $TEST_NAME " to http://node1-k8s:$PORT/$NAME to raw.csv " 
hey -o csv -c $CC -z $TIME http://node1-k8s:$PORT/$NAME > $TEST_NAME/$CC-raw.csv
echo "generating hdr csv & png" 
cat $TEST_NAME/$CC.csv | hey-hdr -out $TEST_NAME 
echo "moving files"
mv $TEST_NAME.hdr.csv $TEST_NAME/$CC.csv
mv $TEST_NAME.scatter.png $TEST_NAME/$CC.png


