#!/usr/bin/env bash

# Configs
flash_file_path="./build/glove80.uf2"
mount_path="/run/media/$USER/"
R_dir="GLV80RHBOOT/"
L_dir="GLV80LHBOOT/"

# Paths
copy_paths=("$mount_path$R_dir" "$mount_path$L_dir")

echo $copy_paths

copy_to_firmware_to_dir() {
    copy_path=$1
    echo "Copying $flash_file_path to $copy_path"
    cp $flash_file_path $copy_path && echo "Done!" && return
    echo "Copying failed!" && exit
}

for p in ${copy_paths[@]}; do
    echo "Attempting to copy to path: $p"
    while [ ! -d  $p ]; do
        echo ".";
        sleep 1;
    done
    copy_to_firmware_to_dir $p
done
