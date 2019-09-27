#!/bin/bash
#
# This script produces the dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Improve this script by using the value in the automatic variable $USER for the name
# Improve this script by adding some time and day of the week information to the welcome message
#   Use a format like this:
#   It is HH:MM AM on weekday.

###############
# Variables   #
###############


date=$(date)
title="Overlord"
myname="dennis"
user=$(whoami)

###############
# Main        #
###############

welcome=$(Welcome to planet $user, "$title $myname!")
date=$(Today is $date)
output=$welcome $date
cowsay -f $output
