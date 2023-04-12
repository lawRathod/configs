#! /bin/bash

file="/sys/class/power_supply/BAT1/charge_control_end_threshold"
while [ ! -f "$file" ] 
do
  echo "File doesn't exist"
  sleep 1
done

sudo bash -c "echo $1 > $file"
