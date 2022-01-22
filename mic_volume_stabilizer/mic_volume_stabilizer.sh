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

get_microphone_index() {
    echo $(pactl list short sources | grep $1 | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,')
}

get_microphone_volume() {
    echo $(pactl list sources | grep '^[[:space:]]Volume:' | head -n $(( $1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
}

while true
do 
    LAST_MICROPHONE_VOLUME=$(get_microphone_volume $(get_microphone_index $(get_microphone_device)))
    echo "last " $LAST_MICROPHONE_VOLUME
    sleep 0.1 
    result=`ps -A | grep qemu-system-x86`
    while [ ! -z "$result" ]
    do
        sleep 0.1
        CURRENT_MICROPHONE_VOLUME=$(get_microphone_volume $(get_microphone_index $(get_microphone_device)))
        echo "current " $CURRENT_MICROPHONE_VOLUME
        if [ $CURRENT_MICROPHONE_VOLUME -ge $LAST_MICROPHONE_VOLUME ]
        then
            pacmd set-source-volume $(get_microphone_device) $(map_range $LAST_MICROPHONE_VOLUME)
        fi
        result=`ps -A | grep qemu-system-x86`
    done  
done
