#! /bin/bash

echo -e \<b\>\<span size=\"large\" \>\</span\> $(sensors -j | jq '."asus-isa-0000".cpu_fan.fan1_input') \<span color=\"#2f6b3f\"\>RPM\</span\>\</b\>
