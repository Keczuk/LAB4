#!/bin/bash

if [ "$1" == "--date" ]; then
    date
elif [ "$1" == "--logs" ]; then
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
elif [ "$1" == "--help" ]; then
    echo "Usage: skrypt.sh [OPTION]"
    echo "--date     Display today's date"
    echo "--logs     Create 100 log files"
    echo "--logs N   Create N log files"
    echo "--help     Display this help message"
fi
