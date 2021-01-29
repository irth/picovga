#!/usr/bin/bash
cd "$(dirname "$(readlink -f $0)")"
./build.sh && ./flash.sh wait && ./connect.sh