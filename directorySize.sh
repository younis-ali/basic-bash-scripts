#! /usr/bin/bash

: 'This script accepts the directory path from the cli
    and outputs the size in humman readable format.
    It also validates the directory path.
'

# Check if the argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <provide directory path>"
    exit 1
fi

# Store the cli argument in the directory variable
directory="$1"


# Check weather the given path is a valid directory or not using -d test
if [ ! -d "$directory" ]; then
    echo "'$directory' does not exist"
    exit 1
fi

: ' Check the size of the directory using du command
    -s  summary of the total usage 
    -h    humman readable format output
'

du -sh "$directory"