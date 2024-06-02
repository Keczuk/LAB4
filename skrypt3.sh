#!/bin/bash

if [ "$1" == "--logs" ]; then
    count=100
    if [ ! -z "$2" ]; then
        count=$2
    fi
    for ((i=1; i<=count; i++))
    do
        filename="log$i.txt"
        echo "Filename: $filename" > $filename
        echo "Script name: $0" >> $filename
        echo "Date: $(date)" >> $filename
    done
fi
