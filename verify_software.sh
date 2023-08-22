#! /usr/bin/bash

: 'In this script we check weather the software is installed or
    or not using which or command -v
'

# List of software to check
software=("curl" "vim" "git")

echo "Checking for installed software..."

for s in "${software[@]}"; do
    if command -v "$s" &>/dev/null; then
        echo "$s is installed."
    else
        echo "$s is not installed."
    fi
done

# Check other software by scaning its name from the user
echo "Want verify other softwares, enter the software name: "

read -re software_name

# Remove leading and trailing whitespace
software_name=$(echo "$software_name" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

if command -v "$software_name" &>/dev/null; then
    echo "$software_name is installed."
else
    echo "$software_name is not installed."
fi


