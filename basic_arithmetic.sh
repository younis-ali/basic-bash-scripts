#! /usr/bin/bash

: 'In this script we accept an number and option from the user
    based on the given option we perform the following
        1. Check even or odd
        2. Check prime or not
        3. Factorial
        4. Convert to binary
'

# Fucntion to check weather a number is even or not
is_even_odd() {
    if [ $((n % 2)) -eq 0 ]; then
        echo "Even"
    else
        echo "Odd"
    fi
}

# Prime test
is_prime() {
    for ((i = 2; i <= n / 2; i++)); do
        if [ $((n % i)) -eq 0 ]; then
            echo "Not Prime"
            return
        fi
    done
    echo "Prime"
}

# Compute factorial
factorial() {
    fact=1
    for ((i = 1; i <= n; i++)); do
        fact=$((fact * i))
    done
    echo "Factorial: $fact"
}

# Convert number to binary
to_binary() {
    echo "Binary: $(echo "obase=2; $n" | bc)"
}


# Check for Armstrong
is_armstrong(){
    arm=0
    temp=$n
    while [ "$n" -ne 0 ]; do
        r=$((n % 10))
        arm=$((arm + r * r * r))
        n=$((n / 10))
    done
    echo $arm
    if [ $arm -eq "$temp" ]; then
        echo "'$arm' is Armstrong"
    else
        echo "'$arm' is not Armstrong"
    fi
}


echo "Enter any number: "
read -re n


echo "Select an option:"
echo "1. Check even or odd"
echo "2. Check prime or not"
echo "3. Factorial"
echo "4. Convert to binary"
echo "5. Check Armstrong or not"
read -r option


case $option in
    1) is_even_odd ;;
    2) is_prime ;;
    3) factorial ;;
    4) to_binary ;;
    5) is_armstrong;;
    *) echo "Invalid option" ;;
esac

