#! /usr/bin/bash

: 'In this script we check the temperature of CPU
    we use the following
        - thermal sensors temperature file
        - current temperature value in millidegrees Celsius is read from the TEMP_FILE using the cat
'


TEMP_FILE=/sys/class/thermal/thermal_zone0/temp

ORIGINAL_TEMP=$(cat $TEMP_FILE)
TEMP_C=$((ORIGINAL_TEMP/1000))
TEMP_F=$(($TEMP_C * 9/5 + 32))

echo $TEMP_F F



