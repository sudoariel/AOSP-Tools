#!/bin/bash

# Script for detecting initialization of qemu-system-x86 process (Android Emulator)
# and forcing the microphone volume to be fixed, avoiding the annoying noise when 
# you're in a meeting due to the changes in the volume by the emulator. 

map_range() {
    value=$1
    target_range_max=65535
    input_range_max=100
    echo $(( value * (target_range_max) / (input_range_max) ))
}

get_microphone_device() {
    echo $(pactl info | sed -En 's/Default Source: (.*)/\1/p')
}

while true
do 
    sleep 0.1 
    result=`ps -A | grep qemu-system-x86`
    while [ ! -z "$result" ]
    do
        sleep 0.1
        MVS_VOLUME_TARGET=$(<volume.conf)
        pacmd set-source-volume $(get_microphone_device) $(map_range $MVS_VOLUME_TARGET)
        result=`ps -A | grep qemu-system-x86`
    done  
done
