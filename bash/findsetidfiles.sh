#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turn on
#it is for the lab1 exercise

#Task 1 for the exercise is to modify it to also find and display the setgit files in a second listing
#The second listing should display after the setuid fils list, and be formatted similar to the setuid file list

#Task 2 for the exercise is to modify it to also display the 10 largest files in the system, sorted by their sizes
# THe listing should include the file name, owner, and size in MBytes and be displayed after the listings of setuid and setgid files

echo "Setuid files:"
echo "============="
find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 3

echo "Setgit files:"
echo "============="
find / -type f -executable -perm -2000 -ls 2>/dev/null | sort -k 3

echo "10 largest files"
find / 2>/dev/null -type f -exec ls -l --block-size=M {} + | sort -rh -k 5 | head -n 10
