#!/usr/bin/env bash

# Author: Jonathon Gebhardt
# Class: CS4900-B90
# Instructor: Dr. John Nehrbass
# Assignment: Homework 1
# GitHub: https://github.com/jonathondgebhardt/bash-sum-and-average

# Attempt to follow usage statement convention.
# http://courses.cms.caltech.edu/cs11/material/general/usage.html
show_help()
{
    echo "Usage: $0 [-h] [-v] [n1, n2, ...]" 
    echo "  -h: Shows help message"
    echo "  -v: Shows version"
    echo "  n1, n2, etc.: numbers to sum and average"
}

# Attempt to follow semantic versioning.
# https://semver.org/
show_version()
{
    echo "$0 version 0.1.0"
}

# Only integer values are allowed. Report invalid input and quit if this
# is the case.
# https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash
validate_input()
{
    shouldQuit=0

    for n in $numbers
    do
        # Check if the length of n is non-zero and do equality check on
        # n with itself. Equality check will fail for letters and float
        # values.
        if [ -n "$n" -a  "$n" -eq "$n" ] 2>/dev/null; then
            : 
        else
          echo "$n is not an integer" 
          shouldQuit=1
        fi
    done

    if [ "$shouldQuit" -gt "0" ]; then
        exit 1
    fi
}

# Parse arguments.
# https://dustymabe.com/2013/05/17/easy-getopt-for-a-bash-script/
while getopts "hv" option; do
    case $option in
    h)
        show_help 
        exit 0
        ;;
    v)
        show_version 
        exit 0
        ;;
    esac
done

numbers=$*
validate_input

sum=0
for n in $numbers
do
    sum=$(($sum + n))
done

# Get average of sum by redirecting to bc. 
# https://askubuntu.com/questions/229446/how-to-pass-results-of-bc-to-a-variable
average=$(bc <<< "scale=2;$sum / $#")

echo "Sum:" $sum
echo "Average:" $average

exit 0;
