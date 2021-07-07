#!/bin/bash

args=$#
user=$1
directory=$2

if [[ $EUID -ne 0 ]]; then
    echo "ERROR This script must be run as root"
    exit -1
fi

if [ $args -ne 2 ]; then
    echo "ERROR Shoud be 2 arguments: username and directory"
    exit -1
fi

if [ ! -d $directory ]; then
    echo "ERROR Directory $directory DOES NOT exists."
    exit -1
fi

if ! id -u "$1" >/dev/null 2>&1; then
    echo "ERROR user does not exist"
    exit -1
fi

chown -R $user:$user $directory
printf "The owner has been changed to $user\n"

exit 0
