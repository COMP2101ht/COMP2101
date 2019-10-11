#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
#
# Sample output:
#   Hostname        : hostname
#   LAN Address     : 192.168.2.2
#   LAN Hostname    : host-name-from-hosts-file
#   External IP     : 1.2.3.4
#   External Name   : some.name.from.our.isp

# Task 1: Add a section to the script to define variables which hold the output data for
#         each output item and move the commands which generate the data to that section so that
#         the output command only outputs the labels and single variables.

# Task 2: Add output items for the default router's name and IP address,
#         adding a name to your /etc/hosts file as needed.
# e.g.
#   Router Address  : 192.168.2.1
#   Router Hostname : router-name-from-hosts-file

# Task 3: Add output items for the network's name and IP address, adding a name to your /etc/networks file as needed.
# e.g.
#   Network Number. : 192.168.2.0
#   Network Name    : network-name-from-networks-file

# we use the hostname command to get our system name
# the LAN name is looked up using the LAN address in case it is different from the system name
# finding external information relies on curl being installed and relies on live internet connection
# awk is used to extract only the data we want displayed from the commands which produce extra data
# this command is ugly done this way, so generating the output data into variables is recommended to make the script more readable.
# e.g.
#   interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')

cat <<EOF
Hostname        : $(hostname)
LAN Address     : $(ip a s $(ip a |awk '/: e/{gsub(/:/,"");print $2}')|awk '/inet /{gsub(/\/.*/,"");print $2}')
LAN Hostname    : $(getent hosts $(ip a s $(ip a |awk '/: e/{gsub(/:/,"");print $2}'))|awk '/inet /{gsub(/\/.*/,"");print $2}' | awk '{print $2}')
External IP     : $(curl -s icanhazip.com)
External Name   : $(getent hosts $(curl -s icanhazip.com) | awk '{print $2}')
EOF

# TASK 1:

echo "---------IMPROVE---------"

myhostname=$(hostname)
interface=$(ip a | awk '/: e/{gsub(/:/,"");print $2}')
LANaddress=$(ip a s $interface | awk '/inet /{gsub(/\/.*/,"");print $2}')
LANhostname=$(getent hosts $LANaddress | awk '{print $2}')
ExternalIP=$(curl -s icanhazip.com)
Externalname=$(getent hosts $ExternalIP | awk '{print $2}')

cat <<EOF
Hostname          : $myhostname
LAN Address       : $LANaddress
LAN hostname      : $LANhostname
EXternal IP       : $ExternalIP
External name     : $Externalname
EOF


#TASK 2:
router_hostname=$(getent hosts "$(ip route show | awk '/default/ {print $3}')" | awk '{print $2}')
router_address=$(ip route show | grep default | awk '{print $3}')

cat <<EOF
Router Address    : $router_address
Router Hostname   : $router_hostname
EOF

#TASK 3:
Network_number=$(getent networks | awk '{print $2}')
Network_name=$(getent networks | awk '{print $1}')

cat <<EOF
Network Number    : $Network_number
Network Name      : $Network_name
EOF
