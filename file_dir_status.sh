#! /usr/bin/bash
: 'This script accepts the file or foler path from cli
    and evaluates the sstatus of file or directory.
    stuatus include type, readability etc
    '

# Check if the argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file or directory>"
    exit 1
fi

# Get the path from the cli
path="$1"

# Check if the path exists usign -e 
if [ ! -e "$path" ]; then
    echo "Erro: '$path' does not exist"
    exit 1
fi

: 'Evaluate the type of the file or directory
    -f check for file
    -d check for directoty
    -r check weather file or dir is readable or not
    -w check weather file or dir is writable or not
    -x check weather file or dir is executable or not
'

if [ -f "$path" ]; then
    echo "File Type"
fi

if [ -d "$path" ]; then
    echo "dir type"
fi

if [ -r "$path" ]; then
    echo "$path is readable."
fi

if [ -w "$path" ]; then
    echo "$path is writable."
fi

if [ -x "$path" ]; then
    echo "$path is executable/searchable."
fi

