#! /usr/bin/bash

# Get system information and store in respective variables
hostname=$(hostname)    # retrieves system's hostname
kernel=$(uname -r)  # retrieves kernal version
uptime=$(uptime -p)  # system uptime in humman readable format
arch=$(uname -m)    # gives system architecture

echo "System Information"
echo "  Hostname: '$hostname'"
echo "  Kernel: '$kernel'"
echo "  System Architecture: '$arch'"
echo "  System Uptime: '$uptime'"

# show last 5 logins by executing command, without saving in any variable
echo "Last logins:"
last -a | head -3

# Get memory information
memory_total=$(free -h | awk '/Mem:/ {print $2}')
memory_used=$(free -h | awk '/Mem:/ {print $3}')
memory_available=$(free -h | awk '/Mem:/ {print $7}')
echo "Memory:"
echo "  Total: $memory_total"
echo "  Used: $memory_used"
echo "  Available: $memory_available"

#Get CPU information
cpu_model=$(cat /proc/cpuinfo | grep "model name" | head -n 1 | cut -d ':' -f 2 | sed 's/^ *//')
cpu_cores=$(nproc)
cpu_load=$(uptime | awk -F 'load average:' '{print $2}' | awk '{print $1 $2 $3}')
echo "CPU:"
echo "  Model: $cpu_model"
echo "  Cores: $cpu_cores"
echo "  Load Average: $cpu_load"

# Get disk usage information
disk_usage=$(df -h /)
echo "Disk Usage:"
echo "$disk_usage"

# Top 3 expensive processes
top_3=$(top -b | head -3)
echo "Expensive processes"
echo "   $top_3"

################# We can write all this information to a text file #######################

# Redirect output to a text file
output_file="server_report.txt"

{
    echo "Server Report"
    echo "-------------"
    echo "Hostname: $hostname"
    echo "Kernel Version: $kernel"
    echo "Uptime: $uptime"
    echo "Architecture: $arch"
    echo "Memory:"
    echo "  Total: $memory_total"
    echo "  Used: $memory_used"
    echo "  Available: $memory_available"
    echo "CPU:"
    echo "  Model: $cpu_model"
    echo "  Cores: $cpu_cores"
    echo "  Load Average: $cpu_load"
    echo "Disk Usage:"
    echo "$disk_usage"
} > "$output_file"

echo "Server information saved to '$output_file'"