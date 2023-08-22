#! /usr/bin/bash

# echo "Hello world"

# ########### Example of Systme Variables ############
# echo 'The bash is ' $BASH
# echo $BASH_VERSION
# echo $PWD
# echo $HOME

# ################# Example of User defined varables ##########
# name=Younis
# value=10
# echo 'My name is ' $name
# echo 'The value is ' $value

# ############## Read inputs from the user ##################
# echo 'Enter your name: '
# read name
# echo 'Enter marks obtained in three subjects: '
# read val1 val2 val3 # Enter multiple values

# read -p 'user name: ' usr_name   # Single line prompt and read user input
# echo $usr_name

# echo 'Enter names'
# read -a names   # Read array of names
# echo ${names[1]}


################## Passing Arguments to the script ###################

# echo $0 $1 $2 'Echo the passing arguments'
# args-("$@")     # Parsing arguments as an array
# echo ${args[1]}

#!/usr/bin/bash

# Set the threshold in percentage (e.g., 90 for 90%)
threshold=90

# Get the current disk usage percentage for the root filesystem
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

# Compare disk usage with the threshold
if [ "$disk_usage" -gt "$threshold" ]; then
    echo "Disk space usage is above the threshold ($threshold%)"
    
    # Add notification command here (e.g., send an email or use a messaging service)
    # Example: mail -s "Disk Space Warning" your@email.com <<< "Disk space usage is above $threshold%"
else
    echo "Disk space usage is within the threshold ($threshold%)"
fi
