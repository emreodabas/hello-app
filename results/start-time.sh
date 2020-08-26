#!/bin/bash
IMAGE=$1

nohup docker run -p 8080:8080 $IMAGE  >/dev/null 2>&1 &

ID=""
CODE=""


while [[ $ID == "" ]] 
do 
ID=$(docker ps --format '{{.ID}}')
done
echo ID $ID

RESP=""
while [[ $RESP != *"ServiceIsUP"* ]] 
do 
 RESP=$(curl -sf http://localhost:8080/ServiceIsUP)
done
 echo $RESP
 docker stop $ID

START=$(docker inspect --format='{{.State.StartedAt}}'  $ID)
START_TIMESTAMP=$(date --date=$START +%s%N)
STOP=$(docker inspect --format='{{.State.FinishedAt}}'  $ID)
STOP_TIMESTAMP=$(date --date=$STOP +%s%N)

echo "Start" $START - $START_TIMESTAMP
echo "Stop" $STOP - $STOP_TIMESTAMP


echo $2 -- $(($STOP_TIMESTAMP-$START_TIMESTAMP)) milliseconds  >> start-times.out