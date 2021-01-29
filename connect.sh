#!/usr/bin/bash
while [[ ! -c /dev/ttyACM0 ]]; do
    sleep 1
done
sleep 1
screen /dev/ttyACM0 115200
