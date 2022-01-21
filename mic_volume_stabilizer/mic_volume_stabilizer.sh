#!/bin/bash

MICROPHONE_DEVICE=$1
echo "Selected microphone device: $MICROPHONE_DEVICE"
while true
do 
    sleep 0.1 
    result=`ps -A | grep qemu`
    while [ ! -z "$result" ]
    do
        sleep 0.1
        pacmd set-source-volume $MICROPHONE_DEVICE 32000
        result=`ps -A | grep qemu`
    done  
done