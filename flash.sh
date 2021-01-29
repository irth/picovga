#!/usr/bin/bash
DEVICE="$(readlink -f /dev/disk/by-label/RPI-RP2)"
cd "$(dirname "$(readlink -f $0)")"

BINARY=(build/*.uf2)

bin_size=$(du -b "${BINARY[0]}" | cut -f1)

not_connected() {
    echo No Raspberry Pi Pico found.
    if [[ "$1" == "wait" ]]; then
        sleep 0.5;
        exec "$(readlink -f "$0")" wait
    fi
}
sleep 0.5
[[ -b "$DEVICE" ]] && {
    echo Flashing to "$DEVICE"
    sudo umount /mnt
    sudo mount "$DEVICE" /mnt
    sleep 1    
    sudo cp "${BINARY[0]}" /mnt
    sync
    sleep 1
    sudo umount /mnt
    echo Done
} || not_connected $1
sync
