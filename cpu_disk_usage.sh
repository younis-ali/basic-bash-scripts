#! /usr/bin/bash
: 'In thi script we use two commands
    1. df -h / | awk 'NR==2 {print $5}' | tr -d '%' 
        fetches the disk usage percentage for the root filesystem
        and removes the percentage sign.
    2. uptime | awk -F 'load average:' '{print $2}' | awk '{print $1}'
        fetches the CPU load average from the uptime command output.
'

########### For Disk #################
# Set the threshold in percentage (e.g., 90 for 90%)
threshold=90

# Get the current disk usage percentage for the root filesystem
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

# Compare disk usage with the threshold
if [ "$disk_usage" -gt "$threshold" ]; then
    echo "Disk space usage is above the threshold ($threshold%)"
else
    echo "Disk space usage is within the threshold ($threshold%)"
fi


############## For CPU ###############
# Set the threshold for CPU load average (e.g., 2.0 for 2.0)
threshold=2.0

# Get the current CPU load average
cpu_load=$(uptime | awk -F 'load average:' '{print $2}' | awk '{print $1}')

# Compare CPU load with the threshold
if (( $(echo "$cpu_load > $threshold" | bc -l) )); then
    echo "CPU load average is above the threshold ($threshold)"
else
    echo "CPU load average is within the threshold ($threshold)"
fi



