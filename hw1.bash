#!/usr/bin/env bash

# Author: Jonathon Gebhardt
# Class: CS4900-B90
# Instructor: John Nehrbass
# Assignment: Homework 1

# Input: Any number of integer inputs accepted
# Output: Report the sum and average of the given input

# Optional:
#   Format output
#
#   Validate input and provide feedback when it's invalid
#
#   Help
#       ?
#       -h
#       -help
#       help
#
#   Version
#       -v
#       -version

# Attempt to follow usage statement convention.
# http://courses.cms.caltech.edu/cs11/material/general/usage.html
show_help()
{
    echo "Usage: $0 [-h] [-v] [n1, n2, ...]" 
    echo "  -h: Shows help message"
    echo "  -v: Shows version"
    echo "  n1, n2, etc.: numbers to sum and average"
}

show_version()
{
    echo "$0 version 0.1"
}

# https://dustymabe.com/2013/05/17/easy-getopt-for-a-bash-script/
while getopts "hv" option; do
    case $option in
    h)
        show_help 
        exit 0;
        ;;
    v)
        show_version 
        exit 0;
        ;;
    esac
done

numbers=$*

# Validate input

total=0
for n in $numbers
do
    total=$(($total + n))
done

# Get average of total by redirecting to bc. 
# https://askubuntu.com/questions/229446/how-to-pass-results-of-bc-to-a-variable
average=$(bc <<< "scale=2;$total / $#")

echo "Sum:" $total
echo "Average:" $average

exit 0;
