#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data
# TASK 2: Improve it by rewriting it to use the if command
# TASK 3: Improve it by giving them 3 tries to get it right before failing (test 3 times but only if necessary)
#           *** Do not use the exit command

referenceString="password"
# TASK 1: Improve it by asking the user for a password guess
  read -s -p "Enter Password: " guess

# TASK 2: Improve it by rewriting it to use the if command

if [ $guess != $referenceString ];then
  echo "Sorry, wrong password"
else
  echo "Correct password"

fi

# TASK 3: Improve it by giving them 3 tries to get it right before failing
n=1
while [ $n -le 3 ] && [ $guess != $referenceString ];
do
  read -s -p "Please Enter Password Again: " guess
  n=$((n+1))
done
