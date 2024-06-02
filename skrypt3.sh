#!/bin/bash

show_help() {
    echo "Usage: skrypt.sh [OPTION]"
    echo "--date, -d     Display today's date"
    echo "--logs, -l     Create 100 log files"
    echo "--logs, -l N   Create N log files"
    echo "--error, -e    Create 100 error files"
    echo "--error, -e N  Create N error files"
    echo "--init         Clone the repository and set PATH"
    echo "--help, -h     Display this help message"
}

if [ "$1" == "--date" ] || [ "$1" == "-d" ]; then
    date
elif [ "$1" == "--logs" ] || [ "$1" == "-l" ]; then
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
elif [ "$1" == "--error" ] || [ "$1" == "-e" ]; then
    count=100
    if [ ! -z "$2" ]; then
        count=$2
    fi
    mkdir -p errors
    for ((i=1; i<=count; i++))
    do
        mkdir -p "errors/error$i"
        filename="errors/error$i/error$i.txt"
        echo "Filename: $filename" > $filename
        echo "Script name: $0" >> $filename
        echo "Date: $(date)" >> $filename
    done
elif [ "$1" == "--init" ]; then
    repo_url=$(git config --get remote.origin.url)
    git clone $repo_url cloned_repo
    export PATH=$PATH:$(pwd)/cloned_repo
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    show_help
fi
